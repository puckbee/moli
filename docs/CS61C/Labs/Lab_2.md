# Lab 2：C 语言调试

在本次实验中，请按照列出的顺序完成各个练习。练习之间可能互相依赖。

[实验幻灯片（Berkeley校内）](https://docs.google.com/presentation/d/1rJ81qVQORpyaox744ocJ66UrQPZl6FvrNl1giFQWJHk/edit?usp=sharing)

------

## 环境准备

你必须在 hive 机器上完成本次实验。有关使用 hive 机器的复习，请参见 [Lab 0](https://cs61c.org/sp25/labs/lab00/)。

在你的 `labs` 目录中，使用以下命令拉取本次实验的文件：

```bash
git pull starter main
```

如果你遇到如下错误：

```txt
fatal: 'starter' does not appear to be a git repository
fatal: Could not read from remote repository.
```

请确保将 starter 远程仓库设置为：

```bash
git remote add starter https://github.com/61c-teach/sp25-lab-starter.git
```

然后再次运行上面的命令。

如果遇到任何 `git` 错误，请查看 [常见错误](https://cs61c.org/sp25/resources/common-errors/) 页面。

------

## 练习 1：编译器警告和错误

编译器警告用于帮助你发现代码中的潜在错误。在运行代码之前，请确保修复所有编译器警告。这将节省你大量调试时间，因为修复编译器警告通常比手动查找错误快得多。

1. **阅读** `ex1_compiler_warnings.c` 中的代码。
2. 使用 `gcc -o ex1_compiler_warnings ex1_compiler_warnings.c` 编译程序。你应该会看到 3 条警告。
3. **阅读** 第一条警告的第一行。该行以 `ex1_compiler_warnings.c:13:22` 开头，告诉你警告在第 13 行第 22 列。警告指出程序试图将一个 `char` 赋值给 `char *`。
4. **打开** `ex1_compiler_warnings.c` 并定位到导致警告的那一行。该行试图将 `char` 赋值给 `char *`。编译器指出这是一个潜在错误，因为不应该将 `char` 赋给 `char *`。
5. **修复** 此编译器警告。
6. **重新编译** 你的代码。你会发现该警告消失，剩余 2 条警告。
7. **修复** `ex1_compiler_warnings.c` 中剩余的警告。此时你的代码应能正常工作。

## 什么是 GDB？

以下内容摘自 [GDB 官方网站](https://www.gnu.org/software/gdb/)：

GDB（GNU 项目调试器）允许你在程序执行时或程序崩溃时，查看程序内部的运行情况。

GDB 可以做以下四类主要操作（以及其它辅助功能），帮助你捕捉 bug：

- 启动你的程序，并指定可能影响其行为的参数。
- 在满足指定条件时，让程序暂停执行。
- 在程序暂停时，检查程序状态。
- 修改程序中的内容，以便你可以尝试修复一个 bug 并继续调试下一个。

在本课程中，我们将使用 [CGDB](https://cgdb.github.io/)，它提供了一个轻量级界面来简化 gdb 的使用。CGDB 已经安装在 hive 机器上，因此无需安装。以下内容中，CGDB 和 GDB 将交替使用。

这是一个 [GDB 参考卡](https://inst.eecs.berkeley.edu/~cs61c/resources/gdb5-refcard.pdf)。

如果使用 GDB 时遇到任何问题，请参见下文的 [常见 GDB 错误](https://cs61c.org/sp25/labs/lab02/#common-gdb-errors) 部分。```

## 练习 2：GDB 入门

在本部分中，你将学习 GDB 命令 `start`、`step`、`next`、`finish`、`print` 和 `quit`。本节将在过程中解决一个或多个 bug。在继续之前，请确保修复代码中的 bug。

下表总结了上述命令：

| 命令                                                      | 缩写  | 描述                                                            |
| --------------------------------------------------------- | ----- | --------------------------------------------------------------- |
| start                                                     | start | 开始运行程序并在 `main` 的第 1 行暂停                            |
| step                                                      | s     | 执行当前行代码（会进入函数内部）                                |
| next                                                      | n     | 执行当前行代码（不会进入函数内部）                              |
| finish                                                    | fin   | 执行当前函数剩余部分，并返回到调用函数                          |
| print [参数]（例如：`int n=3` 时，`print n` 会输出 3）    | p     | 打印参数的值                                                   |
| quit                                                      | q     | 退出 GDB                                                       |

你需要在 `ex2_commands.txt` 中填写对应的命令。请仅使用上表中的命令。**为保证正确性，我们将把你的 `ex2_commands.txt` 输出与预期输出进行比对。** 建议打开两个 SSH 窗口，一个查看 `ex2_commands.txt`，一个运行 `cgdb` 会话。虽然你在编辑 `ex2_commands.txt`，但请务必在 `cgdb` 中实际运行这些命令来检查结果。

1. **使用 `-g` 标志编译** 程序，以包含调试信息：

   ```bash
   gcc -g -o pwd_checker test_pwd_checker.c pwd_checker.c
   ```

2. **启动** `cgdb`（注意参数是可执行文件 `pwd_checker`，而不是源文件）：

   ```bash
   cgdb pwd_checker
   ```

   你现在应该能看到 CGDB 界面，上方窗口显示代码，下方窗口显示控制台。

对于以下每一步，将在 `ex2_commands.txt` 中添加你执行的 CGDB 命令。每条命令单独占一行。下面每一步可能需要一个或多个 CGDB 命令。

1. **使用一个命令** 启动程序，并让它暂停在 `main` 的第一行。
2. 第一行是对 `printf` 的调用，我们不想进入该函数。**跳过（step over）** 这行代码。
3. **执行到（step until）** 程序停在 `check_password` 调用处。注意带箭头的一行是当前行，但尚未执行。
4. **进入（step into）** `check_password`。
5. **进入（step into）** `check_lower`。
6. **打印（print）** `password` 的值（`password` 是一个字符串）。
7. **立即跳出（step out）** `check_lower`，不要等到函数自然返回。
8. **进入（step into）** `check_length`。
9. **执行到（step to）** 函数的最后一行。
10. **打印（print）** 函数的返回值，应该是 `false`。
11. **打印（print）** `length` 的值。看起来 `length` 是正确的，所以第 24 行逻辑应该有问题。
12. **退出（quit）** CGDB。CGDB 可能会询问是否退出，输入 `y`（但不要将 `y` 写入 `ex2_commands.txt`）。

此时，`ex2_commands.txt` 应包含上述命令列表。接下来的步骤不需添加到 `ex2_commands.txt`：

1. **修复** 第 24 行的 bug。
2. **编译** 并 **运行** 代码。
3. 程序仍然失败。重新在 `cgdb` 中单步调试，应能看到 `check_number` 现在出错。下一练习将处理该问题。

---

## 练习 3：更多 GDB

在本部分中，你将学习 GDB 命令 `break`、条件断点（conditional break）、`run` 和 `continue`。本节将在过程中解决一个或多个 bug。在继续之前，请确保修复代码中的 bug。

下表总结了上述命令：

| 命令                                                | 缩写   | 描述                                                                                 |
| --------------------------------------------------- | ------ | ------------------------------------------------------------------------------------ |
| break [行号或函数名]                                | b      | 在指定位置设置断点；使用 `filename.c:linenum` 可在特定文件的某行设置断点            |
| 条件断点（示例：`break 3 if n==4`）                | b 3 if n==4 | 只有在指定条件满足时才在该位置触发断点                                         |
| run                                                 | r      | 执行程序，直到结束或遇到断点                                                         |
| continue                                            | c      | 继续执行已暂停的程序                                                                 |
| backtrace                                           | bt     | 打印调用栈中各帧（每帧一行）                                                           |

你需要在 `ex3_commands.txt` 中填写对应的命令。请仅使用本表及练习 2 表中的命令。**为保证正确性，我们将把你的 `ex3_commands.txt` 输出与预期输出进行比对。** 同样建议两个 SSH 窗口，一个编辑命令文件，一个运行 CGDB。

1. **重新编译并运行** 代码，你会看到断言 `number` 失败。
2. **启动** CGDB：

   ```bash
   cgdb pwd_checker
   ```

对于以下每一步，将在 `ex3_commands.txt` 中添加你执行的 CGDB 命令。每条命令单独占一行。

1. **设置断点（break）** 到 `check_number` 函数（使用函数名，不要指定文件或行号）。断点应在 `check_password` 之外。
2. **运行（run）** 程序，直到命中刚才的断点。
3. **进入（step into）** `check_range`。
4. **查看调用栈（backtrace）**。
5. 因为密码中数字是在后面才出现的，我们可以使用条件断点跳过前面的非数字字符。第一个数字是 `0`，所以设置条件断点：**当 `letter == '0'` 时在第 31 行断点**。
6. **继续（continue）** 程序执行，直到断点。
7. 断点命中后，**打印（print）** `letter`，应显示 `48 '0'`。
8. **打印（print）** `is_in_range`，结果是 `false`，但 `'0'` 应该在范围内。
9. **打印（print）** `lower`。
10. **打印（print）** `upper`。
11. 你会发现 `lower` 的 ASCII 是 `\000`（空字符），`upper` 的 ASCII 是 `\t`（制表符），说明传入的是数字 `0` 和 `9` 而非字符 `'0'` 和 `'9'`。
12. **退出（quit）** CGDB。输入 `y`（但不要将 `y` 写入 `ex3_commands.txt`）。

此时，`ex3_commands.txt` 应包含上述命令列表。接下来的步骤不需添加到 `ex3_commands.txt`：

1. **修复** 该 bug。
2. **编译** 并 **运行** 代码。还有一个错误，将在 [练习 4：调试](https://cs61c.org/sp25/labs/lab02/#exercise-4-debug) 中发现并解决。

## 练习 4：调试

本练习为 **可选**。但是，使用 CGDB 进行调试对于项目 1 及以后的工作非常重要，因此我们强烈建议你练习以积累经验。

1. **使用** 你刚学到的命令自行调试 `check_upper`。该函数似乎在有大写字母时仍然返回 `false`。提示：bug 本身可能不在 `check_upper` 函数内部。
2. **修复** 该 bug。

## 练习 5：调试段错误（Segfault）

GDB 的一个非常重要的功能是调试段错误。本练习在不使用这些 GDB 工具的情况下也是可以完成的，但习惯使用它们对于后续实验和项目 1 都非常有帮助。请尽量按照说明，在不查看源代码的情况下，使用 GDB 终端找出答案。

在本练习中，你需要填写 `ex5_answers.txt`。

1. **编译** `ex5_segfault.c`。注意没有编译错误或警告，并且我们使用了 `-g` 标志，以便将来需要调试时使用。

   ```bash
   gcc -g -o ex5_segfault ex5_segfault.c
   ```

2. **运行** `ex5_segfault`。程序应当因段错误而崩溃。
3. **使用** `cgdb` 运行 `ex5_segfault`，并执行到段错误发生时，然后显示程序的 `backtrace`。
4. **仔细阅读** 输出，并在 `ex5_answers.txt` 中回答以下问题。请不要更改文件格式。

   1. 段错误发生在哪个函数中？（答案应为函数名）
   2. 哪一行代码导致了段错误？（答案应为单个数字，不带任何单位）

## Valgrind

即使使用调试器，我们也可能无法捕捉所有的 bug。有些 bug 我们称为 “bohrbugs”，它们会在一组定义良好但可能未知的条件下可靠地重现。另一些 bug 我们称为 “heisenbugs”，它们并不是确定性的，研究它们时往往会消失或改变行为。我们可以使用调试器检测第一类 bug，但第二类 bug（尤其在 C 语言中）通常由于内存管理不当而难以察觉。请记住，与其他编程语言不同，C 语言要求程序员手动管理内存。

我们可以使用一个名为 Valgrind 的工具来帮助捕捉这两类 bug。Valgrind 是一个模拟 CPU 并跟踪内存访问的程序。它会减慢被运行程序的速度（这也是为什么我们不会总是在 Valgrind 中运行所有可执行文件），但也能揭示仅在特定情况下才会显现的 bug。

让我们来看看 `bork` 翻译程序！Bork 是一种非常类似英语的古老语言。要将一个单词翻译成 Bork，只需在单词的每个元音后面添加一个 `f`。

我们先编译并运行 `bork`，试试看输出：

```bash
gcc -g -o bork bork.c
./bork hello
```

下面给出了一个示例输出。注意，你的输出可能有所不同。

```txt
Input string: "hello"
Length of translated string: 21
Translate to Bork: "hefl2?^?Ul2?^?Uof?^?U"
```

嗯，Bork 是一种古老的语言，但不应该出现这些奇怪字符。看来古人程序里藏着一些 bug！我们要不要开始消灭这些 bug，揭开 Bork 真正的魅力？

快速浏览 `main`，可以看到我们将输入字符串（`src_str`）翻译成 Bork 字符串（`dest_str`）。向上滚动到文件顶部，可以看到：有一个 `alloc_str` 函数用于在堆上分配字符串空间；一个包含字符串及其长度的 `Str` 结构体；一个创建并初始化该结构体的 `make_str` 函数；以及一个释放结构体数据的函数。还有一个连接两个字符串的函数和一个将单个字符翻译为 Bork 的函数。这个程序相当长，调试起来比较繁琐。

有没有一种工具能给我们一个很好的起点？

事实证明，有好几种，而 `valgrind` 就是其中之一！

下面我们用 `valgrind` 运行程序，看看它会报告什么：

```bash
valgrind ./bork hello
==10170== Memcheck, a memory error detector
==10170== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==10170== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
==10170== Command: ./bork hello
==10170==
==10170== Invalid read of size 1
==10170==    at 0x4C34D04: strlen (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==10170==    by 0x10879F: make_Str (bork.c:22)
==10170==    by 0x108978: translate_to_bork (bork.c:56)
==10170==    by 0x1089F2: main (bork.c:68)
==10170==  Address 0x522f041 is 0 bytes after a block of size 1 alloc'd
==10170==    at 0x4C31B0F: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==10170==    by 0x108781: alloc_str (bork.c:10)
==10170==    by 0x10895E: translate_to_bork (bork.c:54)
==10170==    by 0x1089F2: main (bork.c:68)
==10170==
==10170== Invalid read of size 1
==10170==    at 0x4C34D04: strlen (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==10170==    by 0x10879F: make_Str (bork.c:22)
==10170==    by 0x108952: translate_to_bork (bork.c:51)
==10170==    by 0x1089F2: main (bork.c:68)
==10170==  Address 0x522f0e2 is 0 bytes after a block of size 2 alloc'd
==10170==    at 0x4C31B0F: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==10170==    by 0x108781: alloc_str (bork.c:10)
==10170==    by 0x10892D: translate_to_bork (bork.c:48)
==10170==    by 0x1089F2: main (bork.c:68)
==10170==
==10170== Invalid read of size 1
==10170==    at 0x4C34D04: strlen (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==10170==    by 0x4E9B4A2: vfprintf (vfprintf.c:1643)
==10170==    by 0x4EA2EE5: printf (printf.c:33)
==10170==    by 0x108A6F: main (bork.c:74)
==10170==  Address 0x522f317 is 0 bytes after a block of size 7 alloc'd
==10170==    at 0x4C31B0F: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==10170==    by 0x108781: alloc_str (bork.c:10)
==10170==    by 0x108833: concat (bork.c:32)
==10170==    by 0x108A15: main (bork.c:69)
==10170==
Input string: "hello"
Length of translated string: 7
==10170== Invalid read of size 1
==10170==    at 0x4C34D04: strlen (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==10170==    by 0x4E9B4A2: vfprintf (vfprintf.c:1643)
==10170==    by 0x4EA2EE5: printf (printf.c:33)
==10170==    by 0x108A6F: main (bork.c:74)
==10170==  Address 0x522f317 is 0 bytes after a block of size 7 alloc'd
==10170==    at 0x4C31B0F: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==10170==    by 0x108781: alloc_str (bork.c:10)
==10170==    by 0x108833: concat (bork.c:32)
==10170==    by 0x108A15: main (bork.c:69)
==10170==
==10170== HEAP SUMMARY:
==10170==     in use at exit: 7 bytes in 1 blocks
==10170==   total heap usage: 11 allocs, 10 frees, 1,051 bytes allocated
==10170==
==10170== LEAK SUMMARY:
==10170==    definitely lost: 7 bytes in 1 blocks
==10170==    indirectly lost: 0 bytes in 0 blocks
==10170==      possibly lost: 0 bytes in 0 blocks
==10170==    still reachable: 0 bytes in 0 blocks
==10170==         suppressed: 0 bytes in 0 blocks
==10170== Rerun with --leak-check=full to see details of leaked memory
==10170==
==10170== For counts of detected and suppressed errors, rerun with: -v
==10170== ERROR SUMMARY: 6 errors from 3 contexts (suppressed: 0 from 0)
```

（有趣的旁注：当我们查看 `valgrind` 日志中的正常程序输出时，会发现它打印了 "hefllof"。这是因为 `valgrind` 运行程序的方式与程序“裸机”运行的方式不同。我们暂不深入讨论。）  

回到调试：在分析大型错误日志时，一个很好的经验法则是只关注第一条错误信息（忽略其余），我们就这样做：

```txt
==10170== Invalid read of size 1
==10170==    at 0x4C34D04: strlen (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==10170==    by 0x10879F: make_Str (bork.c:22)
==10170==    by 0x108978: translate_to_bork (bork.c:56)
==10170==    by 0x1089F2: main (bork.c:68)
```

错误信息指出我们进行了大小为 1 的无效读取。这是什么意思？“无效读取”表示程序在不该读取的内存地址读取数据（这可能导致段错误，但并不总是）。“大小为 1”即尝试读取 1 字节。

由于我们不熟悉这个古老的代码库，也不想通读全部代码来找 bug，一个不错的做法是从高层次的细节开始，然后逐步深入（也就是按照 valgrind 提供的调用栈来排查）。

让我们查看 `bork.c` 第 68 行的 `main`（调用栈的底部）：

```c
Str bork_substr = translate_to_bork(src_str.data[i]);
```

这里有什么异常吗？看起来只是将一个字符传给 `translate_to_bork`，暂时没问题。

继续深入调用栈，查看 `translate_to_bork` 的第 56 行：

```c
return make_Str(res);
```

这里只是调用 `make_Str`，我们再往下看，查看 `bork.c` 第 22 行：

```c
return (Str){.data=str,.len=strlen(str)};
```

在这里我们创建了一个新的 `Str` 结构体，并设置其 `data` 和 `len` 字段，看起来也没问题！

但 valgrind 却说 `strlen` 发生了无效读取？

我们确实是传递了一个字符串，strlen 会通过遍历字符直到遇到空终止符来计算长度。可能我们忘了加空终止符，strlen 就会越界读取超出分配范围的内存。

要确认，我们回到 `translate_to_bork` 的第 56 行：

```c
return make_Str(res);
```

向上两行（第 54 行）我们看到是在调用 `alloc_str` 来分配空间。来看这个函数：

```c
char *alloc_str(int len) {
    return malloc(len*sizeof(char));
}
```

这里 `alloc_str` 只分配了 `len` 个字节，没有为空终止符 `'\0'` 留空间！因此写入时无法添加终止符。

我们做如下修改来修复问题：

```diff
10c10,12
<     return malloc(len*sizeof(char));
---
>     char *data = malloc((len+1)*sizeof(char));
>     data[len] = '\0';
>     return data;
```

然后重新运行程序验证修复：

```bash
./bork hello
Input string: "hello"
Length of translated string: 7
Translate to Bork: "hefllof"
```

看起来一切正常了。但可能还有隐藏错误，我们再用 valgrind 检查：

```bash
valgrind ./bork hello
==29797== Memcheck, a memory error detector
==29797== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==29797== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
==29797== Command: ./bork hello
==29797==
Input string: "hello"
Length of translated string: 7
Translate to Bork: "hefllof"
==29797==
==29797== HEAP SUMMARY:
==29797==     in use at exit: 8 bytes in 1 blocks
==29797==   total heap usage: 11 allocs, 10 frees, 1,061 bytes allocated
==29797==
==29797== LEAK SUMMARY:
==29797==    definitely lost: 8 bytes in 1 blocks
==29797==    indirectly lost: 0 bytes in 0 blocks
==29797==      possibly lost: 0 bytes in 0 blocks
==29797==    still reachable: 0 bytes in 0 blocks
==29797==         suppressed: 0 bytes in 0 blocks
==29797== Rerun with --leak-check=full to see details of leaked memory
==29797==
==29797== For counts of detected and suppressed errors, rerun with: -v
==29797== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
```

我们可以看到退出时还有 8 字节未释放，接着查看泄漏详情：

```bash
valgrind --leak-check=full ./bork hello
==32334== Memcheck, a memory error detector
==32334== Copyright (C) 2002-2017, and GNU GPL'd, by …
==32334== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
==32334== Command: ./bork hello
==32334==
Input string: "hello"
Length of translated string: 7
Translate to Bork: "hefllof"
==32334==
==32334== 8 bytes in 1 blocks are definitely lost in loss record 1 of 1
==32334==    at 0x4C31B0F: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==32334==    by 0x108784: alloc_str (in /home/cc/cs61c/fa22/staff/cs61c-tac/bork)
==32334==    by 0x10884E: concat (in /home/cc/cs61c/fa22/staff/cs61c-tac/bork)
==32334==    by 0x108A30: main (in /home/cc/cs61c/fa22/staff/cs61c-tac/bork)
==32334==
==32334== LEAK SUMMARY:
==32334==    definitely lost: 8 bytes in 1 blocks
==32334==    indirectly lost: 0 bytes in 0 blocks
==32334==      possibly lost: 0 bytes in 0 blocks
==32334==    still reachable: 0 bytes in 0 blocks
==32334==         suppressed: 0 bytes in 0 blocks
==32334==
==32334== For counts of detected and suppressed errors, rerun with: -v
==32334== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
```

这里 valgrind 告诉我们泄漏是由 `concat` 调用 `alloc_str` 时分配的。查看 `main`，我们发现为 `dest_str` 分配后并未释放。我们需要在 `main` 返回前调用 `free_Str` 释放它：

```diff
76a77
>     free_Str(dest_str);
```

（`src_str` 不用释放，因为它指向 `argv[1]`，由程序调用者管理）

修复后，再次运行 valgrind，确认没有泄漏：

```bash
valgrind ./bork hello
==10835== Memcheck, a memory error detector
==10835== Copyright …
==10835== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
==10835== Command: ./bork hello
==10835==
Input string: "hello"
Length of translated string: 7
Translate to Bork: "hefllof"
==10835==
==10835== HEAP SUMMARY:
==10835==     in use at exit: 0 bytes in 0 blocks
==10835==   total heap usage: 11 allocs, 11 frees, 1,061 bytes allocated
==10835==
==10835== All heap blocks were freed -- no leaks are possible
==10835==
==10835== For counts of detected and suppressed errors, rerun with: -v
==10835== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
```

回到调试：在解析大量错误日志时，一个好的经验法则是只考虑第一个错误信息（忽略其余的），所以让我们这样做：

```txt
==10170== Invalid read of size 1
==10170==    at 0x4C34D04: strlen (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==10170==    by 0x10879F: make_Str (bork.c:22)
==10170==    by 0x108978: translate_to_bork (bork.c:56)
==10170==    by 0x1089F2: main (bork.c:68)
```

错误信息表明我们正在进行大小为 1 的非法读取。这是什么意思？“非法读取”意味着你的程序正在读取它不应该读取的内存（这可能导致段错误，但不一定）。“大小为 1”表示我们尝试读取 1 个字节。

因为我们对这个古老的代码库不熟悉，并且不想为了找错误而读完整个代码，我们应该遵循一个良好的流程，从高层细节开始，逐步深入（也就是按照 valgrind 提供的调用栈逐步排查）。

让我们看看 bork.c 的第 68 行 main 函数（调用栈的底部）：

```c
Str bork_substr = translate_to_bork(src_str.data[i]);
```

这里有什么奇怪的地方吗？看起来我们只是将一个字符传给 translate_to_bork。到目前为止似乎正常。

让我们深入调用栈，看看第 56 行的 translate_to_bork：

```c
return make_Str(res);
```

这里只是调用了 make_Str。我们继续深入。看看 bork.c 第 22 行。

```c
return (Str){.data=str,.len=strlen(str)};
```

这里我们创建了一个新的 Str 结构体，并设置了它的 data 和 len 参数。这也看起来正常！

可是 valgrind 说 strlen 正在进行非法读取？

我们确实是将一个字符串传给它，对吧？strlen 到底做什么？它通过遍历每个字符直到遇到空终止符来确定字符串长度。也许没有空终止符，所以 strlen 不断读取字符，越界到我们为字符串分配的区域之外。

让我们通过检查字符串的创建位置来确保它有空终止符。

之前，在 translate_to_bork 的第 56 行，我们看到了：

```c
return make_Str(res);
```

如果我们往上看两行（第 54 行），会看到我们通过调用 alloc_str 为字符串分配了空间。我们来看看这个函数。

```c
char *alloc_str(int len) {
    return malloc(len*sizeof(char));
}
```

嗯……看起来 alloc_str 只分配了 len 个字节的内存，这意味着当我们在 translate_to_bork 中向字符串写入时，没有多余空间放置空终止符！

让我们做如下修改以修复此问题：

```diff
10c10,12
<     return malloc(len*sizeof(char));
---
>     char *data = malloc((len+1)*sizeof(char));
>     data[len] = '\0';
>     return data;
```

让我们运行程序看看问题是否已修复

```bash
./bork hello
Input string: "hello"
Length of translated string: 7
Translate to Bork: "hefllof"
```

看起来一切正常。然而可能还有我们没有看到的隐藏错误，所以我们通过 valgrind 再检查一遍，确保没有潜在问题。

```bash
valgrind ./bork hello
==29797== Memcheck, a memory error detector
==29797== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==29797== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
==29797== Command: ./bork hello
==29797==
Input string: "hello"
Length of translated string: 7
Translate to Bork: "hefllof"
==29797==
==29797== HEAP SUMMARY:
==29797==     in use at exit: 8 bytes in 1 blocks
==29797==   total heap usage: 11 allocs, 10 frees, 1,061 bytes allocated
==29797==
==29797== LEAK SUMMARY:
==29797==    definitely lost: 8 bytes in 1 blocks
==29797==    indirectly lost: 0 bytes in 0 blocks
==29797==      possibly lost: 0 bytes in 0 blocks
==29797==    still reachable: 0 bytes in 0 blocks
==29797==         suppressed: 0 bytes in 0 blocks
==29797== Rerun with --leak-check=full to see details of leaked memory
==29797==
==29797== For counts of detected and suppressed errors, rerun with: -v
==29797== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
```

我们来看下面的堆摘要。它告诉我们在退出时仍有 1 个块（8 个字节）未被释放。这意味着堆上未释放的内存来自一次分配调用，大小为 8 字节。

接下来，我们可以看到堆摘要显示程序运行期间总共进行了 11 次分配调用和 10 次释放调用。

```txt
==29797== HEAP SUMMARY:
==29797==     in use at exit: 8 bytes in 1 blocks
==29797==   total heap usage: 11 allocs, 10 frees, 1,061 bytes allocated
```

现在我们来看下面的泄漏摘要。它只是说明我们丢失了 1 个块（8 字节）的内存。

```txt
==29797== LEAK SUMMARY:
==29797==    definitely lost: 8 bytes in 1 blocks
==29797==    indirectly lost: 0 bytes in 0 blocks
==29797==      possibly lost: 0 bytes in 0 blocks
==29797==    still reachable: 0 bytes in 0 blocks
==29797==         suppressed: 0 bytes in 0 blocks
==29797== Rerun with --leak-check=full to see details of leaked memory
```

它提示我们“使用 --leak-check=full 重新运行以查看泄漏内存的详细信息”，所以我们这么做。

```bash
valgrind --leak-check=full ./bork hello
==32334== Memcheck, a memory error detector
==32334== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==32334== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
==32334== Command: ./bork hello
==32334==
Input string: "hello"
Length of translated string: 7
Translate to Bork: "hefllof"
==32334==
==32334== HEAP SUMMARY:
==32334==     in use at exit: 8 bytes in 1 blocks
==32334==   total heap usage: 11 allocs, 10 frees, 1,061 bytes allocated
==32334==
==32334== 8 bytes in 1 blocks are definitely lost in loss record 1 of 1
==32334==    at 0x4C31B0F: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==32334==    by 0x108784: alloc_str (in /home/cc/cs61c/fa22/staff/cs61c-tac/bork)
==32334==    by 0x10884E: concat (in /home/cc/cs61c/fa22/staff/cs61c-tac/bork)
==32334==    by 0x108A30: main (in /home/cc/cs61c/fa22/staff/cs61c-tac/bork)
==32334==
==32334== LEAK SUMMARY:
==32334==    definitely lost: 8 bytes in 1 blocks
==32334==    indirectly lost: 0 bytes in 0 blocks
==32334==      possibly lost: 0 bytes in 0 blocks
==32334==    still reachable: 0 bytes in 0 blocks
==32334==         suppressed: 0 bytes in 0 blocks
==32334==
==32334== For counts of detected and suppressed errors, rerun with: -v
==32334== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
```

现在 Valgrind 告诉我们未释放的内存块最初的分配位置。我们来看下面的调用栈。可以看到 malloc 被 alloc_str 调用，alloc_str 又被 main 中的 concat 调用。

```txt
==32334== 8 bytes in 1 blocks are definitely lost in loss record 1 of 1
==32334==    at 0x4C31B0F: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==32334==    by 0x108784: alloc_str (in /home/cc/cs61c/fa22/staff/cs61c-tac/bork)
==32334==    by 0x10884E: concat (in /home/cc/cs61c/fa22/staff/cs61c-tac/bork)
==32334==    by 0x108A30: main (in /home/cc/cs61c/fa22/staff/cs61c-tac/bork)
```

在 main 中，我们为 dest_str 调用了 concat 分配了空间，但从未释放它。我们需要在程序结束前一直保留 dest_str，所以应该在 main 返回之前释放它。该结构体在 main 中是在栈上分配的（Str dest_str={};），因此不需要释放结构体本身。但结构体的数据域是在堆上分配的，因此只需要释放这部分内存。查看程序开头我们已经提供了 free_Str 函数用于释放结构体分配的资源。让我们在程序末尾调用该函数。

```diff
76a77
>     free_Str(dest_str);
```

你可能会问为什么我们不释放 src_str。看看我们在哪里构造 src_str（Str src_str = make_Str(argv[1]);），可以发现它是通过 make_Str 创建的，而 make_Str 并没有在堆上分配空间。我们用来构造 src_str 的字符串来自 argv[1]，而调用 main 的程序负责为 argv[1] 设置内存，所以我们无需担心它。

一旦我们修复了错误，valgrind 的输出应该如下所示。堆摘要显示退出时没有未释放的内存块，底部的错误摘要显示没有要报告的错误。

```bash
valgrind ./bork hello
==10835== Memcheck, a memory error detector
==10835== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==10835== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
==10835== Command: ./bork hello
==10835==
Input string: "hello"
Length of translated string: 7
Translate to Bork: "hefllof"
==10835==
==10835== HEAP SUMMARY:
==10835==     in use at exit: 0 bytes in 0 blocks
==10835==   total heap usage: 11 allocs, 11 frees, 1,061 bytes allocated
==10835==
==10835== All heap blocks were freed -- no leaks are possible
==10835==
==10835== For counts of detected and suppressed errors, rerun with: -v
==10835== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
```

## Exercise 6: 使用 Valgrind 查找段错误

上面，我们学习了如何使用 GDB 调试段错误。现在，我们将使用 Valgrind 做类似的事情。请在这个 [Valgrind 测验](https://docs.google.com/forms/d/e/1FAIpQLScjFrMcVPEb-l9_ILtFCYxfzp5vNTo8nmM73l0Mcf5yFAeX1g/viewform?usp=sf_link) 中填写 7 个 Valgrind 内存错误输出示例，对应 7 个不同的 bug。

一般来说，使用 Valgrind 时，需要添加 `-g` 标志以包含调试信息（例如 `gcc -g -o example example.c`）。然后，对编译好的可执行文件运行 Valgrind（例如 `valgrind ./example`）。Exercise 6 中的 Valgrind 输出示例已在表单中提供。

你可以无限次重新提交测验，直到截止日期前拿到 100% 为止；测验会即时反馈对错情况。

## Exercise 7: 内存管理

此练习 **可选**，但其中涉及的概念对于 Project 1 及以后的内容非常重要，强烈推荐完成以积累经验。

本练习使用 `ex7_vector.h`、`ex7_test_vector.c` 和 `ex7_vector.c`，我们为你提供了一个实现可变长度数组的框架。此练习旨在帮助你熟悉 C 语言的 struct 和内存管理。

1. **尝试解释** 为什么 `bad_vector_new()` 是错误的。我们在此提供了答案，方便你核对理解。

   <details style="box-sizing: border-box; margin-bottom: 1em; border: 1px solid currentcolor; border-radius: 0.25em; padding: 0.25em 0.5em;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer;">bad_vector_new()</summary> 向量是在栈而不是堆上创建的。 一旦该函数运行完毕，栈中存储的所有内存都会被释放，因此当函数返回时，我们就会丢失构建的向量。 </details>

2. **填写** `ex7_vector.c` 中的 `vector_new()` 和 `vector_delete()` 函数，使我们的测试代码 `ex7_test_vector.c` 能在没有任何内存管理错误的情况下运行。

   代码中的注释描述了各函数的预期行为。查看我们已实现的函数，就能了解数据结构的使用方式。为了保持一致，*假定向量中的所有元素在用户设置之前都是 0*（注意：`malloc()` 不会将分配的内存清零）。

3. **测试** 你的 `vector_new()` 和 `vector_delete()` 实现是否正确：

   ```bash
   gcc -g -o ex7_vector ex7_vector.c ex7_test_vector.c
   ./ex7_vector
   ```

4. **使用 Valgrind** 测试你的实现是否存在内存管理问题：

   ```bash
   valgrind ./ex7_vector
   ```

任何被抑制的错误都可以忽略，不影响评分。

你也可以使用 CGDB 来调试代码。

## Exercise 8: 调试内存泄漏

Valgrind 非常擅长帮助我们发现和修复内存泄漏。当我们分配了内存却未释放时，就会发生内存泄漏。这很糟糕，因为不释放内存最终会耗尽所有可用内存。

在本练习中，你将使用 Valgrind 调试 `ex8_double_pointers.c`（务必先阅读上面的 Valgrind 章节）。

1. **编译** `ex8_double_pointers.c`（记得加 `-g` 标志，以便 Valgrind 能显示源代码行号）。
2. **运行** Valgrind，观察程序有 4 次 allocs 和 3 次 frees。你还会看到在退出时堆上还有一个分配调用留下的 16 字节内存未被释放（Student 结构体大小为 16 字节）。
3. **再次运行** Valgrind，加上 `--leak-check=full` 标志。此时你应该看到在 `main` 的第 31 行调用 `malloc` 时丢失了 16 个块。
4. **修复** 内存泄漏 bug。
5. **重新编译并运行** 程序，使用 Valgrind 检查。堆摘要应显示退出时无未释放的块，错误摘要应显示无错误。

## Exercise 9: 反馈与调查问卷

我们每周都在改进课程——请填写 [这份调查问卷](https://docs.google.com/forms/d/e/1FAIpQLSeZzOViL2ag_KCkpNXG0rt8R9-WJS-Qy2xblGP12R5IDHTwRA/viewform?usp=sf_link)，告诉我们你到目前为止在 CS 61C 的体验！

------

## 提交

保存、提交并推送你的代码，然后在 Gradescope 上提交 **Lab 2** 作业。

------

## 常见的 GDB 错误

### GDB 跳过代码行

这可能是因为你的源文件比可执行文件更新。退出 GDB，用 `-g` 标志重新编译代码，然后重新启动 GDB。

### GDB 无法加载文件

你可能会看到 “not in executable format: file format not recognized” 或 “No symbol table loaded. Use the "file" command.” 的错误。

这表明你对源文件（`.c`）使用了 GDB，而不是对编译好的可执行文件。退出 GDB，确保你对可执行文件使用 GDB。

### 如何在代码窗口和控制台之间切换？

CGDB 使用类 vim 的导航：按下 `i` 键可从代码窗口切换到控制台，按下 `Esc` 可从控制台返回代码窗口。

GDB 使用 readline/emacs 风格导航：按 `Ctrl + X` 然后 `O` 可在窗口间切换。

### 我卡在代码窗口里了

按下 `i` 键，可返回控制台。

### 文本 UI 显示混乱

按 `Ctrl + l` 刷新 GDB 文本 UI。

------

## 其他有用的 GDB 命令（推荐）

### 命令：`info locals`

打印当前栈帧中所有局部变量的值。

### 命令：`commands`

在每次到达断点时自动执行一系列命令。例如：

设置断点：

```txt
b 73
```

输入 `commands` ，然后输入断点号：

```txt
commands 1
```

输入你希望执行的命令列表，每条命令一行。命令列表结束后，输入 `end` 并回车。

```txt
p var1
p var2
end
```

