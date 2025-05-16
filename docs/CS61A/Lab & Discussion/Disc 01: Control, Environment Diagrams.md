# 讨论 1：控制与环境结构图[disc01.pdf](https://cs61a.org/disc/disc01/disc01.pdf)

找到你的小组，然后按照伯克利时间开始此工作表。最好每位成员都有办法查看此工作表（手机或平板也可以，但是最好是笔记本电脑）。

现在切换到 Pensieve，这是一个共享编辑的应用，它提供了相同的工作表格式，以便你们小组协作并向 AI 提问。

* **每个人：** 访问 [pensieve.co](https://tutor.pensieve.co/student/courses/cs61a/clazzes/cs61a_sp25/assignments/65b05114a4f67e33586a35ad)，使用你的 @berkeley.edu 邮箱登陆，并 **输入你的组号** 作为房间名（它在你进入本次实验时以邮箱的形式为你分配）。只要你们使用了相同的号码（无论是什么号码），你们将可以使用一个共享文档。

一旦你们进入 Pensieve，就无需返回此页面；Pensieve 包含所有相同的内容（但有更多功能）。如果 Pensieve 由于某种原因无法使用，可以返回此页面并继续你的讨论。

## 考勤

填写此[讨论考勤表](http://go.cs61a.org/discussion-attendance)，使用你从助教那里获得的唯一号码。一旦你获得了号码，请立即填写表格，并选择 *到达* （不是离开——离开稍后填写）。

## 破冰活动

每个人说出自己的名字以及喜欢做的一项户外活动。对于每个活动，询问小组中是否有人也喜欢做这个活动。（可选：实验结束后，你们可以计划一起去做其中一项活动。）

然后，每个人分享一句人们在非常喜欢某样东西时会说的话，比如“太棒了”或“好样的”或“哇”。每个人都应该尝试想出一个不同的表达。如果你卡住了，可以向小组寻求帮助。你们甚至可以使用英语以外的其他语言。然后，在讨论过程中，如果有人做得很好或说得不错，使用你自己选的表达！

## while 和 if

学习使用 `if` 和 `while` 是一项必要的技能。在本次讨论中，重点学习我们在前三次讲座中所学习的内容：`if`、`while`、赋值（`=`）、比较（`<`, `>`, `==`, ...）和算术运算。请不要使用我们还没有在课堂上讨论过的 Python 特性，如 `for`、`range` 和列表。后面课程中会有足够的时间学习这些，但现在是练习使用 `if`（教科书第 [1.5.4](https://www.composingprograms.com/pages/15-control.html#conditional-statements) 节）和 `while`（教科书第 [1.5.5](https://www.composingprograms.com/pages/15-control.html#conditional-statements) 节）的好时机。

### 问题 1：`Race`

下面的 `race` 函数有时会返回错误的值，有时会永远执行下去。

```python
def race(x, y):
    """The tortoise always walks x feet per minute, while the hare repeatedly
    runs y feet per minute for 5 minutes, then rests for 5 minutes. Return how
    many minutes pass until the tortoise first catches up to the hare.

    >>> race(5, 7)  # After 7 minutes, both have gone 35 steps
    7
    >>> race(2, 4) # After 10 minutes, both have gone 20 steps
    10
    """
    assert y > x and y <= 2 * x, 'the hare must be fast but not too fast'
    tortoise, hare, minutes = 0, 0, 0
    while minutes == 0 or tortoise - hare:
        tortoise += x
        if minutes % 10 < 5:
            hare += y
        minutes += 1
    return minutes
```

找到正整数 `x` 和 `y`（其中 `y` 大于 `x`，但不大于 `2 * x`），使得以下条件之一成立：

* `race(x, y)` 返回错误的值，或者
* `race(x, y)` 永远运行下去

你只需要找到一对满足以上任一条件的数字就可以完成这个问题，但如果你想思考更多的情况也是可以的。

注意事项：

* `x += 1` 和 `x = x + 1` 是一样的，当 `x` 被赋值为一个数字时。
* 0 是一个假值，所有其他数字都是实值。

<details>
<summary>提示</summary>

如果不是第一次乌龟超过兔子时，<code>race(x, y)</code> 的值是错误的。试试一些小数字（小于 5），看看能否找到乌龟已经比兔子大，但表达式 <code>tortoise - hare</code> 并没有为零的情况。

</details>

如果你想与助教讨论这个问题，可以直接提问。

### Q2: `Fizzbuzz`

实现经典的 [Fizz Buzz 序列](https://en.wikipedia.org/wiki/Fizz_buzz)。`fizzbuzz` 函数接受一个正整数 `n`，并为从 1 到 n 的每个整数打印 *一行* 。对于每个 `i`：

- 如果 `i` 同时能被 3 和 5 整除，打印 `fizzbuzz`。
- 如果 `i` 能被 3 整除（但不能被 5 整除），打印 `fizz`。
- 如果 `i` 能被 5 整除（但不能被 3 整除），打印 `buzz`。
- 否则，打印数字 `i`。

尝试使你的 `fizzbuzz` 实现简洁。

```python
def fizzbuzz(n):
    """
    >>> result = fizzbuzz(16)
    1
    2
    fizz
    4
    buzz
    fizz
    7
    8
    fizz
    buzz
    11
    fizz
    13
    14
    fizzbuzz
    16
    >>> print(result)
    None
    """
    "*** YOUR CODE HERE ***"
```

<details>
<summary>提示</summary>
小心 <code>if</code> 和 <code>elif</code> 子句的顺序：首先检查当前数字是否同时能被 3 和 5 整除，然后再检查是否仅能被 3 整除，或者仅能被 5 整除。
</details>

## 问题解决

实现一个函数的有用方法是：

1. 选择一个示例输入和相应的输出。
2. 描述一个过程（用英语），该过程可以使用简单的步骤计算出从输入到输出的结果。
3. 确定你需要哪些附加的名称来执行此过程。
4. 使用这些附加名称在代码中实现该过程。
5. 确定实现是否真的在你的原始示例上有效。
6. 确定实现是否在其他示例上也有效。（如果不行，你可能需要修改第 2 步。）

重要的是，这种方法不是直接从阅读问题跳到编写代码。

例如，在下面的 `is_prime` 问题中，你可以：

1. 选择输入的 `n` 为 9，输出为 False。
2. 过程如下：检查 `9`（`n`）是否不能被 1 到 `9`（`n`）之间的任何整数整除。
3. 引入 `i` 来表示 1 到 9（`n`）之间的每个数字。
4. 实现 `is_prime`（这部分可以和你的组一起完成）。
5. 通过思考代码执行的过程，检查 `is_prime(9)` 是否返回 False。
6. 检查 `is_prime(3)` 是否返回 `True`，以及 `is_prime(1)` 是否返回 `False`。

在接下来的两个问题上，试着一起使用这个方法。

**重要提示**：强烈建议你 **不要** 马上使用计算机检查你的工作。相反，通过小组讨论并思考，试着弄清楚答案是否正确。在考试中，你不能通过猜测和检查来解决问题，因为你没有 Python 解释器。现在是练习通过思考示例来检查工作的好时机。你甚至可以画一个环境图！

如果你不确定某个功能如何工作或遇到困难，请向课程工作人员寻求帮助。

### 问题 3：是否是质数？

编写一个函数，如果正整数 `n` 是质数，则返回 `True`，否则返回 `False`。

质数 n 是一个只能被 1 和 n 本身整除的数字。例如，13 是质数，因为它只能被 1 和 13 整除，但 14 不是质数，因为它可以被 1、2、7 和 14 整除。

使用 `%` 运算符：`x % y` 返回 `x` 除以 `y` 的余数。

<details>
<summary>提示</summary>

下面是一个 <code>while</code> 循环语句，它遍历所有大于 1 且小于 <code>n</code> 的数字：

```python
i = 2
while i < n:
    ...
    i = i + 1
```

你可以使用 <code>n % i == 0</code> 来检查 <code>i</code> 是否是 <code>n</code> 的因数。如果是，返回 <code>False</code>。
</details>

```python
def is_prime(n):
    """
    >>> is_prime(10)
    False
    >>> is_prime(7)
    True
    >>> is_prime(1) # one is not a prime number!!
    False
    """
    "*** YOUR CODE HERE ***"
```

**描述时间**：想出 **一句话来描述** 你为解决 <code>is_prime</code> 问题而实现的过程，应该使别人无需查看你的代码也能理解。尽量不要仅仅读你的代码，而是描述它执行的过程。

### 问题 4：唯一数字

编写一个函数，返回正整数中包含的不同数字的个数。

> **提示**：你可以使用 `//` 和 `%` 来将正整数分离成个位数字和其余数字。
>
> 你可能会发现，先定义一个 `has_digit(n, k)` 函数很有帮助，它可以判断一个数字 `n` 是否包含数字 `k`。

```python
def unique_digits(n):
    """Return the number of unique digits in positive integer n.

    >>> unique_digits(8675309) # All are unique
    7
    >>> unique_digits(13173131) # 1, 3, and 7
    3
    >>> unique_digits(101) # 0 and 1
    2
    """
    "*** YOUR CODE HERE ***"

def has_digit(n, k):
    """Returns whether k is a digit in n.

    >>> has_digit(10, 1)
    True
    >>> has_digit(12, 7)
    False
    """
    assert k >= 0 and k < 10
    "*** YOUR CODE HERE ***"
```

<details>
<summary>提示</summary>

一个方法是去遍历数字 0 到 9,并检查 <code>n</code> 是否包含该数字。计算存在数字的个数。
</details>

## 环境图

**环境图** 跟踪名字及其值在帧中的情况，帧被绘制为方框。

### 问题 5：瓶子

请与你的小组一起回答以下问题。通过逐步检查图表来验证你的答案。

1) 什么决定了环境图中出现的不同帧的数量？

* a) 代码中定义的函数数量

* b) 代码中调用表达式的数量

* c) 代码中返回语句的数量

