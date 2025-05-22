# 实验 1：函数 [lab01.zip](https://cs61a.org/lab/lab01/lab01.zip)

## 开始文件

下载 [lab01.zip](https://cs61a.org/lab/lab01/lab01.zip)

## 需要完成的题目

### 回顾

> **重要**：如果你的 `python3` 命令没有生效，请尝试使用 `python` 或 `py`。

??? "使用 Python"

    以下是运行 Python 文件中最常用的方式：

    1. 不使用如何命令行选项去运行你提供的文件中的代码，然后返回到命令行。如果你的文件只包含了一个函数定义，除非你有一个语法错误你将不会看到任何输出。

    ```bash
    python3 lab00.py
    ```
    2. `-i`：`-i` 选项可以在运行你提供的文件中的代码后，进入交互式环境（伴随着一个 `>>>` 提示符）。你可以进行表达式求值，比如调用你已定义的函数等。可以通过 `exit()` 来退出。你也可以在 Linux/Mac 上使用键盘快捷键 `Ctrl-D` 或在 Windows 上使用 `Ctrl-z Enter` 来进行退出。如果你在运行着交互环境时编写了 Python 文件，你需要退出并重启解释器才能使更改生效。

    以下是我们应该如何在交互环境中运行 `lab00.py`：
    ```bash
    python3 -i lab00.py
    ```
    3. `-m doctest`：运行文件中的文档测试，即函数中的文档字符串。每个测试都由 `>>>` 和一些 Python 代码以及期望的输出组成。

    以下是我们应该如何运行 `lab00.py` 中的文档测试：
    ```bash
    python3 -m doctest lab00.py
    ```

    当我们的代码通过了所有的测试时，不会有任何输出。否则，会有测试失败的信息显示。

<details>
<summary>使用 <code>OK</code></summary>

在 CS 61A 中，我们使用一个称为 <code>Ok</code> 的程序自动测试实验、作业和项目。当需要使用 <code>Ok</code> 去测试一个函数时，运行以下的命令（用函数名代替 <code>FUNCTION</code>）：
```bash
python3 ok -q FUNCTION --local
```

如果你的函数包含了开头为 <code>"DEBUG:</code> 的 <code>print</code> 的调用，那么 <code>OK</code> 程序就会忽略这一行（否则，包含额外的 <code>print</code> 调用会由于额外的输出而导致测试失败）。

```python
print("DEBUG:", x)
```

还有更多特性说明在 <a href="https://cs61a.org/articles/using-ok">OK 使用指南</a>。你可以通过 <a href="https://go.cs61a.org/ok-help">OK 帮助</a> 来快速生成大多数的命令。

</details>

<details>
<summary>除法、向下取整除法和取模</summary>

这些是 Python 3 中的一些除法相关的运算符例子：

真实的除法（十进制）：<code>/</code>
```python
>>> 1 / 5
0.2

>>> 25 / 4
6.25

>>> 4 / 2
2.0

>>> 5 / 0
ZeroDivisionError
```

向下取整除法（整数除法）：<code>//</code>
```python
>>> 1 // 5 # 会把真实的除法结果截断
0

>>> 25 // 4
6

>>> 4 // 2
2

>>> 5 // 0
ZeroDivision Error
```

取模（保留余数）：<code>%</code>
```python
>>> 1 % 5
1

>>> 25 % 4
1

>>> 4 % 2
0

>>> 5 % 0
ZeroDivisionError
```

当除以 0 的时候 <code>ZeroDivisionError</code> （除 0 错误）会出现。

一个有用的技巧是用 <code>%</code> 检查数字 <code>x</code> 是否可以整除另一个数字 <code>y</code>：
```python
x % y == 0
```
在这个例子中，我们可以通过 <code>x % 2 == 0</code> 来检查 <code>x</code> 是否是一个偶数

</details>

<details>
<summary>返回和打印</summary>

你定义的大多数函数都需要包含一个 <code>return</code> 语句，用于提供调用该函数的表达式返回值

当 Python 执行一个 <code>return</code> 语句时，函数调用会立即终止。如果 Python 到达了函数的末尾且没有执行 <code>return</code>，那么函数就会返回一个 `None`

相比之下，<code>print</code> 函数常常被用来显示数值。不像 <code>return</code> 语句，当 Python 执行一个 <code>print</code> 调用时，函数不会立即终止

```python
def what_prints():
    print('Hello World!')
    return 'Exiting this function.'
    print('This course is awesome!')

>>> what_prints()
Hello World!
`Exiting this function.'
```

注意 <code>print</code> 显示的文本没有被括号包裹，但是 <code>return</code> 将保留括号

</details>

### Python 将显示什么

#### 问题 1：返回和打印

> 在 "What Would Python Display?" （Python 会显示什么？）下，使用 Ok 去测试你的知识掌握程度：
>
> `python3 ok -q return-and-print -u --local`

```python
>>> def welcome():
...     print('Go')
...     return 'hello'
...
>>> def cal():
...     print('Bears')
...     return 'world'
...
>>> welcome()
______

>>> print(welcome(), cal())
______
```

### 完成代码

#### 问题 2：调试测试

以下是测试技巧的快速测试，这些将对于本课程非常有用。你可以参考 [调试文档](https://cs61a.org/articles/debugging/) 来回答问题

使用 Ok 去测试你的理解：
```bash
python3 ok -q debugging-quiz -u --local
```

#### 问题 3：提取数字位

实现函数 `digit`，该函数接受两个正整数 `n` 和 `k`，并只含有单一的一条返回语句。它将返回 `n` 中从右向左的第 `k` 位数字。如果 `k` 是 0，则返回最右边的数字。如果 `n` 的第 `k` 位没有数字，返回 0。

**提示**：使用 `//` 和 `%` 和内置函数 `pow` 去提取 `n` 特定位置的数字

```python
def digit(n, k):
    """Return the k-th digit from the right of n for positive integers n and k.

    >>> digit(3579, 2)
    5
    >>> digit(3579, 0)
    9
    >>> digit(3579, 10)
    0
    """
    return ____
```

使用 Ok 去测试你的代码：

```bash
python3 ok -q digit --local
```

#### 问题 4：中间值

实现 `middle` 函数，仅用一条返回表达式求出三个不同整数 `a`, `b`, `c` 中的非最大最小值。

**提示**：尝试求出三个数字的总和，然后通过内置函数 `min` 和 `max` 减去你不希望返回的值。

```python
def middle(a, b, c):
    """Return the number among a, b, and c that is not the smallest or largest.
    Assume a, b, and c are all different numbers.

    >>> middle(3, 5, 4)
    4
    >>> middle(30, 5, 4)
    5
    >>> middle(3, 5, 40)
    5
    >>> middle(3, 5, 40)
    5
    >>> middle(30, 5, 40)
    30
    """
    return ____
```

使用 Ok 去测试你的代码：
```bash
python3 ok -q middle --local
```

### 课程大纲测试

#### 问题 5：课程大纲测试

请完成 [课程大纲测试](https://go.cs61a.org/syllabus-quiz)，该测试用于确认你已经理解了课程大纲页面中的所有政策条款（工具栏上方有链接）。

### 本地分数查询

你可以本地检查每个作业问题的得分：
```bash
python3 ok --score --local
```

## 选做题

> 这些题目是可选的。如果你没有完成他们，你仍然可以获得本次作业的分数。但他们仍然是很好的练习，所以完成他们！

**你最好今天就完成这些练习！** 他们被标记为可选仅仅是因为部分学生刚刚加入到课程，他们正在赶进度，但是已经参加了前三次课的学生应该可以很好的解决这些问题，而且完成这些练习可以让作业 1 变得更加平滑。

### 问题 6：递减阶乘

让我们完成一个 `falling` 函数，它被用于计算递减阶乘：接收两个参数 `n` 和 `k`，然后返回从 `n` 开始连续 `k` 个递减整数的乘积。当 `k` 为 0 时，函数应该返回 1

```python
def falling(n, k):
    """Compute the falling factorial of n to depth k.

    >>> falling(6, 3)  # 6 * 5 * 4
    120
    >>> falling(4, 3)  # 4 * 3 * 2
    24
    >>> falling(4, 1)  # 4
    4
    >>> falling(4, 0)
    1
    """
    "*** YOUR CODE HERE ***"
```

使用 Ok 去测试你的代码：
```bash
python3 ok -q falling --local
```

### 问题 7：被 k 整除

编写一个函数 `divisible_by_k`，接受正整数 `n` 和 `k`。它打印所有小于等于 `n` 且能被 `k` 整除的正整数，并按从小到大的顺序排列。然后，返回打印的数字个数。

```python
def divisible_by_k(n, k):
    """
    >>> a = divisible_by_k(10, 2)  # 2, 4, 6, 8, and 10 are divisible by 2
    2
    4
    6
    8
    10
    >>> a
    5
    >>> b = divisible_by_k(3, 1)  # 1, 2, and 3 are divisible by 1
    1
    2
    3
    >>> b
    3
    >>> c = divisible_by_k(6, 7)  # There are no integers up to 6 that are divisible by 7
    >>> c
    0
    """
    "*** YOUR CODE HERE ***"
```

使用 Ok 去测试你的代码：
```bash
python3 ok -q divisible_by_k --local
```

### 问题 8：数字之和

编写一个函数，接受一个非负整数并返回其各位数字之和。（使用向下取整除法和取模可能会很有帮助！）
```python
def sum_digits(y):
    """Sum all the digits of y.

    >>> sum_digits(10) # 1 + 0 = 1
    1
    >>> sum_digits(4224) # 4 + 2 + 2 + 4 = 12
    12
    >>> sum_digits(1234567890)
    45
    >>> a = sum_digits(123) # make sure that you are using return rather than print
    >>> a
    6
    """
    "*** YOUR CODE HERE ***"
```

使用 Ok 测试你的代码：
```bash
python3 ok -q sum_digits --local
```

### 题目 9：会发生什么？

> 使用 Ok 去测试一下你对“Python 会显示什么”问题的理解：
> ```
> python3 ok -q if-statements -u --local
> ```
> **提示：**`print`（与 `return` 不同）*不会* 引起函数退出。

```python
>>> def ab(c, d):
...     if c > 5:
...         print(c)
...     elif c > 7:
...         print(d)
...     print('foo')
>>> ab(10, 20)
______
```

```python
>>> def bake(cake, make):
...     if cake == 0:
...         cake = cake + 1
...         print(cake)
...     if cake == 1:
...         print(make)
...     else:
...         return cake
...     return make
>>> bake(0, 29)
______

>>> bake(1, "mashed potatoes")
______
```

### 问题 10：两个 8

编写一个函数，接受一个数字，判断该数字是否包含两个相邻的 8

```python
def double_eights(n):
    """Return true if n has two eights in a row.
    >>> double_eights(8)
    False
    >>> double_eights(88)
    True
    >>> double_eights(2882)
    True
    >>> double_eights(880088)
    True
    >>> double_eights(12345)
    False
    >>> double_eights(80808080)
    False
    """
    "*** YOUR CODE HERE ***"
```

使用 Ok 去测试你的代码：
```bash
python3 ok -q double_eights --local
```
