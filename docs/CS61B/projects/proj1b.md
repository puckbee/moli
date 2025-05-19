# 项目 1B: ArrayDeque61B

## [常见问题](https://sp25.datastructur.es/projects/proj1b/faq/)

每个作业都会在顶部提供一个 FAQ 链接。你也可以通过在网址末尾添加“/faq”来访问它。项目 1B 的 FAQ 位于[此处](https://sp25.datastructur.es/projects/proj1b/faq/)。

注意这个项目有有限的提交令牌。更多细节请参阅[提交到自动评分器](#submit-to-the-autograder)。

## 简介

在项目 1A 中，我们构建了 `LinkedListDeque61B` 。现在我们将看到一个使用后备数组（而非链式节点）实现的 `Deque61B` 接口的不同方式。

在项目 1B 结束时，你将…

- 了解数据结构中后备数组的实现原理

- 通过测试和测试驱动开发来验证这些数据结构的正确性，积累更多实践经验

!!! TIP

    查看[项目1B幻灯片](https://docs.google.com/presentation/d/1kjbO8X7-i63NwQ_9wIt4HXr6APp2qc9PkghD-GO7_is/edit#slide=id.g1094ff4355_0_466)，获取一些直观提示。

!!! TIP

    观看[入门视频](https://www.youtube.com/watch?v=m1zy1tuA6o8)，了解本项目的整体概览。

我们将提供较少的框架代码。换句话说，我们会说明你需要做什么，但不会告诉你具体怎么做。

!!! TIP

    本节假设你已经完整观看了到 `ArrayList` 课程（第7讲）为止的所有讲座。

!!! TIP

    本项目必须独立完成！请仔细阅读[协作与作弊政策](https://sp25.datastructur.es/policies/#collaboration-and-academic-misconduct)，了解具体要求。特别是，请不要在网上查找解决方案。

!!! DANGER

    不用多说，你不能使用任何内置的 `java.util` 数据结构！整个项目就是要自己实现这些结构！在测试之外有几个地方可以使用特定数据结构，我们会明确说明在哪里可以使用。

### 代码风格

和项目 1A 一样， **我们将严格检查代码风格** 。你必须遵守[样式指南](https://sp25.datastructur.es/resources/guides/style/)，否则会在自动评分器中被扣分。

你可以使用 CS
61B 插件在本地检查代码风格。 **我们不会因为未检查风格而解除提交限制。**

### 获取框架代码

按照[作业流程指南](https://sp25.datastructur.es/resources/guides/assignment-workflow/#assignment-workflow)的说明获取框架代码并在 IntelliJ 中打开。本项目中，我们将在 `proj1b` 目录下进行开发。

你将看到仓库中出现一个 `proj1b` 目录，结构如下：

```txt
 proj1b
├── src
│   └── deque
│       ├── Deque61B.java
│       └── Maximizer61B.java
└── tests
    ├── ArrayDeque61BPreconditionTest.java
    ├── ArrayDeque61BTest.java
    └── Maximizer61BTest.java
```

注意你还会看到一个 `gh2` 目录和相关的测试文件 `TestGuitarString.java` 。这些是与可选的 Guitar
Hero 部分相关的，你可以继续往下阅读了解。

如果遇到错误，请停下来仔细阅读[git 常见问题](https://sp25.datastructur.es/resources/guides/git/wtfs/)，或者去 OH 或 Ed 寻求帮助。相比随意尝试 git 命令，这能节省你大量时间。如果你发现自己想用 Google 推荐的命令比如 `force push` ，[千万别这么做](https://twitter.com/heathercmiller/status/526770571728531456)。 **即使 Stack Overflow 上的帖子建议这么做，也别用 force push！**

你也可以观看 Hug 教授的[演示](https://www.youtube.com/watch?v=tABtNcN5y0A)了解如何开始，遇到 git 问题时再看[这个视频](https://www.youtube.com/watch?v=Squ8TmG5mX0)。

## Deque: ADT 和 API

如果你需要复习 `Deque61B` 的相关内容，请参阅[项目 1A 规范](https://sp25.datastructur.es/projects/proj1a/#deque-adt-and-api)和 `Deque61B.java` 文件。

## Creating the File

首先创建名为 `ArrayDeque61B` 的文件。该文件应放在 `proj1b/src/deque` 目录下。右键点击 `deque` 目录，选择”New -> Java Class”，然后将其命名为 `ArrayDeque61B` 。

我们希望 `ArrayDeque61B` 能够存储多种类型的数据。例如， `ArrayDeque61B<String>` 存储 `String` 类型， `ArrayDeque61B<Integer>` 存储 `Integer` 类型。为此，需要将类声明修改为：

```java
public class ArrayDeque61B<T>
```

课堂上讲过，使用 `T` 或其他名称如 `ArrayDeque61B<Glerp>` 实际上没有区别。但我们建议使用 `<T>` 以保持与其他 Java 代码的一致性。

我们还需要告诉 Java 每个 `ArrayDeque61B` 都是一个 `Deque61B` ，这样用户就可以编写如 `Deque61B<String> lld1 = new ArrayDeque61B<>();` 的代码。为此，需要将类声明修改为：

```java
public class ArrayDeque61B<T> implements Deque61B<T>
```

完成这一步后，你可能会在整个类声明下方看到一条红色波浪线。这是因为你声明了你的类实现了一个接口，但你还没有实际实现任何接口方法。

将鼠标悬停在红线上，当 IntelliJ 弹出窗口出现时，点击“Implement
methods”按钮。确保列表中的所有方法都已高亮显示，然后点击“OK”。现在，你的类中应该充满了一堆空的方法声明。这些就是你在这个项目中需要实现的方法！

最后，你需要创建一个空的构造函数。在文件中添加以下代码，目前先保持构造函数体为空：

```java
public ArrayDeque61B() {
}
```

注意：你也可以通过点击”Code”，然后选择”Generate”再选择”Constructor”来生成构造函数，但我们更推荐手动输入代码的方式。

现在你已经准备好开始了！

## `ArrayDeque61B`

作为第二个双端队列的实现，你将构建 `ArrayDeque61B` 类。这个双端队列 **必须** 使用 Java 数组作为底层数据结构。

你可以在 `ArrayDeque61B.java` 中添加任何私有的辅助类或方法（如果需要的话）。

### 构造函数

你需要以某种方式跟踪数组中哪些索引保存了双端队列的前端和后端元素。我们 **强烈建议** 在本练习中将数组视为循环数组。换句话说，如果你的前端元素位于位置 `0` ，当调用 `addFirst` 时，新的前端应循环回到数组末尾（这样双端队列中的新前端元素将成为底层数组的最后一个元素）。这种方式会比非循环方法减少很多麻烦。

!!! TIP

    更多细节请参见[项目1B演示幻灯片](https://docs.google.com/presentation/d/1kjbO8X7-i63NwQ_9wIt4HXr6APp2qc9PkghD-GO7_is/edit#slide=id.g1094ff4355_0_466)。特别注意，虽然概念上的双端队列和数组包含相同的元素，但它们的顺序不同。

我们建议使用 Java 内置 `Math` 类的 `floorMod(int a, int b)` 方法来帮助设计循环方法。与 `a % b` 在 a 为负数时可能返回负数不同， `floorMod(int a, int b)` 总是返回非负数。实际上这意味着结果的符号与除数相同。以下是使用 `floorMod(int a, int b)` 方法的一些示例：

```java
int value1 = Math.floorMod(16, 16); // value1 == 0
int value2 = Math.floorMod(-1, 16); // value2 == 15
int value3 = Math.floorMod(20, 16); // value3 == 4
```

你可以通过在文件顶部添加以下导入语句来使用 `floorMod(int a, int b)` 方法： `import java.lang.Math;` 。

!!! WARNING

    在Java中无法创建泛型数组（例如 `new T[1000]` ），这是由于[超出本课程范围的原因](https://openjdk.org/projects/valhalla/)。你需要使用 `(T[]) new Object[1000]` 的语法。

!!! TASK

    声明必要的实例变量，并实现构造函数。你的底层数组的初始大小必须为 `8` 。

### `addFirst`和`addLast`

如前所述，实现 `addFirst` 和 `addLast` 方法。这两个方法不能使用循环或递归。单个添加操作必须在”常数时间”完成，即无论双端队列有多大，添加元素所需时间大致相同（有一个例外）。这意味着你不能使用遍历双端队列的所有/大部分元素的循环。

### `get`

与 `LinkedListDeque61B` 不同，此方法必须在常数时间内完成。

如前所述，当索引无效（太大或负数）时， `get` 应返回 `null` 。对于这种情况，你可以忽略 `Deque61B.java` 中的框架代码注释。

!!! TASK

    **在编写测试并验证其失败后** ，实现 `get` 方法。

### `isEmpty`和`size`

这两个方法必须在常数时间内完成。也就是说，任一方法执行完毕所需的时间不应取决于双端队列中有多少元素。

!!! TASK

    **为isEmpty和size方法编写测试** ，并确认它们失败。然后实现这些方法。

### `toList`

`toList` 将继续用于测试你的 `Deque61B` 。

编写 `toList` 方法。该方法的第一行应该是类似 `List<T> returnList = new ArrayList<>();` 的语句 **这是唯一允许使用 Java 数据结构的位置。**

!!! WARNING

    如果使用 `toList` ，某些后续方法可能会变得简单。 **你不得在 `ArrayDeque61B` 内部调用 `toList` ；有一个测试会检查这一点。**

!!! TIP

    **提示**  其他某个方法可能有助于实现此方法。

!!! TASK

    实现 `toList` 方法。这次没有提供测试，所以你需要自己编写！

剩下要做的就是测试并实现所有剩余方法。在本项目的后续部分中，我们将以较高层次描述建议步骤。我们 **强烈建议** 你按照给出的顺序完成剩余步骤。特别是， **在实现前先编写测试** 。这种做法称为”测试驱动开发”，能帮助你确保在动手前清楚方法的预期行为。

### `removeFirst`和`removeLast`

最后，编写测试以验证 `removeFirst` 和 `removeLast` 的行为，并再次确保测试失败。

不要保留不再存在于双端队列中的元素引用。

`removeFirst` 和 `removeLast` **不得** 使用循环或递归。与 `addFirst` 和 `addLast` 一样，这些操作必须在”常数时间”完成。有关这方面的更多信息，请参阅关于编写 `addFirst` 和 `addLast` 的章节。

### `getRecursive`

虽然本次项目不再使用链表，但仍然需要实现此方法以保持与接口的一致性。从技术角度看，此方法本不应该出现在接口中，但为了方便测试，我们将其保留。你可以直接使用以下代码块：

```java
@Override
public T getRecursive(int index) {
    throw new UnsupportedOperationException("No need to implement getRecursive for proj 1b");
}
```

!!! TASK

    “实现”  `getRecursive` 。

### 调整大小

!!! WARNING

    我们建议你先完成其他方法，确认它们在不调整大小的情况下能正确运行，再回来处理调整大小。

#### 调整大小（扩容）

数组双端队列的”常数时间”要求有一个例外情况：当数组装满时，需要”调整大小”以腾出空间添加下一个元素。此时可以花费”线性时间”调整数组大小后再添加元素。

正确调整数组大小非常具有挑战性，需要深入思考。建议通过手动画出各种方法进行尝试。这可能需要你花较长时间才能找到正确方案，我们鼓励你与同学或助教讨论这些核心概念。但请确保你的实际实现 **完全由你自己完成** 。

确保通过几何因子进行调整。

!!! DANGER

    我们 **不建议** 在循环实现中使用 `arraycopy` 。虽然可行，但会显著增加实现复杂度（更难调试！）。相反，建议思考如何实现 `get` 方法，用 `for` 循环进行调整。

!!! TASK

    请先实现 `addFirst` 和 `addLast` ，并编写测试用例验证其正确性。确保添加足够多的元素触发后备数组调整！关于调整大小的更多信息，请参考[这些幻灯片](https://docs.google.com/presentation/d/1AUaNTKX0f-nFqmqEWEEecLxIQh9hrpTDtz_lWVMl5Fw/edit#slide=id.g625dc7e36_0943)。

#### 调整大小（缩容）

程序在任何时刻使用的内存必须与元素数量成正比。例如，如果向双端队列添加了 10,000 个元素，然后删除了 9,999 个元素，你不应该仍然使用可容纳 10,000 个元素的数组。对于长度为 16 或更大的数组，使用率必须始终至少为 25%。这意味着在执行删除操作前，如果数组中的元素数量等于或低于数组长度的 25%，需要将数组缩容。对于长度为 15 或更小的数组，使用率可以任意低。

!!! DANGER

    再次强调，我们 **不建议** 在循环实现中使用 `arraycopy` 。如果你按照上述建议用 `for` 循环进行扩容，缩容操作应该与扩容 **非常相似** （或许可以用一个辅助方法？）

!!! TASK

    **在编写测试用例并确认其失败后** ，再实现 `removeFirst` 和 `removeLast` 。

!!! DANGER

    为了获得最佳体验，请按顺序执行以下步骤。如果你尝试其他方法并寻求帮助，我们会将你重新引导至这些步骤。

### 编写测试用例

参考[项目 1A 规范](https://sp25.datastructur.es/projects/proj1a/#writing-tests)复习如何编写测试用例。与项目 1A 类似，你将根据项目 1B 的单元测试覆盖率获得评分。你可能发现部分项目 1A 的测试用例可以复用，不要害怕将它们复制过来！

!!! TIP

    请注意，在编写覆盖率测试时，只能使用 `Deque` 接口中定义的变量和方法。因为我们会用”自己的”双端队列实现运行你的测试用例，以判断其覆盖率是否足够。

    你可以通过提交到 `[UNGRADED] Project 1B: ArrayDeque Test Coverage` 作业来测试覆盖率，该作业不会被评分且无速度限制。最终的测试覆盖率评分将基于你提交到主 `Project 1B: ArrayDeque` 作业的成果。

### 建议

- 先确保固定大小数组的所有功能正常运行。这是一个很好的起点，可以帮助你熟悉实现逻辑。

- 在确认固定大小数组的解决方案可靠后，再尝试调整大小——可以考虑添加一个辅助方法！

- **不要** 修改 `Deque61B` 接口。

- 有问题，就画图！我们建议使用流程图来理解方法中的逻辑问题，这将帮助你更好地理解代码和预期逻辑。

## `Deque61B`增强功能

在本项目的这一部分中，你将扩展 `Deque61B` 接口的功能。

### 对象方法

为了实现以下方法，你需要先将 Project 1A 中的 `LinkedListDeque61B` 实现复制并粘贴到 `src` 目录中。

#### `iterator()`

我们 `Deque61B` 接口的一个缺陷是无法进行迭代。也就是说，下面的代码无法通过编译，报错为“foreach 不适用于类型”。

```java
  Deque61B<String> lld1 = new LinkedListDeque61B<>();

  lld1.addLast("front");
  lld1.addLast("middle");
  lld1.addLast("back");
  for (String s : lld1) {
      System.out.println(s);
  }
```

同样，如果尝试编写一个测试用例验证 `Deque61B` 是否包含特定的元素集合，也会出现编译错误，提示为“无法解析方法 containsExactly 在 Subject 中”。

```java
public void addLastTestBasicWithoutToList() {
    Deque61B<String> lld1 = new LinkedListDeque61B<>();

    lld1.addLast("front"); // 调用后预期元素为 ["front"]
    lld1.addLast("middle"); // 调用后预期元素为 ["front", "middle"]
    lld1.addLast("back"); // 调用后预期元素为 ["front", "middle", "back"]
    assertThat(lld1).containsExactly("front", "middle", "back");
}
```

问题依然是我们的对象无法被迭代。 `Truth` 库通过迭代我们的对象来工作（如第一个示例），但我们的 `LinkedListDeque61B` 不支持迭代。

要解决这个问题，你需要首先修改 `Deque61B` 接口，使其声明变为：

```java
public interface Deque61B<T> extends Iterable<T> {
```

然后使用讲座 10 中提到的技术实现 `iterator()` 方法。

!!! TASK

    任务：根据讲座内容在 `LinkedListDeque61B` 和 `ArrayDeque61B` 中实现 `iterator()` 方法。

!!! DANGER

    这里不允许调用 `toList` 方法。

#### `equals()`

考虑以下代码：

```java
    @Test
    public void testEqualDeques61B() {
        Deque61B<String> lld1 = new LinkedListDeque61B<>();
        Deque61B<String> lld2 = new LinkedListDeque61B<>();

        lld1.addLast("front");
        lld1.addLast("middle");
        lld1.addLast("back");

        lld2.addLast("front");
        lld2.addLast("middle");
        lld2.addLast("back");

        assertThat(lld1).isEqualTo(lld2);
    }
```

如果我们运行这段代码，会发现测试失败，报错信息如下：

```txt
expected: [front, middle, back]
but was : (non-equal instance of same class with same string representation)
```

问题在于 `Truth` 库使用了 `LinkedListDeque61B` 类的 `equals` 方法。默认实现由以下代码提供：

```java
    public boolean equals(Object obj) {
        return (this == obj);
    }
```

也就是说， `equals` 方法仅检查两个对象的地址是否相同。我们希望比较两个 `Deque61B` 对象的元素顺序和内容是否相等，因此需要自定义 `equals` 方法。

在 `ArrayDeque61B` 和 `LinkedListDeque61B` 中重写 `equals` 方法。关于编写 `equals` 方法的指导，请参考[讲座幻灯片](https://docs.google.com/presentation/d/1lIR4--P9NrBqRL9xqP_RQYyK1WJBrBEbriLVpatrRqk/edit#slide=id.g4f922fa56b_2_47)或[讲座代码仓库](https://github.com/Berkeley-CS61B/lectureCode-sp23/blob/main/lec12_inheritance4/ArraySet.java)。

!!! TIP

    注意：你可能会问为什么要在两个类中实现相同的方法，而不是在 `Deque61B` 接口中提供默认方法。接口不允许提供覆盖 `Object` 方法的默认方法。更多内容请[参见](https://stackoverflow.com/questions/24595266/why-is-it-not-allowed-add-tostring-to-interface-as-default-method)。

    但一种解决方式是在 `Deque61B` 接口中提供一个非 `Object` 的默认辅助方法，让实现类调用它。

!!! TASK

    在 `LinkedListDeque61B` 和 `ArrayDeque61B` 类中覆盖 `equals()` 方法。

!!! WARNING

    重要：你不应该使用 `getClass` ，并且在你的 `equals` 方法中不需要进行任何类型转换。也就是说，你不应该执行 `(ArrayDeque61B) o` 这样的操作。这类 `equals` 方法已经过时且过于复杂。请改用 `instanceof` 。

    注意：由于超出本课程范围的原因， `instanceof` 运算符在处理泛型类型时行为有些奇怪。例如，如果你想检查 `lst` 是否是 `List<Integer>` 的实例，你应该使用 `lst instanceof List<?>` 而不是 `lst instanceof List<Integer>` 。不幸的是，这无法检查元素的类型，但这是我们能做到的最好的了。

!!! WARNING

    重要：覆盖方法时，请确保使用 `@Override` 标签。代码中一个常见的错误是试图覆盖 `equals(ArrayList<T> other)` 而不是 `equals(Object other)` 。使用可选的 `@Override` 标签会使你的代码在犯此错误时无法编译。 `@Override` 是一个很好的安全保障。

!!! DANGER

    此处 **不允许调用 `toList` 方法** 。

### `toString()`方法

考虑以下示例代码，该代码段打印了一个 `LinkedListDeque61B` ：

```java
Deque61B<String> lld1 = new LinkedListDeque61B<>();
lld1.addLast("front");
lld1.addLast("middle");
lld1.addLast("back");

System.out.println(lld1);
```

这段代码会输出类似 `deque.proj1a.LinkedListDeque61B@1a04f701` 的内容，原因是未覆盖 `toString()` 方法。默认的 `toString()` 实现如下所示：

```java
public String toString() {
    return getClass().getName() + "@" + Integer.toHexString(hashCode());
}
```

此外，默认的 `hashCode()` 方法会返回对象的内存地址（例如示例中的 `1a04f701` ）。

!!! TASK

    **任务** ：在 `LinkedListDeque61B` 和 `ArrayDeque61B` 类中覆盖 `toString()` 方法，使其输出形如 `[front, middle, back]` 的字符串。

!!! WARNING

    提示：Java 的 `List` 接口已有 `toString()` 实现。

    提示：存在一行代码的解决方案（见提示1）。

    提示： `LinkedListDeque61B` 和 `ArrayDeque61B` 的实现应完全一致。

### 对象方法测试

我们未提供针对这三个方法的测试文件，但 **强烈建议你使用已学技术编写自己的测试用例** 。你可以自由设计测试结构，建议在 `tests` 目录中创建 `LinkedListDeque61BTest` 文件，为每个实现类单独编写测试文件。

## `Maximizer61B`

!!! WARNING

    本节内容需要了解第9讲：子类型多态、比较器和第10讲：迭代器、对象方法。

在项目的最后部分，你将构建 `Maximizer61B` 类。这个类与你之前编写的 `ArrayDeque61B` 部分是独立的。

这部分项目内容虽然与之前的部分关联不大，但能帮助你练习处理 Iterable、Comparable 和 Comparator。

`Maximizer61B` 类有两个静态方法：

- `public static <T extends Comparable<T>> T max(Iterable<T> iterable)` ：返回给定迭代器中的最大元素。
- `public static <T> T max(Iterable<T> iterable, Comparator<T> comp)` ：根据指定的比较器返回迭代器中的最大元素。

如果迭代器为空，直接返回 `null` 。

## Guitar Hero（可选）

现在你已经创建了双端队列（deque），让我们用它来做一些有趣的事情！在本项目这部分，我们将创建另一个包来使用 `deque` 包生成合成乐器。我们有机会用数据结构实现一个算法来模拟吉他弦的拨动。

### GH2 包

`gh2` 包只有一个主要组件需要修改：

- `GuitarString` ，一个使用 `Deque61B<Double>` 实现[Karplus-Strong 算法](http://en.wikipedia.org/wiki/Karplus%E2%80%93Strong_string_synthesis)的类，用于合成吉他弦声音。

我们为你提供了 `GuitarString` 的框架代码，你将在此处使用第一部分中创建的 `deque` 包。

### `GuitarString`

我们想要完成 `GuitarString` 文件，该文件应使用 `deque` 包来复制拨动弦线的声音。请注意，该文件使用了”buffer”这个词，此处是”deque”的同义词。

我们将使用 Karplus-Strong 算法，用 `Deque61B` 实现起来非常简单。它包括以下三个步骤：

1.  将 `Deque61B` 中的每个元素替换为随机噪声（-0.5 到 0.5 之间的 `double` 值）。

2.  播放 `Deque61B` 前面的 `double` 值。

3.  移除 `Deque61B` 前面的 `double` ，将其与下一个 `double` 值（提示：使用 `removeFirst` 和 `get()` ）相加后乘以能量衰减因子 0.996（我们将此总量称为 `newDouble` ），然后将 `newDouble` 添加到 `Deque61B` 的末尾。回到步骤 2（无限循环）。

或者从视觉上看，如果 `Deque61B` 如顶部所示，我们将播放 0.2，将其移除，与 0.4 结合得到 0.2988，然后添加 0.2988。

![karplus-strong](images/proj1b//karplus-strong.png)

### 完成 `GuitarString.java`

补全 `GuitarString.java` ，使其实现 Karplus-Strong 算法。记得在 `GuitarString` 构造函数里用零填满 `Deque61B` 缓冲区。类的调用方会处理部分流程，你只需完成标有 `TODO` 的任务。

!!! DANGER

    别在 `GuitarString.java` 里调用 `StdAudio.play` ，否则会导致自动评分器出错。 `GuitarPlayer.java` 已经帮你调用了。

!!! TIP

    记得像往常一样添加所需库，否则IntelliJ找不到 `StdAudio` 。

例如，提供的 `TestGuitarString` 类中有一个示例测试 `testPluckTheAString` ，它会尝试播放 A 调音符。运行该测试时如果能听到 A 音说明正确；如果听不到，可以先调试 `testTic` 方法。你也可以给 `GuitarString.java` 加个 `print` 或 `toString` 方法，方便观察每次 `tic` 后的缓冲区状态。

### 原理解析

Karplus-Strong 算法的两个核心组成部分是环形缓冲区的反馈机制和取平均操作。

- **环形缓冲区反馈机制**
  环形缓冲区模拟了两端固定的弦，在其中能量来回传播。缓冲区的长度决定了生成音的基频。听起来反馈机制只强化基频及其整数倍的谐波。衰减系数（这里为 0.996）模拟了波在弦上往返时的能量损失。

- **取平均操作**
  取平均相当于一个温和的低通滤波（让高频衰减、低频保留）。由于它在反馈路径中，会逐渐削弱高次谐波，保留低次谐波，这与拨弦声效很相似。

### `GuitarHeroLite`

现在你也可以使用 `GuitarHeroLite` 类了。运行它会弹出图形界面，使用 `gh2` 包里的 `GuitarString` 类与用户（你！）实时交互，演奏音符。

### 提交给自动评分器

在本地写完测试并全部通过后，就可以提交给自动评分器。可能全过，也可能有测试未过：

1.  如果覆盖率测试没过，说明本地测试遗漏了某些场景。自动评分器会给出测试名和覆盖率组件，帮你定位缺失点。

2.  如果功能正确性测试没过，说明本地测试虽然覆盖了大部分情况，但有些行为没断言到。这很正常，覆盖率只是近似评估，不保证涵盖所有边界。[这里](https://sp25.datastructur.es/projects/proj1b/flags/)列出了相关标记。

3.  如果性能测试没过，说明实现不满足上文描述的时间要求。你有每 24 小时 4 次提交令牌。因代码、风格等原因多次提交导致令牌耗尽，不会补发。自动评分器输出里可能会看到 `WARNING: A terminally deprecated method in java.lang.System has been called` 之类警告，可以放心忽略。

### 评分标准

本项目与 Project
0 类似，分为多个独立组件，每个组件都必须完全正确实现才能获得分数。

1.  **添加功能（20%）** ：正确实现 `addFirst` 、 `addLast` 和 `toList` 。

2.  **`isEmpty` 和 `size` （3.33%）** ：正确实现 `isEmpty` 和 `size` ，并确保添加方法正常工作。

3.  **`get` （3.33%）** ：正确实现 `get` 。

4.  **移除功能（20%）** ：正确实现 `removeFirst` 和 `removeLast` 。

5.  **内存管理（16.67%）**：正确实现调整大小以避免内存过多使用。

6.  **`LinkedListDeque61B` 对象方法（10%）** ：正确实现 `iterator` 、 `equals` 和 `toString` 在 `LinkedListDeque61B` 中。

7.  **`ArrayDeque61B` 对象方法（10%）** ：正确实现 `iterator` 、 `equals` 和 `toString` 在 `ArrayDeque61B` 中。

8.  **`Maximizer61B` 功能（10%）** ：正确实现 `max()` 和 `max(Comparator<T> comp)` 在 `Maximizer61B` 中。

9.  **测试覆盖率（6.67%）**：编写足够多的测试用例。

对于 **测试覆盖率** 这一项，我们会用你的测试与官方参考实现对比，检查覆盖了多少场景和边界情况。你可以为此部分获得部分分数。[这里](https://sp25.datastructur.es/projects/proj1b/flags/)列出了相关场景！