* d) 在运行代码时用户定义的函数被调用的次数

2) `pass_it(bottles)` 的返回值会发生什么？

* a) 它作为全局帧中 `remaining` 的新值
* b) 它作为全局帧中 `bottles` 的新值
* c) 它作为全局帧中 `pass_it` 的新值
* d) 以上都不是

3) 代码行 `bottles = 98` 对全局帧有什么影响？

* a) 它临时更改了全局帧中绑定的 `bottles` 的值。
* b) 它永久更改了全局帧中绑定的 `bottles` 的值。
* c) 它对全局帧没有影响。

### 问题 6：双重麻烦

在纸上或白板上画出环境图（不要让电脑帮你画）！然后，通过逐步检查图表来验证你的工作。

## 记录此次活动

让你的助教知道你已经完成，这样你可以获得一个 **离开** 编号，然后再次填写[出勤表](http://go.cs61a.org/discussion-attendance)（这次选择 *离开* 而不是 *到达*）。如果你的助教不在房间里，去隔壁找他们。

## 可选：考试练习

如果你提前完成，一个好主意是去通过 2023 年春季期中考试的一个轻微改编题来准备期中考试。

### 问题 7：重复

**定义**：若正整数 `n` 是由正整数 `m` 的各位数字重复一次或多次组成，则称 `n` 是 `m` 的 *重复序列*。例如，616161 是 61 的重复序列，但 61616 不是。

实现函数 `repeating`，该函数接收两个正整数 `t` 和 `n`。它返回是否 `n`是某个 `t` 位整数的重复序列。

```python
def repeating(t, n):
    """Return whether t digits repeat to form positive integer n.

    >>> repeating(1, 6161)
    False
    >>> repeating(2, 6161)  # repeats 61 (2 digits)
    True
    >>> repeating(3, 6161)
    False
    >>> repeating(4, 6161)  # repeats 6161 (4 digits)
    True
    >>> repeating(5, 6161)  # there are only 4 digits
    False
    """
    if pow(10, t-1) > n:  # make sure n has at least t digits
        return False
    end = _____
    rest = n
    while rest:
        if rest % pow(10, t) != end:
           return _____
        _____
    return True
```

<details>
<summary>提示</summary>

迭代过程需要实现一个函数，该函数检查 <code>rest</code> 的最后 <code>t</code> 位是否与 <code>n</code> 的最后 <code>t</code> 位匹配，然后移除 <code>rest</code> 的最后 <code>t</code> 位。
</details>
