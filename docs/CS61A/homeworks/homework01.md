# 必答题

## Q1: A加B的绝对值

Python的`operator`模块包含两个参数的函数，例如`add`和`sub`，用于Python的内置算术运算符。例如，`add(2,3)`的计算结果是5，就像表达式`2+3`一样。

在下面的函数中填空，在不调用abs函数的情况下，将a加到b的绝对值上。除了两个空以外，你不能修改提供的任何代码。

```Python
def a_plus_abs_b(a, b):
    """返回 a+abs(b), 但不要调用abs函数.

    >>> a_plus_abs_b(2, 3)
    5
    >>> a_plus_abs_b(2, -3)
    5
    >>> a_plus_abs_b(-1, 4)
    3
    >>> a_plus_abs_b(-1, -4)
    3
    """
    if b < 0:
        f = _____
    else:
        f = _____
    return f(a, b)
```

使用ok来测试你的代码：

```shell
python3 ok -q a_plus_abs_b
```

使用ok来运行本地语法检查器（它会检查你除了两个空格之外，没有修改提供的任何代码）：

```shell
python3 ok -q a_plus_abs_b_syntax_check
```



## Q2: 三者中的两者

编写一个函数，该函数接受三个*正数*作为参数，并返回两个最小数的平方和。**只使用一行代码作为函数体**。

```python
def two_of_three(i, j, k):
    """返回 m*m + n*n，其中 m 和 n 是正数 i、j 和 k 之中最小的两个数。

    >>> two_of_three(1, 2, 3)
    5
    >>> two_of_three(5, 3, 1)
    10
    >>> two_of_three(10, 2, 8)
    68
    >>> two_of_three(5, 5, 5)
    50
    """
    return _____
```

> **提示**：考虑使用 `max` 或 `min` 函数：

```python
>>> max(1, 2, 3)
3
>>> min(-1, -2, -3)
-3
```

使用ok来测试你的代码：

```shell
python3 ok -q two_of_three
```

使用ok来运行本地语法检查器（它会检查你是否只使用了一行代码作为函数体）：

```shell
python3 ok -q two_of_three_syntax_check
```



## Q3: 最大因数

编写一个函数，该函数接受一个**大于 1** 的整数 `n` ，并返回小于 `n` 且能被 `n` 整除的最大整数。

```python
def largest_factor(n):
    """返回小于n的最大因子

    >>> largest_factor(15) # factors are 1, 3, 5
    5
    >>> largest_factor(80) # factors are 1, 2, 4, 5, 8, 10, 16, 20, 40
    40
    >>> largest_factor(13) # factor is 1 since 13 is prime
    1
    """
    "*** 在这里填写你的代码 ***"
```

> **提示**：要检查 `b` 是否能整除 `a` ，可以使用表达式 `a % b == 0` ，该表达式可以理解为，“ `a` 除以 `b` 的余数为 0。”

使用ok来测试你的代码：

```shell
python3 ok -q largest_factor
```



## Q4: 冰雹

道格拉斯·霍夫斯塔特（Douglas Hofstadter），在他获得普利策奖的书籍《哥德尔、埃舍尔、巴赫》（Gödel, Escher, Bach）中，提出了以下数学谜题：

1. 选择一个正整数 `n` 作为起始。
2. 如果 `n` 是偶数，将其除以 2。
3. 如果 `n` 是奇数，将其乘以 3 并加 1。
4. 继续这个过程，直到 `n` 为 1。

数字 `n` 会计算的过程中上下波动，但最终会以1结束（至少对于所有已经尝试过的数字来说——没人证明过这个序列会终止）。类似地，冰雹在大气中上下波动，最终会落在地球上。

这个 `n` 的值序列常被称为冰雹序列（Hailstone Sequences）。写一个函数，它接受一个名为 `n` 的参数。该函数打印出从 `n` 开始的冰雹序列，并返回计算序列所执行的步数：

```python
def hailstone(n):
    """从n开始打印冰雹序列，并返回序列长度。

    >>> a = hailstone(10)
    10
    5
    16
    8
    4
    2
    1
    >>> a
    7
    >>> b = hailstone(1)
    1
    >>> b
    1
    """
    "*** 在这里填写你的代码 ***"
```

冰雹序列可能会非常长！试试 27。你能找到最长的序列是什么？

> 注意，如果 `n == 1` 最初为空，则序列计算会执行一步。
>
> **提示**：如果你看到结果是4.0但只需要4，那么请尝试使用地板除（floor division）`//` 而不是普通除法 `/` 。

使用ok来测试你的代码：

```shell
python3 ok -q hailstone
```



**对 hailstone 序列感到好奇？看看这篇文章：**

- 2019 年，在hailstone 猜想中，对于理解大多数数字是如何工作的方面，有重大[进展](https://www.quantamagazine.org/mathematician-terence-tao-and-the-collatz-conjecture-20191211/)！



## 检查你的得分

运行得到本次作业中每个问题的分数。

```shell
python3 ok --score
```

