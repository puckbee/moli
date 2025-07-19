# 实验4：RISC-V 调用约定


    
[实验幻灯片](https://web.archive.org/web/20241219154533/https://docs.google.com/presentation/d/1sb53wVc02O4er53P7dOUhcvey46XVyASQMiEP3Gz8uM/edit)

## 实验设置


??? note "你必须在本地机器上完成本实验。如需重新配置环境，请参考 [Lab 0](Lab_0.md)。"

在本地的 `labs` 文件夹中，拉取你之前实验的变更：

```bash
git pull origin main
```

继续在 `labs` 文件夹中，拉取本实验的文件：

```bash
git pull starter main
```

如果报错如下：

```
fatal: 'starter' does not appear to be a git repository
fatal: Could not read from remote repository.
```

请先添加 starter 远程仓库地址：

```bash
git remote add starter https://github.com/61c-teach/fa24-lab-starter.git
```

然后再次运行原来的命令。

接着，在 `labs` 目录下执行以下命令以下载我们可能需要的工具：

```bash
bash tools/download_tools.sh
```

如果遇到 Git 报错，请查阅常见[错误页面](https://web.archive.org/web/20241219154533/https://cs61c.org/fa24/resources/common-errors/)。

## Venus 模拟器

我们将继续使用 [Venus](https://venus.cs61c.org) 进行 RISC-V 模拟。请参考 [Venus 使用文档](https://cs61c.org/sp25/resources/venus-reference/) 以熟悉界面与功能。

挂载 Lab 4 的文件方法与 [Lab 3](Lab_3.md) 相同。

## 调用约定简介

建议先阅读[调用约定附录](https://cs61c.org/sp25/projects/proj2/#calling-convention)，掌握基础概念。调用约定对于正确编写 RISC-V 程序至关重要。

此外，我们建议结合实验幻灯片与[相关课程](https://web.archive.org/web/20241219154533/https://cs61c.org/su24/lectures/lec07/)讲解，以理解调用约定背后的设计动机。

我们在下面提供了两个关于调用约定（Calling Convention, CC）的实际演示示例。我们知道这些示例比较长，但它们将帮助你理解在编写 RISC-V 程序时如何遵循调用约定，从而使这个实验更容易完成。

---


## 示例：实际应用

假设我们有如下结构的汇编代码，用于一个名为 `func1` 的函数。我们假设 `func1` 是由另一个函数（例如 `main` 函数）调用的。从代码中你也会看到，`func1` 还会调用另一个名为 `func2` 的函数。
当 `func1` 被 `main` 调用时，`func1` 是 **被调用者（callee）**；  
而当 `func1` 调用 `func2` 时，`func1` 又成为了 **调用者（caller）**。
因此，`func1` 在遵循调用约定（Calling Convention）时，必须同时承担 **被调用者** 和 **调用者** 的职责。


```assembly
func1: # 修改 a0, t0 和 s0。ra 指向 `main`。
    # Checkpoint 1: 修改寄存器前应该做什么？
    # 使用 a0、t0、s0的代码块
    # Checkpoint 2: 调用其他函数前应该做什么？
    # 输入参数在 a0，返回值也在 a0
    jal ra, func2 # 调用 func2
    # Checkpoint 3: 调用后应该做什么？
    # 再次使用 a0、t0、s0代码块
    # Checkpoint 4: 返回前应做什么？
    jr ra # 返回主调函数
```

将值保存到栈中是通过使用 `sw` 指令将数据存入合适的栈指针（`sp`）位置来完成的。从栈中取回值则使用 `lw` 指令在相应的栈指针位置读取数据。每当你要将值压入栈时，需要调整栈指针(通过减小 sp 的值)。每当你要从栈中取回值时，也要相应地反向调整 sp 的值（即增大 sp）。遵循这一流程可以确保函数调用开始和结束时，sp 的值保持一致。这正是函数使用栈内存作为临时存储空间的方式。

让我们尝试为代码中的每个Checkpoint填写相应的代码。

在 Checkpoint 1 中，由于 `func1` 是被调用者（由 `main` 调用），它必须保存那些它将要修改的 callee 保存寄存器。代码中指出我们将会修改 `s0`，而 s0 是一个保存寄存器（saved register）。
此外，由于 `func1` 还会调用另一个函数 `func2`，因此它还需要保存返回地址 `ra`。虽然 `ra` 是一个 caller saved register，但通常我们也会在这一步将其保存在栈中。由于我们要保存 2 个寄存器，因此需要将栈指针 `sp` 下调两个字（即 8 字节）。对应的代码如下所示：

```assembly
# Checkpoint 1：在开始修改寄存器之前你需要做什么？
addi sp, sp, -8   # 将栈指针下移两个字（8 字节）
sw ra, 0(sp)      # 保存返回地址寄存器 ra
sw s0, 4(sp)      # 保存被调用者保存的寄存器 s0
```

在 Checkpoint 2，我们看到 `a0`、`t0` 和 `s0` 都已经被修改过，而我们现在即将调用 `func2`（此时 `func1` 成为调用者）。我们可以看到 `func2` 使用 `a0` 寄存器接收输入参数，并且也使用同一个寄存器返回结果。此外，我们还注意到，在代码后续（Checkpoint 3 之后），还会再次使用 `t0` 和 `s0` 寄存器。因此，从 `func1` 的角度来看，在调用 `func2` 前后，这两个寄存器的值应该保持不变。我们知道，如果 `func2` 遵循调用约定，它应该会将 `s0` 寄存器保存在栈上，并在返回之前恢复原值。这正是我们希望看到的。然而，`t0` 是调用者保存（caller-saved）寄存器，`func2` 并不会保存它，因此可以在函数内部自由修改它。因此，作为 `func2` 的调用者，`func1` 现在有责任将 `t0` 保存在栈上。
因此，我们写出了如下代码：

```assembly
# Checkpoint 2：调用另一个函数之前你需要做什么？
addi sp, sp, -4   # 将栈指针下移一个字（4 字节）
sw t0, 0(sp)      # 保存临时寄存器 t0
```

在 Checkpoint 3，`func2` 已经返回，返回值存储在 `a0` 中。此时，`func1` 准备使用这个返回值（`a0`）以及 `t0` 和 `s0` 寄存器进行一些操作。同样地，如果 `func2` 遵循调用约定，从 `func1` 的角度来看，`s0` 寄存器的值应该保持不变。然而，`t0` 可能已经被修改。幸运的是，我们在调用 `func2` 之前已经将它保存到栈中了，现在只需要将它恢复即可。
因此，我们有如下代码：

```assembly
# Checkpoint 3: 调用函数后你需要做什么？
    lw t0 0(sp)     # 从栈中恢复保存的临时寄存器
    addi sp sp 4    # 将栈指针上移一个字（4字节）
```

在 Checkpoint 4，我们现在处于 `func1` 完成操作即将返回到 `main` 的阶段。但是，在返回之前，它必须确保完成了作为被调用者（callee）的职责。在之前的 Checkpoint 1 中，我们将 `ra` 和 `s0` 寄存器保存到了栈上。现在是时候将它们取回了。在 `func1` 的执行过程中，`s0` 寄存器和 `ra` 寄存器都被修改过（由于调用了 `func2`）。作为被调用者，它有责任将它们恢复到原来的值，以便从 `main` 函数的角度来看，这些寄存器的值没有发生变化。
因此，我们有如下代码：

```assembly
# Checkpoint 4：函数返回之前需要做什么？
lw s0 4(sp)     # 从栈中恢复被保存的寄存器 s0
lw ra 0(sp)     # 从栈中恢复原始返回地址寄存器 ra（指向 main 函数）
addi sp sp 8    # 将栈指针上移两个字（8 字节）
```

到此为止，我们已经满足了 `func1` 的 RISC-V 调用约定。以下是完整代码：

```assembly
func1: # 修改了 a0、t0 和 s0。ra 指向 main 函数。
    # checkpoint 1：开始修改寄存器之前需要做什么？
    addi sp sp -8   # 将栈指针下移两个字（8 字节）
    sw ra 0(sp)     # 保存返回地址寄存器 ra
    sw s0 4(sp)     # 保存被保存寄存器 s0

    # 使用 a0、t0 和 s0 的代码块
    # checkpoint 2：调用另一个函数之前需要做什么？
    addi sp sp -4   # 将栈指针下移一个字（4 字节）
    sw t0 0(sp)     # 保存临时寄存器 t0

    # 输入参数在 a0，返回值也放在 a0
    jal ra, func2   # 调用 func2
    # checkpoint 3：函数调用后需要做什么？
    lw t0 0(sp)     # 从栈中恢复保存的临时寄存器 t0
    addi sp sp 4    # 将栈指针上移一个字（4 字节）

    # 使用 a0、t0 和 s0 的代码块
    # checkpoint 4：函数返回之前需要做什么？
    lw s0 4(sp)     # 从栈中恢复被保存的寄存器 s0
    lw ra 0(sp)     # 从栈中恢复原始返回地址寄存器 ra（指向 main 函数）
    addi sp sp 8    # 将栈指针上移两个字（8 字节）

    jr ra           # 函数返回
```

假设在调用 `func1` 时，寄存器 `sp` 的初始值是 0x7FFFFFF0。


??? question "`s0` 被保存在哪个内存地址？"

    栈指针向下调整了 8 字节，但 `s0` 存储在 `sp + 4` 的位置。因此，地址是 `0x7FFFFFF0 - 8 + 4 = 0x7FFFFFEC`。
    
??? question "`t0` 被保存在哪个内存地址？"

    栈指针先向下调整了 8 字节，然后在保存 `t0` 之前又向下调整了 4 字节。因此，地址是 `0x7FFFFFF0 - 8 - 4 = 0x7FFFFFE4`。

??? question "在 `func1` 结束时（即 `jr ra` 这一行），栈指针指向哪里？"

    栈指针应该回到原始值，因为我们已经恢复了保存的数据并且相应地回收了栈空间。因此，地址是 `0x7FFFFFF0`。

??? question "如果我们没有实现 Checkpoint 2 和 3 的代码，会出什么问题？"

    在 Checkpoint 3 之后，描述了 `func1` 会再次使用 `t0`。由于 `t0` 是调用者保存寄存器，作为被调用者的 `func2` 可以自由修改它，而不需要恢复原值。如果 `t0` 被 `func2` 修改了，那么 `func1` 的计算结果将是错误的，因为函数调用改变了它的临时变量之一。          

??? question "如果我们根本没有保存 `ra`，会出什么问题？"

    `ra` 指向调用函数的地址。在 `func1` 开始时，它指向 `main` 函数中的某个位置。每当执行 `jal` 指令时，`ra` 会被修改，指向该指令之后的下一条指令。这样，当执行 `jr ra` 时，就会跳转到 `ra` 指向的位置继续执行。`func1` 调用了 `func2`，这会改变 `ra`，使它指向紧跟调用 `func2` 的指令之后的位置（比如 `lw t0 0(sp)`）。这个位置现在是在 `func1` 内部。如果没有保存 `ra`，当 `func1` 在结尾执行 `jr ra` 时，会跳回到 `lw t0 0(sp)` 这条指令，导致程序流程错误，而不是跳回到 `main` 函数的正确位置。



## 示例：使用调用约定将 C 语言转换为 RISC-V  

在本练习中，你将学习如何将下面的 C 程序翻译成 RISC-V 代码。如果你想挑战自己，可以先尝试翻译代码，再对照答案查看。

```C
int source[] = {3, 1, 4, 1, 5, 9, 0};
int dest[10];

int fun(int x) {
	return -x * (x + 1);
}

int main() {
    int k;
    int sum = 0;
    for (k = 0; source[k] != 0; k++) {
        dest[k] = fun(source[k]);
        sum += dest[k];
    }
    printf("sum: %d\n", sum);
}
```

我们先从初始化 `source` 和 `dest` 数组开始。就像我们在实验 3 中做的那样，我们需要在 `.data` 段声明数组，如下所示：

```assembly
.data
source:
    .word   3
    .word   1
    .word   4
    .word   1
    .word   5
    .word   9
    .word   0
dest:
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
```

接下来，我们开始编写 `fun` 函数。

```C
int fun(int x) {
	return -x * (x + 1);
}
```

调用约定规定：

 - **参数 `x` 位于寄存器 `a0` 中**  
 - **返回值也必须放入寄存器 `a0`**

 其余代码在下方的注释中解释。

```assembly
.text
fun:
    addi t0, a0, 1 # t0 = x + 1
    sub t1, x0, a0 # t1 = -x
    mul a0, t0, t1 # a0 = (x + 1) * (-x)
    jr ra # return
```

??? question "问问你自己：为什么我们在使用 `t1` 之前没有保存它？"

    `t1` 是一个调用者保存寄存器。调用约定并不保证调用者保存的寄存器在函数调用后仍保持不变。因此，`fun` 可以在不保存旧值的情况下修改 `t1`。如果调用 `fun` 的函数在调用前在 `t1` 中存储了某个它希望在 `fun` 返回后继续使用的值，那它就必须在调用 `fun` 之前自行保存 `t1`。


 接下来我们来看 `main` 函数。（暂时先忽略调用约定）

```C
int main() {
    int k;
    int sum = 0;
```
   
上述代码转换如下：

```assembly
main:
    addi t0, x0, 0 # t0 = k = 0
    addi s0, x0, 0 # s0 = sum = 0
```

我们必须将 `k` 初始化为 0，因为在 RISC-V 中无法声明一个变量而不为其赋初值。

接下来，我们加载两个数组的地址。

```assembly
    la s1, source
    la s2, dest
```

请记住，`la` 指令用于加载一个标签的地址。这是我们访问 `source` 和 `dest` 两个数组地址的唯一方式。现在，`s1` 是指向 `source` 数组的指针，`s2` 是指向 `dest` 数组的指针。

接下来我们进入循环部分。

```C
for (k = 0; source[k] != 0; k++) {
    dest[k] = fun(source[k]);
    sum += dest[k];
}
```

首先，我们构造循环的外部结构（即循环框架）。

```assembly
loop:
#1  slli s3, t0, 2
#2  add t1, s1, s3
#3  lw t2, 0(t1)
#4  beq t2, x0, exit
    ...
#5  addi t0, t0, 1
#6  jal x0, loop
exit:
```

 - **1.第 1 到第 3 行是为了访问 `source[k]`。首先我们需要计算该元素的字节偏移量。由于我们处理的是 `int` 类型数组，每个元素占 4 字节，因此我们需要将 `t0`（即 `k`）乘以 4。要将一个值乘以 4，我们只需左移 2 位。**

 - **2.接着，我们将偏移量加到数组指针上，来计算出 `source[k]` 的地址。**

 - **3.现在我们已经有了地址，就可以从内存中加载对应的值。**

 - **4.然后我们检查 `source[k]` 是否为 0。如果是，就跳转到循环的出口。**

 - **5.在循环的结尾，我们将 `k` 加 1。**

 - **6.最后跳回循环开头，继续执行。**


现在，我们来补全循环的其余部分（先暂时忽略调用约定）。

```assembly
loop:
    slli s3, t0, 2
    add t1, s1, s3
    lw t2, 0(t1)
    beq t2, x0, exit
#1  add a0, x0, t2 # 1
    ...
#2  jal fun # 2
    ...
#3  add t3, s2, s3 # 4
#4  sw a0, 0(t3) # 5
#5  add s0, s0, a0 # 6
    addi t0, t0, 1
    jal x0, loop
exit:
```

 - **1.`fun` 接收参数 `x`，我们必须通过寄存器 `a0` 传递该参数，以便 `fun` 知道去哪里取值。**

 - **2.调用 `fun`。`jal` 指令会自动将返回地址保存在 `ra` 寄存器中。**

 - **3.接下来，我们要将返回值存储到 `dest` 数组中。首先需要计算存储位置的地址。记住，我们可以复用之前计算的偏移量（存储在 `s3` 中）。`s2` 是指向 `dest` 数组起始位置的指针。**

 - **4.将值存储到 `dest[k]`。注意，`fun` 将返回值放在了 `a0` 中。**

 - **5.将 `sum` 加上 `dest[k]` 的值。**

现在，让我们在调用 `jal fun` 周围添加正确的调用约定代码。在往下看之前，先思考一下我们需要添加哪些代码才能满足调用约定。

为了满足调用约定（确保代码按预期运行），我们需要保存那些在调用 `fun` 后仍希望保持不变的调用者保存寄存器（caller-saved registers）。在本例中，我们可以看到 `main` 函数中使用了寄存器 `t0`、`t1`、`t2` 和 `t3`。

??? question "我们需要保存并恢复所有这些寄存器吗？"

    不需要，我们只需要保存并恢复 `t0`。虽然我们在调用 `fun` 之前使用了 `t1` 和 `t2`，但之后没有再用到它们。`t3` 是在调用 `fun` 之后写入的，因此它的旧值不重要。`t0` 是唯一一个调用者保存寄存器（caller-saved register），其值必须在调用 `fun` 前后保持不变。


现在，我们在 `jal fun` 周围添加符合调用约定的代码。

```assembly
addi sp, sp, -4
sw t0, 0(sp)
jal fun
lw t0, 0(sp)
addi sp, sp, 4
```


接下来，我们继续完成退出部分（暂时不考虑调用约定）。

```assembly
exit:
    addi a0, x0, 1    # 传递给 ecall 的参数，1 表示打印整数
    addi a1, s0, 0    # 传递给 ecall 的参数，要打印的值
    ecall             # 执行打印整数的系统调用
    addi a0, x0, 10   # 传递给 ecall 的参数，10 表示终止程序
    ecall             # 执行终止程序的系统调用

```


最终的和存储在 `s0` 中。要打印该值，我们需要将其存储到 `a1` 中，`a1` 是传递给 `ecall` 的打印参数。

现在，我们已经完成了程序的逻辑。接下来需要完善 `main` 函数的调用约定部分。


??? question "自己思考一下，调用约定中缺少了哪部分？"
    我们正在覆盖被调用者保存寄存器（callee-saved registers），但没有保存它们！记住，保证被调用者保存寄存器在函数开始和结束时保持相同的值是被调用者的责任。  

??? question "我们需要保存哪些被调用者保存寄存器？"   
    我们需要保存所有自己使用的被调用者保存寄存器。由于我们不知道调用我们的函数会使用哪些寄存器，所以必须保存所有被我们覆盖的寄存器。在本例中，就是寄存器 `s0` 到 `s3` 和 `ra`。


理解为什么需要保存 `ra` 可能有些棘手。请记住，有另一个函数调用了 `main`。当那个函数调用 `main` 时，会将返回地址存储在 `ra` 中，以便 `main` 执行完后知道返回的位置。

当 `main` 调用 `fun` 时，也需要在 `ra` 中存储返回地址，以便 `fun` 执行完后知道返回的位置。因此，`main` 必须在覆盖 `ra` 之前保存它。

下面是 `main` 的函数前序（prologue）和后序（epilogue）代码：

```assembly
main:
    # 函数序言（Prologue）开始
    addi sp, sp, -20     # 为保存寄存器在栈上开辟20字节空间
    sw s0, 0(sp)         # 保存s0寄存器
    sw s1, 4(sp)         # 保存s1寄存器
    sw s2, 8(sp)         # 保存s2寄存器
    sw s3, 12(sp)        # 保存s3寄存器
    sw ra, 16(sp)        # 保存返回地址寄存器ra
    # 函数序言（Prologue）结束

    ...
    ...                  # 主体代码省略

exit:
    addi a0, x0, 1       # 设置ecall参数，1表示打印整数
    addi a1, s0, 0       # 设置要打印的值（s0中保存最终结果）
    ecall                # 执行打印整数的系统调用

    # 函数尾声（Epilogue）开始
    lw s0, 0(sp)         # 恢复s0寄存器
    lw s1, 4(sp)         # 恢复s1寄存器
    lw s2, 8(sp)         # 恢复s2寄存器
    lw s3, 12(sp)        # 恢复s3寄存器
    lw ra, 16(sp)        # 恢复返回地址寄存器ra
    addi sp, sp, 20      # 回收之前分配的栈空间
    # 函数尾声（Epilogue）结束

    addi a0, x0, 10      # 设置ecall参数，10表示退出程序
    ecall                # 执行退出程序的系统调用
```

你可以在 `example_c_to_riscv.s` 文件中找到完整程序。


## 练习 1.1：调用约定检查器

!!! note " 在尝试以下练习之前，请确保你理解了调用约定（实验幻灯片是一个很好的参考资料！）。"

调用约定错误可能会在你的代码中引发难以发现的 bug。调用约定检查器（Calling Convention Checker）可以用于检测代码中违反调用约定的行为，但它并不全面。在这个练习中，你将使用调用约定检查器来修复一些调用约定方面的问题。

**注意**：Venus 的调用约定检查器并不能检测出所有的调用约定错误；它的主要作用是进行基础检查。最重要的一点是，**它只会检查那些通过 .globl 指令导出的函数是否存在错误**——.globl 的含义在 [Venus 的参考文档](https://web.archive.org/web/20241219154533/https://cs61c.org/fa24/resources/venus-reference/#working-with-multiple-files)中有更详细的解释。

1.要启用调用约定检查器，请**点击**页面顶部的 Venus 选项卡，在 Settings（设置）面板中找到 "Calling Convention" 这一行，然后**点击** "Enable" 启用它。
    你也可以通过命令行使用 `-cc` 标志来运行调用约定检查器。例如：
```assembly
java -jar tools/venus.jar -cc lab04/ex1.s
```

2.接下来，打开 `ex1.s` 文件到 Simulator 选项卡中。

3.运行模拟器后，你应该会看到一些类似如下的错误信息。
```assembly
[CC Violation]: (PC=0x0000004C) Setting of a saved register (s0) which has not been saved! ex1.s:54 li s0, 1
[CC Violation]: (PC=0x00000054) Setting of a saved register (s0) which has not been saved! ex1.s:57 mul s0, s0, a0
[CC Violation]: (PC=0x00000054) Setting of a saved register (s0) which has not been saved! ex1.s:57 mul s0, s0, a0
[CC Violation]: (PC=0x00000054) Setting of a saved register (s0) which has not been saved! ex1.s:57 mul s0, s0, a0
[CC Violation]: (PC=0x00000054) Setting of a saved register (s0) which has not been saved! ex1.s:57 mul s0, s0, a0
[CC Violation]: (PC=0x00000054) Setting of a saved register (s0) which has not been saved! ex1.s:57 mul s0, s0, a0
[CC Violation]: (PC=0x00000054) Setting of a saved register (s0) which has not been saved! ex1.s:57 mul s0, s0, a0
[CC Violation]: (PC=0x00000054) Setting of a saved register (s0) which has not been saved! ex1.s:57 mul s0, s0, a0
[CC Violation]: (PC=0x00000064) Save register s0 not correctly restored before return! Expected 0x00000000, Actual 0x00000080. ex1.s:65 jr ra
[CC Violation]: (PC=0x00000070) Setting of a saved register (s0) which has not been saved! ex1.s:79 mv s0, a0 # Copy start of array to saved register
[CC Violation]: (PC=0x00000074) Setting of a saved register (s1) which has not been saved! ex1.s:80 mv s1, a1 # Copy length of array to saved register
[CC Violation]: (PC=0x000000A4) Setting of a saved register (s0) which has not been saved! ex1.s:117 addi s0, t1, 1
Found 12 warnings!
--------------------
[ERROR] An error has occurred!

Error:
`StoreError: You are attempting to edit the text of the program though the program is set to immutable at address 0x00000006!
```

关于这些错误的更多信息可以在 [Venus 参考文档](https://web.archive.org/web/20241219154533/https://cs61c.org/fa24/resources/venus-reference/#calling-convention-checker) 中找到。

## 练习1：检查代码

阅读 `ex1.s` 文件。确保你能回答以下这些问题。

??? question "next_test 是函数吗？"

     不是，它只是一个标签，用来跳过对 `failure` 的调用。如果一个标签是函数，我们会使用跳转并链接指令（jump and link）调用它，因为函数调用后通常会返回调用点。而这里，我们只是简单地跳转到了 `next_test`。


??? question "为什么 `helper_fn` 中的调用约定错误没有被调用约定检查器报告？（提示：这在练习说明中提到过。）"

    因为它没有被声明为 `.globl`。调用约定检查器不会检测未声明为 `.globl` 的函数。  
    注意：`helper_fn` 中的错误最初会被检查器报告，但当调用它的函数中的错误被修复后，这个错误就不会再被报告了。


## 练习 1.2：被调用者函数

请根据打印出的错误，修复 `pow` 和 `helper_fn` 函数中的调用约定错误。
这些错误的修复（包括调用约定检查器报告的错误和它未能发现的错误）应当添加在起始代码中标有 `FIXME` 注释的行附近。修复完成后，你应当会看到调用约定检查器报告的错误信息减少。
另外，确保你能够回答以下问题。

??? question "导致 Venus 调用约定检查器报告 `pow` 函数错误的原因是什么？"

    缺少函数的序言（prologue）和尾声（epilogue）。

??? question "在 RISC-V 中，调用函数是通过跳转到函数并将返回地址存储在 `ra` 寄存器中实现的。调用约定是否适用于跳转到 `pow_loop` 或 `pow_end` 标签？"

    不适用，因为它们不是函数，我们不需要返回到调用它们的位置。


## 练习 1.3：调用者与被调用者函数

请根据打印出的错误，修复 `inc_arr` 函数中的调用约定错误。

这些错误的修复（包括调用约定检查器报告的错误和它未能发现的错误）应当添加在起始代码中标有 `FIXME` 注释的行附近。修复完成后，你的输出应类似于：

```assembly
Tests passed.
Found 0 warnings!
```

在进入下一个练习之前，确保你已经回答了以下问题。

??? question "导致 Venus 调用约定检查器报告 `inc_arr` 函数错误的原因是什么？" 
    `inc_arr` 函数未在函数序言和尾声中保存 `s0`、`s1`，且在调用 `helper_fn` 之前未保存 `t0`。

??? question "为什么我们需要在 `inc_arr` 的序言中保存 `ra`，而其他函数不需要？"

    因为 `inc_arr` 本身调用了其他函数，`ra` 保存返回地址，调用其他函数时会被覆盖，为了能正确返回 `inc_arr` 函数体，必须先保存 `ra`。


## 练习 2：修复调用约定错误：保存 s 寄存器版本

本练习的起始代码包含一个递归的 `pow` 函数，存在一个或多个我们过去学期中常见的调用约定错误。你的任务是修复这些错误，以避免在写 RISC-V 代码时出现类似问题。

??? warning "你只能添加代码，不能修改或删除已有代码行。"

1.打开 `ex2.s` 并在 Venus 中运行。请注意，程序不会退出，因为存在死循环。  

2.阅读代码和注释，确保阅读以 “Note” 开头的注释。思考程序为何存在死循环，并寻找调用约定违规的地方。  

3.修复调用约定错误。


## 练习 3：修复调用约定错误：保存 t 寄存器版本

本练习类似上一个，起始代码包含一个递归的 `pow` 函数，也存在一个或多个常见调用约定错误。你的任务是修复这些错误，以避免在写 RISC-V 代码时出现类似问题。  
注意本练习中的 `pow` 函数实现与上一个练习有所不同。

??? warning "你只能添加代码，不能修改或删除已有代码行。"

 1.打开 `ex3.s` 并在 Venus 中运行。程序同样因为死循环而不会停止。  

 2.阅读代码和注释，确保阅读两个以 “Note” 开头的注释。思考程序为何存在死循环，寻找调用约定违规。  
思考本练习中的 `pow` 函数与上一练习有何不同。  

 3.修复调用约定错误。