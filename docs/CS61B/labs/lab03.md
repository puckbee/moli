# 实验 03：调试（第二部分）

## 常见问题解答

实验 03 的常见问题解答在[这里](https://sp25.datastructur.es/labs/lab03/faq/)。

## 简介

这是上周调试实验的延续。本周的实验中，我们将使用上周使用的调试工具，并获得更多调试实践。今天实验的目标是更深入地了解以下内容：

- 阅读堆栈跟踪并知道如何从中隔离错误。
- 理解我们可能遇到的不同类型的异常。
- 更加熟练地使用 IntelliJ 调试器。
- 异常断点、表达式和监视（可选）。

一如既往，如果不确定某个内容的含义，特别是堆栈跟踪中出现的特定异常或错误，请随时查找。提示旨在引导您的思考，但我们鼓励您在打开提示之前先尝试自行完成实验。

## `Adventure`

### 运行游戏和测试

首先要做的是运行 `AdventureGame` 中的 `main` 方法以运行整个游戏。按照游戏运行后给出的指示操作。这将帮助您了解您正在调试的程序应该做什么（如果遇到错误，这是正常的）。

然后，在运行游戏后，运行 `tests/adventure/AdventureGameTests` 中的测试。它们会在 `BeeCountingStage` 阶段失败，这将引导您调试下面的第一个错误（注意此时所有测试都会失败）。要通过 `AdventureGameTests` 的所有测试，您需要修复所有单独的阶段测试（修复一个阶段将显示您通过了该单独阶段）。**阶段应按规范顺序完成。**

我们鼓励您在完成每个阶段后运行游戏，以查看它们与游戏的关系。别忘了经常提交代码以保存进度！

### 阅读堆栈跟踪

当 Java 中发生 *运行时错误* 时，会在控制台上打印出堆栈跟踪，以提供有关错误发生位置以及程序到达该位置所采取步骤的信息。首次运行 `Adventure` 时，您的堆栈跟踪可能如下所示：

![stack trace](https://sp25.datastructur.es/labs/lab03/img/adventure_stack_trace.png)

首先要注意的是发生了什么类型的错误；这在堆栈跟踪的第一行显示。在这种情况下，我们的代码抛出了一个 `NullPointerException`。

对于某些异常，包括 `NullPointerException`，Java 会给出一个解释。在这里，`this.input` 是 `null`，因此无法对其调用方法。

下面的行表示程序到达错误时所采取的方法序列：列表中的第一行是错误发生的位置，而其下的行表示调用抛出错误的方法的代码行，依此类推。

您可以点击 **`蓝色文本`** 导航到该文件和行。



!!! TIP

    要了解如何解释堆栈跟踪，通常会从顶部开始。如前所述，堆栈跟踪的第一行是错误发生的位置——换句话说，这是错误发生前发生的最后一个方法调用，因此您可以使用它来隔离错误的位置。根据程序的编写方式、设计方式以及您编写/贡献的代码，您可以在堆栈跟踪中导航到相应的行，点击 **`蓝色文本`** 跳转到该行并开始调试。


------

!!! WARNING

    对于以下每个阶段，**只更改必要的内容** ！除非另有说明，否则不应重写整个代码块。我们已包含更改行数作为指南。


!!! TIP

    如果您愿意，可以每次通过冒险游戏来验证正确性，但不必这样做——可以直接通过测试进行调试。对于您要处理的每个文件，它包含一个 `playStage` 方法，您可以在该方法中设置断点。从那里，您可以开始在 `AdventureGameTests` 中进行调试。


调试 `BeeCountingStage`

!!! TASK
    通过分析堆栈跟踪修复 `BeeCountingStage` 中发生的 `NullPointerException`。您可以忽略带有 `<XX internal lines>` 的行；这些通常是测试框架或库代码中的内容，通常不会帮助您找到错误。

    预期修改行数：1

??? 提示1
    
    错误发生在某一行，并不一定意味着那段代码不正确——堆栈跟踪中显示的某些内容可能是难以捉摸的罪魁祸首！

??? 提示2

    仔细查看构造函数。查看声明的变量以及实例化的内容。


------

事实证明，这并不是 `BeeCountingStage` 中唯一的错误！

!!! 任务

    修复 `BeeCountingStage` 中发生的 `IndexOutOfBoundsError`。

!!! 信息

    请忽略堆栈跟踪顶部指向 `Objects.java` 和 `ArrayList.java` 的灰色链接。错误可能 *发生* 在非你编写的代码中，但根本原因可能是 *你的代码* 试图执行的操作。

    预期修改行数：1


------

??? 提示1
    别忘了，Java 是从 0 开始索引的！

调试 `SpeciesListStage`

!!! 任务

    修复 `SpeciesListStage` 中的错误。如果在异常发生的方法中看不出问题（堆栈跟踪的第一行），通常可以查看第二行，看看方法是从哪里调用的，以及使用了哪些参数。

    预期修改行数：3-4

------

??? 提示1

    考虑可能的列表。代码是否涵盖了所有情况？是否有任何边界情况代码未能处理？

    阅读方法上方的 javadoc 注释可能也会有所帮助，以获得有关方法作用的更多背景信息。

    您需要编辑 handleResponses。

Debug `PalindromeStage`
!!! 任务

    有时，IntelliJ 会提示你一些它认为有问题的地方。将鼠标悬停在带有黄色/橙色高亮的错误位置（在 `PalindromeStage` 的 `digitsToIntList` 方法中 - 可以通过堆栈跟踪导航到该方法）。这是否给你提供了任何有用的信息？

    使用此功能来解决 `PalindromeStage` 中的错误。

!!! 信息

    如果调试器响应缓慢，通常是由于代码中存在无限循环。如果设置的断点从未达到，则意味着在该断点之前发生了无限循环！结合逐步调试来隔离问题。

!!! 警告

    **在此部分中有两个错误需要修复。首先修复最明显的一个，然后尝试隔离并解决第二个。此部分实验的提示适用于需要解决的第二个错误。**

    预期修改行数：3

??? 提示1仅适用于第二个错误

    如果还没有，请阅读上面的说明。查看调用 `digitsToIntList` 的方法。如果在方法中设置断点并通过调试器运行，是否能够退出 `while` 循环？我们需要满足什么条件才能跳出 `while` 循环？这个条件是否达成？尝试结合使用 Java 可视化工具，以便更仔细地通过可视化工具检查错误。

### 调试 `MachineStage`

`MachineStage` 中的 `sumOfElementwiseMax` 方法应该接受两个数组，计算这两个数组的逐元素最大值，然后对结果中的最大值求和。例如，对于两个数组 `{2, 0, 10, 14}` 和 `{-5, 5, 20, 30}`，逐元素最大值为 `{2, 5, 20, 30}`。在第二个位置，`0` 和 `5` 中较大的是 `5`。此逐元素最大值的和为 2+5+20+30=57。

有两个不同的错误导致该方法返回错误的结果。可以假设 `playStage` 中的输入解析代码是正确的。

为了找到这些错误，不需要进入 `mysteryMax` 或 `mysteryAdd` 函数，甚至不需要理解它们的作用。也就是说，应该使用 ![step over](https://sp25.datastructur.es/labs/lab03/img/step-over.png) 来 *仅查看结果* 。这些是 **神秘** 函数，故意被混淆。如果不小心进入了这两个函数，可以使用 ![step out](https://sp25.datastructur.es/labs/lab03/img/step-out.png) 按钮退出。

即使不进入这些函数，也应该能够判断它们是否存在问题。这就是抽象的妙处！即使我不知道鱼在分子水平上是如何工作的，但在某些情况下，我可以清楚地判断鱼是否已经死了。

!!! 任务

    修复两个错误，使 `sumOfElementwiseMax` 返回正确的结果。如果在 `mysteryMax` 或 `mysteryAdd` 中发现错误，请重新编写有问题的方法，而不是尝试修复它。但不要不必要地重写代码——请先确认它确实出问题了！

    预期修改行数：2-5

------


??? 提示

  - 理解 `sumOfElementwiseMax` 函数的预期作用。当你为游戏提供输入时，尝试手动或使用计算器计算答案。验证你的计算结果与输出是否一致，你会发现输出不正确。
  
  - 在调用 `sumOfElementwiseMax` 的行上设置断点。当你运行调试器时，进入 `sumOfElementwiseMax`，然后使用 ![step over](https://sp25.datastructur.es/labs/lab03/img/step-over.png) 查看 `arrayMax` 调用的结果。`arrayMax` 的输出是否符合你的预期？
  
  - 如果你认为 `arrayMax` 存在错误，应进入 `arrayMax`。不要进入 `mysteryMax`，除非你认为它有错误，那就完全重写它。
  
  - 重复 `arraySum` 和 `mysteryAdd`。

## 又一个调试谜题？！ [可选]

实验的其余部分是 **可选** 的。我们将介绍一些你可能会发现有用的 IntelliJ 调试器工具 - 异常断点和表达式监视。

!!! 危险

    不要修改 `Puzzle.java`！

!!! 警告

    这些练习将涉及处理看似复杂和不熟悉的代码。请遵循抽象屏障，尝试在不完全理解的情况下找到答案！

### 异常断点

在调试时，你有时可能会遇到意外错误，这使得确定代码错误变得困难。为帮助解决此问题，IntelliJ 允许你在异常上设置断点。这些断点确保当你的代码抛出异常时，调试器将暂停执行，允许你检查程序状态。

运行 `Puzzle` 类。你应该会看到以下输出：

![Puzzle output](https://sp25.datastructur.es/labs/lab03/img/puzzle-runtime-exception.png)

对于许多常见异常，IntelliJ 会在控制台输出中显示一个“创建断点”按钮（就在上图中 `java.lang.RuntimeException` 的右侧），该按钮允许你访问高级断点窗口。要在没有此按钮的情况下访问它，请在任何行上创建一个断点（在下图中，我们在第 23 行创建了一个断点），右键单击并选择“更多”。

![More breakpoint popup](https://sp25.datastructur.es/labs/lab03/img/more-breakpoint-popup.png)

高级断点窗口应该类似于这样：

![Advanced breakpoint window](https://sp25.datastructur.es/labs/lab03/img/advanced-breakpoint-window.png)

这里有很多内容，但你不需要了解大部分。点击左上角的加号符号，你应该会看到这样的弹出窗口：

![Exception breakpoint popup](https://sp25.datastructur.es/labs/lab03/img/add-exception-breakpoint-popup.png)

选择“Java 异常断点”，会出现另一个窗口，你可以在其中指定我们希望暂停执行的异常类型。控制台告诉我们，我们遇到了 `java.lang.RuntimeException`，因此请选择该选项。

![Runtime Exception Breakpoint](https://sp25.datastructur.es/labs/lab03/img/runtime-exception-breakpoint.png)

现在你应该看到原始的高级断点窗口，其中有一个新创建的异常断点，名为“java.lang.RuntimeException”（如果你使用控制台的“创建断点”按钮访问窗口，可能会看到两个副本，这没关系）。
您可以选择在捕获或未捕获的异常上中断，也可以选择两者兼有。这很有用，因为许多库代码会有意抛出和捕获大量异常，因此如果需要，这允许我们专注于未处理的异常。目前，请继续保持两个选项都选中。

如果此时调试程序，您的代码应在第 53 行暂停，通常的红色圆圈位置将有一个小闪电符号。这表明断点是由异常而不是普通断点触发的。

![Line 53 Exception breakpoint](https://sp25.datastructur.es/labs/lab03/img/line-53-exception-breakpoint.png)

从这里，我们可以看出 IntelliJ 暗示问题可能出在 `src/puzzle/answer.txt`。通过检查该文件，探索 `Puzzle.java`，以及使用您在实验 02 和本次实验中学到的其他调试技术，您能找出发生了什么吗？

!!! 任务

    修复 `answer.txt` 以便 `Puzzle` 不再抛出 `RuntimeException`。如果您遇到困难，请随意查看提示！

??? 提示

    问题在于 `Puzzle.java` 解析 `answer.` 为一个整数猜测，但没有找到任何内容，因此抛出异常。要解决此问题，请将 `answer.` 的 TODO 行替换为任何整数。

修复错误后，再次运行 `Puzzle`。您现在应该看到以下输出：

![Puzzle out-of-bounds exception](https://sp25.datastructur.es/labs/lab03/img/puzzle-oob-exception.png)

阅读错误消息，看看能否找出答案！如果您正确找出，`Puzzle.java` 将不再出错，您应该通过 `tests/puzzle/PuzzleTest` 中的 `testPuzzle`。

!!! 任务

    替换 `answer.txt` 中的值，使 `Puzzle` 不再出错。

### 表达式和监视

在调试时，您可能并不总是希望检查的值存储在变量中。幸运的是，IntelliJ 为我们提供了解决方案！一旦在某行暂停，您就可以使用“评估表达式”工具（形状像计算器）。您可以点击计算器图标以打开一个全新的窗口，但您也可以直接在调试器中键入表达式：

![Evaluate Expression Blank](https://sp25.datastructur.es/labs/lab03/img/eval-expr-add-watches.png)

您还可以使用此工具调用变量和方法！尽管在下面的示例中我们只使用了 `Math` 库方法，但您可以调用任何您想要的东西。在这里，我们在 `Puzzle.java` 中使用此工具，并初始 `answer` 猜测为 `973`：

![Evaluate Expression 973](https://sp25.datastructur.es/labs/lab03/img/evaluate-expression-973.png)

继续程序后，`result` 将会丢失。如果您不想丢失它，可以使用 Ctrl+Shift+Enter (Windows) 或 Cmd+Shift+Enter (Mac) 将其添加为一个 *监视* 。这将在您继续执行后仍保留它。此外，监视将会随着程序的变化而改变其值，就像普通变量一样！

监视甚至在您停止并重新运行程序后也会一直存在，因此在多次执行中进行调试时，它们非常有用。作为示例，我将之前的猜测更改为 `1717` 并重新运行整个程序，但不需要重新评估表达式即可让调试器告诉我它是什么！

![Evaluate Expression 1717](https://sp25.datastructur.es/labs/lab03/img/evaluate-expression-1717.png)

这部分没有关联的练习，但我们认为这会是一个有用的知识点！

------

恭喜，您已完成实验 03！

## 交付与评分

本次实验满分为 5 分。Gradescope 上没有隐藏测试。如果你通过了 `Adventure` 的所有本地测试，你将在实验中获得满分（除非你修改了不该修改的内容）。重申一下，“又一个调试谜题？！” 是本次实验的选做部分。最终交付物如下：

- `BeeCountingStage`（1.25 分）
- `SpeciesListStage`（1.25 分）
- `PalindromeStage`（1.25 分）
- `MachineStage`（1.25 分）