# 实验 7：并行

截止日期：11 月 14 日（周四），11:59:59 PM PT

[实验PPT](https://web.archive.org/web/20241219154537/https://docs.google.com/presentation/d/1a5IOvSyLCZtPt7FOZ5bcx0e7s42Dt9nR9nvhAzMU2sA/edit?usp=sharing)

## 环境设置

!!!INFO
    **你必须在Hive机器上完成（本实验而非本地机器）**。如需重新配置Hive机器环境，**请参考Lab 0的说明**。**本次实验需使用Hive机器组**：`hive1-hive30`（替代`s275`、`s277`等旧机器）。

在 hive 机器的`labs`目录中，拉取你在过去实验中可能做过的更改：

```bash
git pull origin main
```

仍然在 hive 机器的`labs`目录中，拉取本实验的文件：

```bash
git pull starter main
```

如果遇到任何`git`错误，请查看[常见错误](https://web.archive.org/web/20241219154537/https://cs61c.org/fa24/resources/common-errors/)页面。

## 概述

在本课程中，我们涵盖三种主要的并行性类型：

- 数据级并行性（SIMD）
- 线程级并行性（OpenMP）
- 进程级并行性（Open MPI）

本实验将涉及数据级并行性（DLP）和线程级并行性（TLP）。你将在作业和项目中接触到其他形式的并行性。

## SIMD

阅读[Intel Intrinsics Guide](https://web.archive.org/web/20241219154537/https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html)以了解可用的 SIMD 指令（内部函数是一种其实现由编译器处理的函数）。[Intrinsics Naming and Usage documentation](https://web.archive.org/web/20241219154537/https://software.intel.com/content/www/us/en/develop/documentation/cpp-compiler-developer-guide-and-reference/top/compiler-reference/intrinsics/naming-and-usage-syntax.html)将有助于理解该文档。

hive 机器支持 SSE、SSE2、SSE3、SSSE3、SSE4.1、SSE4.2、AVX 和 AVX2，因此你可以在过滤器列表中勾选这些选项。其他一些指令集也受支持，但在本实验中我们可以忽略它们。

虽然本节没有需要提交的内容，但阅读文档对本实验的其他练习和项目 4 非常有用。

------

## 示例：循环展开

`ex1.c`中的`sum()`函数是一个未优化的实现，用于对大型数组（约`2^16`个元素）中值大于等于`128`的元素求和。我们使用一个外层循环重复求和`OUTER_ITERATIONS`（约`2^14`）次，以便我们可以进行更准确的运行时间测量来计算加速比。我们通过计算开始和结束时间戳（使用`clock()`）之间的差值来计时代码的执行。文件`ex1_test.c`包含一个`main`函数，用于运行各种`sum`函数并计算它们的加速比。

让我们看看`sum_unrolled()`。这个函数是将`sum`函数展开四次的结果。内层循环每次迭代处理 4 个元素，而`sum()`中的内层循环每次迭代处理 1 个元素。注意主循环后的额外循环 —— 由于主循环以 4 个元素为一组遍历数组，我们需要一个尾部循环来处理长度不是 4 的倍数的数组。

在本实验中，我们提供了`Makefile`，因此请使用提供的`make`命令而不是`gcc`来编译你的代码。尝试编译并运行代码：

```bash
make ex1
./ex1
```

展开后的函数应该会快一点，虽然不会快太多。

问题：如果循环展开有帮助，为什么我们不把所有循环都展开？

- 展开后的代码更难读和写。除非你打算再也不看这段代码，否则代码的可读性可能会超过循环展开的好处！
- 有时，编译器会自动展开你写的简单循环！重点是 “有时”—— 很难弄清楚现代编译器会执行哪些神奇的操作（见下一段中的 Godbolt）。为了演示，在本实验中我们禁用了编译器优化。
- 循环展开意味着更多的指令，这意味着更大的程序和可能更差的缓存行为！
- 我们在`ex1.c`中的简化示例使用已知的数组大小。如果你不知道你正在处理的数组的大小，你展开的循环可能不适合该数组！



可选：你可以通过将代码输入到这个[链接](https://web.archive.org/web/20241219154537/https://piotte13.github.io/SIMD-Visualiser/#/)的代码环境中，来可视化向量和不同函数如何协同工作！

另一个可能帮助你理解 SIMD 指令行为的有趣工具是[Godbolt Compiler Explorer](https://web.archive.org/web/20241219154537/https://godbolt.org/z/J7HXBk)项目。当你需要优化任何代码时，它也可以提供很多见解。

------

## 练习 1：编写 SIMD 代码

以下代码演示了如何使用 SIMD 指令对一个 8 元素的整数数组求和。在这个例子中，我们的寄存器是 128 位，整数是 32 位。这意味着我们可以在一个寄存器中放入 4 个整数。运行

```c
int arr[8] = {3, 1, 4, 1, 5, 9, 2, 6};
// 初始化求和向量为{0, 0, 0, 0}
__m128i sum_vec = _mm_setzero_si128();

// 将数组元素0-3加载到临时向量寄存器
__m128i tmp = _mm_loadu_si128((__m128i *) arr);
// 添加到现有的求和向量
sum_vec = _mm_add_epi32(sum_vec, tmp);
// sum_vec = {3, 1, 4, 1}

// 将数组元素4-7加载到临时向量寄存器
tmp = _mm_loadu_si128((__m128i *) (arr + 4));
// 添加到现有的求和向量
sum_vec = _mm_add_epi32(sum_vec, tmp);
// sum_vec = {3 + 5, 1 + 9, 4 + 2, 1 + 6}

// 创建临时数组来保存sum_vec的值
// 我们必须将向量存储到数组中才能访问各个值（如下所示）
int tmp_arr[4];
_mm_storeu_si128((__m128i *) tmp_arr, sum_vec);
// 将sum_vec中的值收集到一个整数中
int sum = tmp_arr[0] + tmp_arr[1] + tmp_arr[2] + tmp_arr[3];
```

对 8 个元素求和需要做很多工作。然而，这个过程极大地提高了对大型数组元素求和的性能。

1. **实现**`sum_simd()`，一个`sum()`的向量化版本。
2. **复制你的**`sum_simd()`代码到`sum_simd_unrolled()`并将其展开4 次。不要忘记尾部情况！

### 提示

- 你只需要用 SIMD 对内部循环进行向量化。可以使用以下内部函数来实现：
  - `__m128i _mm_setzero_si128()` - 返回一个 128 位的零向量
  - `__m128i _mm_loadu_si128(__m128i *p)` - 返回存储在指针`p`处的 128 位向量
  - `__m128i _mm_add_epi32(__m128i a, __m128i b)` - 返回向量`(a_0 + b_0, a_1 + b_1, a_2 + b_2, a_3 + b_3)`
  - `void _mm_storeu_si128(__m128i *p, __m128i a)` - 将 128 位向量 a 存储到指针`p`处
  - `__m128i _mm_cmpgt_epi32(__m128i a, __m128i b)` - 返回向量`(a_i > b_i ? 0xffffffff : 0x0 for i from 0 to 3)`。换句话说，如果`a[32*i : 32*(i+1)] > b[32*i : 32*(i+1)]`，则`out[32*i : 32*(i+1)]`全为 1，否则全为 0。
  - `__m128i _mm_and_si128(__m128i a, __m128i b)` - 返回向量`(a_0 & b_0, a_1 & b_1, a_2 & b_2, a_3 & b_3)`，其中 & 表示按位与运算符
- 不要在内部循环完成之前使用存储函数（`_mm_storeu_si128`）！事实证明，存储操作的成本很高，在每次迭代中执行存储实际上会导致代码变慢。然而，如果你等到外部循环完成后再存储，可能会有溢出问题。
- 仔细阅读上面表格中的函数声明！你会注意到 loadu 和 storeu 接受`__m128i*`类型的参数。你可以将一个`int`数组转换为`__m128i`指针。

### 测试

要编译和运行你的代码，请运行以下命令（提醒：请使用`make`，而不是`gcc`）：

```bash
make ex1
./ex1
```

在 hive 机器上， naive 版本的运行时间约为 7 秒，你的 SIMD 化版本应该在 1-2 秒内运行完。展开的 SIMD 化版本比`sum_simd`稍快，但很可能只快几分之一秒。

自动评分器的测试与`ex1_test.c`中的类似，但可能有不同的常量（`NUM_ELEMS`和`OUTER_ITERATIONS`）和降低的加速比要求（以补偿自动评分器资源的更多可变性）。

### 常见错误

以下是工作人员在本练习的实现中注意到的常见错误。

- **忘记尾部情况中的条件**：在添加内容到求和结果之前，我们一直在检查什么条件？
- **添加到未初始化的数组**：如果你在没有初始化结果数组的情况下向其中添加内容，你是在向垃圾数据添加内容，这会使数组仍然是垃圾数据！
- **重新初始化求和向量**：确保你没有为内部循环的每次迭代创建一个新的求和向量！
- **尝试将求和向量存储到`long long int`数组中**：使用 int 数组。这个函数的返回值确实是`long long int`，但这是因为`int`不足以容纳所有外部循环迭代中所有值的总和。`long long int`和`int`有不同的位宽，所以将`int`数组存储到`long long int`中会产生不同的数字！

### 一般 SIMD 建议

关于使用 SIMD 指令的一些一般建议：

- 注意内存对齐。例如，`_m256d _mm256_load_pd (double const * mem_addr)`不能处理未对齐的数据 —— 你需要`_m256d _mm256_loadu_pd`。同时，如果你可以控制内存分配，保持数据对齐几乎总是可取的（可以使用特殊的内存分配 API 来实现）。对齐的加载可以作为内存操作数折叠到其他操作中，这会稍微减少代码大小和吞吐量。现代 CPU 对未对齐加载有很好的支持，但当加载跨越缓存行边界时，仍然会有显著的性能损失。
- 回想一下本学期早些时候你学到的各种 CPU 流水线冒险。数据冒险会严重影响性能。也就是说，如果你没有得到期望的性能，你可能需要检查相邻 SIMD 操作中的数据依赖关系。

## OpenMP

OpenMP 代表Open specification for Multi-Processing（开放式多处理规范）。它是一个提供 C 接口的框架。它不是 C 语言的内置部分 —— 大多数 OpenMP 特性是编译器指令。（你过去见过的一个编译器指令示例是`#include`。）

使用 OpenMP 进行多线程编程的好处包括：

- 一个非常简单的接口，允许程序员将程序分为串行区域和并行区域。
- 方便的同步控制（线程中的数据竞争错误很难追踪）。

## 示例：OpenMP Hello World

考虑示例 hello world 程序（`openmp_example.c`），它从每个线程打印`"hello world from thread #"`：

```c
int main() {
    #pragma omp parallel
    {
        int thread_id = omp_get_thread_num();
        printf("hello world from thread %d\n", thread_id);
    }
}
```

这个程序将创建一组并行线程。每个线程打印一个 hello world 消息，以及它自己的线程编号。

让我们分解`#pragma omp parallel`行：

- `#pragma`告诉编译器，该行的其余部分是一个指令。
- `omp`声明该指令是针对 OpenMP 的。
- `parallel`表示下面的块语句 —— 大括号（`{`/`}`）内的部分 —— 应该由不同的线程并行执行。

**重要在编写你自己的代码时**，确保将左大括号放在新的一行。不要把它和指令放在同一行。

你可以通过设置环境变量`OMP_NUM_THREADS`或在程序中的并行部分之前使用[`omp_set_num_threads`](https://web.archive.org/web/20241219154537/https://gcc.gnu.org/onlinedocs/libgomp/omp_005fset_005fnum_005fthreads.html)函数来更改 OpenMP 线程的数量。

尝试运行程序：

```bash
make openmp_example
./openmp_example
```

如果你多次运行`./openmp_example`，你可能会注意到打印的数字并不总是按递增顺序排列，而且很可能在不同的运行中有所不同。这是因为我们没有指定任何类型的同步选项，所以 OpenMP 不会强制执行任何执行顺序。（稍后会有更多相关内容。）同样重要的是要注意，变量`thread_id`是在并行块内部定义的，这意味着每个线程都有自己的`thread_id`副本。一般来说，在 OpenMP 中，在并行块内部声明的变量是每个线程私有的，而在并行块外部声明的变量在所有线程之间共享。有一些方法可以覆盖这一点，但稍后会详细介绍。

## OpenMP 指令

OpenMP 指令的用法可以在[OpenMP 摘要卡](https://web.archive.org/web/20241219154537/https://inst.eecs.berkeley.edu/~cs61c/sp21/resources-pdfs/OpenMP3.0-SummarySpec.pdf)上找到。

### For

在作业 9 中，你手动将`for`循环中的迭代分配给各个线程。OpenMP 可以使用`for`指令自动处理这个问题！你可以在现有的`#pragma omp parallel`中添加`#pragma omp for`到一个`for`循环，或者单独使用`#pragma omp parallel for`。

### Critical

临界区中的代码在任何时候只能由单个线程执行。因此，拥有临界区自然可以防止多个线程读写相同的数据，否则会导致数据竞争。OpenMP 提供了`critical`原语，允许你在临界区中执行计算。

### Reduction

临界区可能很慢，因此 OpenMP 有一种内置的方法通过使用`reduction`关键字来减少这个问题。`reduction`关键字将通过自动减少临界区中包含的代码量来提高代码的并行性。要使用这个关键字，你必须指定应该在临界区中的变量以及对该变量执行的操作。

## 练习 2：OpenMP 点积

乍一看，实现点积似乎与练习 1 中的`v_add`没有太大不同，因为我们现在只需要执行元素级乘法而不是加法。挑战在于如何将乘积添加到一个变量中（也就是归约）以得到我们的最终答案。如果多个线程试图同时将它们的结果添加到同一个变量中，**将会导致数据竞争**，这将导致不正确的结果。

现在尝试运行测试，只有 naive 解决方案应该通过，因为其他优化尚未实现。

```bash
make ex2
./ex2
```

1. 使用 OpenMP 和临界区实现`dotp_critical`。
   - 注意，随着线程数量的增加，性能会变得更差吗？通过将所有归约工作放在临界区中，我们已经扁平化了并行性，使得一次只有一个线程可以做有用的工作（这与线程级并行性的理念不完全一致）。
   - 这种竞争是有问题的；每个线程都在不断争夺临界区，并且在任何时候只有一个线程在取得进展。随着线程数量的增加，竞争也会增加，性能也会受到影响。
2. 使用 OpenMP 和归约语句实现`dotp_reduction`。
   - 提示：应该一次只能由一个线程访问的变量是`global_sum`，对它执行的操作是加法（`+`）。
3. 使用 OpenMP 和归约的思想实现`dotp_manual_reduction`，但不要使用`reduction`关键字。
   - 提示：为每个线程创建变量，并且仅在绝对必要时才累加到最终总和中。在你的解决方案中，你可能需要使用` #pragma omp critical`。

## 练习 3：反思与反馈表

我们一直在努力每周改进这门课程 —— 请填写这份 [调查问卷](https://web.archive.org/web/20241219154537/https://docs.google.com/forms/d/e/1FAIpQLSclCTiQJ2yuf1jCxfHGyRgiOxAEYW4sdARCpw5YEO1sbT7mtA/viewform?usp=sf_link)，告诉我们你目前在讨论课和实验中的体验！

## 提交方式

保存、提交（commit）并推送（push）你的作业，然后在 Gradescope 上提交到 “实验 7” 作业中。