# 讨论 3: 递归 [disc03.pdf](https://cs61a.org/disc/disc03/disc03.pdf)

如果你们小组的人数少于3人，可以与教室里的另一个小组合并。

现在切换到 Pensieve：

* **每个人**：请访问 [pensieve.co](https://tutor.pensieve.co/student/courses/cs61a/clazzes/cs61a_sp25/assignments/65c3c19700186225a7e63bf2)，使用你的 @berkeley.edu 邮箱登录，并将 **你的小组编号** 作为房间号输入（该编号在分配你们这次讨论的邮件中）。只要你们都输入相同的号码（任何号码），你们就都会使用共享文档。

一旦你们进入 Pensieve，就不需要返回此页面；Pensieve 包含了相同的内容（但具有更多功能）。如果 Pensieve 出现问题，请返回此页面继续讨论。

## 考勤

填写[考勤表](http://go.cs61a.org/discussion-attendance)，输入从助教那里收到的独一无二的编号。收到编号后，请填写表格，选择 *到达*（而不是 *离开* —— 离开时再填写）。

## 开始

说出你的名字并分享你小时候特别喜欢的一种食物。（如果你现在也喜欢那种食物，没关系。）

<details>
<summary>学习建议</summary>
期中考试 1 后，一些学生正在寻找更有效的学习方法。一个很好的选择是课外与讨论小组见面，一起复习练习题。现在是安排时间和地点进行一些额外的组内练习，复习期中考试 1 问题的好时机。这是可选的，不是每个人都需要参加，但如果有些期中考试 1 的内容还没有完全掌握，这个周末是一个很好的复习时机。

这门课程的所有内容都是建立在先前的知识基础上的，如果没有扎实掌握期中考试 1 的内容，之后很难跟上进度。

记住，如果有同学还没有学会所有内容，并且需要更多时间掌握课程材料，也是可以的。课程的核心目的是让学生学习他们之前不知道的知识。请在这个过程中互相支持。
</details>

## 递归

许多学生发现本次讨论很有挑战性，随着练习增多，问题会变得更加简单。请互相帮助学习。

**非常重要**：在本次讨论中，不要在你们小组确认答案之前检查自己的答案。通过思考代码会执行什么，来解决问题并检查自己的工作。你们的目标应该是在第一次运行时就让所有检查都通过！如果你需要帮助，请提问。

## 问题 1：Swipe

实现一个 `swipe` 函数，它将参数 `n` 的数字打印出来，每个数字一行，**先是倒序再是正序**。最左边的数字只打印一次。**不允许使用 `while` 或 `for` 或 `str`**。（当然，要使用递归！）

```python
def swipe(n):
    """Print the digits of n, one per line, first backward then forward.

    >>> swipe(2837)
    7
    3
    8
    2
    8
    3
    7
    """
    if n < 10:
        print(n)
    else:
        "*** YOUR CODE HERE ***"
```

<details>
<summary>提示</summary>
首先打印输出的第一行，然后进行递归调用，最后打印输出的最后一行。
</details>

### 问题 2：跳过阶乘

定义 `skip_factorial` 函数的基本情况，该函数返回从 n 开始的每隔一个正整数的乘积。

```python
def skip_factorial(n):
    """Return the product of positive integers n * (n - 2) * (n - 4) * ...

    >>> skip_factorial(5) # 5 * 3 * 1
    15
    >>> skip_factorial(8) # 8 * 6 * 4 * 2
    384
    """
    if ___:
        return ___
    else:
        return n * skip_factorial(n - 2)
```

<details>
<summary>提示</summary>
如果 <code>n</code> 是偶数，那么基准情况将是 2。如果 <code>n</code> 是奇数，那么基准情况将是 1。试着写一个条件来处理这两种情况。
</details>

### 问题 3：是否为质数

实现 `is_prime` 函数，该函数接受一个大于 1 的整数 `n`。如果 `n` 是质数，则返回 `True`，否则返回 `False`。尝试按照以下方法进行，但使用递归实现，而不是使用 `while`（或 `for`）语句。

```python
def is_prime(n):
    assert n > 1
    i = 2
    while i < n:
        if n % i == 0:
            return False
        i = i + 1
    return True
```

你需要定义一个“辅助”函数（一个仅用于帮助实现此函数的函数）。在 `is_prime` 内部定义该函数，还是作为全局函数单独定义是否重要？尝试定义该辅助函数，以便传递尽可能少的参数。

```python
def is_prime(n):
    """Returns True if n is a prime number and False otherwise.
    >>> is_prime(2)
    True
    >>> is_prime(16)
    False
    >>> is_prime(521)
    True
    """
    "*** YOUR CODE HERE ***"
```

<details>
<summary>提示</summary>
<p>定义一个内部函数，检查从 i 到 n 之间的某个整数是否能整除 n。然后，你可以从 i=2 开始调用它：</p>
<pre>
def is_prime(n):
    def f(i):
        if n % i == 0:
            return ____
        elif ____:
            return ____
        else:
            return f(____)
    return f(2)
</pre>
<p>文档：为辅助函数编写一句话的文档字符串，描述它的功能。不要只是写“它帮助实现 is_prime”。相反，描述它的行为。如果你需要帮助，随时问！</p>
</details>

### 问题 4: 递归 Hailstone

回顾一下作业 1 中的 `hailstone` 函数。首先，选择一个正整数 `n` 作为起始值。如果 `n` 是偶数，将它除以 2。如果 `n` 是奇数，将它乘以 3 并加 1。重复这个过程直到 `n` 变为 1。完成这个递归版本的 `hailstone`，它会打印出序列中的值，并返回步骤的数量。

```python
def hailstone(n):
    """Print out the hailstone sequence starting at n, 
    and return the number of elements in the sequence.
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
    print(n)
    if n % 2 == 0:
        return even(n)
    else:
        return odd(n)

def even(n):
    return ____

def odd(n):
    "*** YOUR CODE HERE ***"
```

<details>
<summary>提示</summary>
<p>偶数永远不是基本情况，因此 <code>even</code> 总是会调用 <code>hailstone</code> 函数，并返回比其余 hailstone 序列长度大 1。</p>
<p>奇数可能是 1（基本情况），也可能大于 1（递归情况）。只有递归情况才应该调用 <code>hailstone</code>。</p>
</details>

**建议**：一旦你们小组达成了一个解决方案，是时候练习描述自己代码的能力了。指定一个人来向小组描述你的解决方案。如果你愿意，你甚至可以将你的描述分享给你的助教。

## 文档记录

让你的助教知道你完成了任务，这样你们每个人都可以得到一个 **离开** 号码，并重新填写[考勤表](http://go.cs61a.org/discussion-attendance)（这次选择 *离开* 而不是 *到达*）。如果你的助教不在房间，去隔壁找他们。

## 额外问题

以下第一个问题是 **强烈推荐但不是必需的**。如果你没有完成它也没关系（但至少阅读一下并尝试游戏，因为它非常有趣）。

第二个问题相当困难。

### 问题 5：7

**七的游戏**：玩家围成一圈，按顺时针方向从 1 开始计数。（起始玩家说 1，左边的玩家说 2，以此类推。）如果一个数字可以被 7 整除或包含数字 7（或两者都有），则改变方向。数字必须在[每分钟 60 次的节拍](https://www.youtube.com/watch?v=ymJIXzvDvj4)上说出。如果有人在不该自己说的轮次说了数字，或者有人错过了轮次的节拍，游戏结束。

例如，5 个人会像这样数到 20：

```
玩家 1 说 1
玩家 2 说 2
玩家 3 说 3
玩家 4 说 4
玩家 5 说 5
玩家 1 说 6  # 一圈回来
玩家 2 说 7  # 方向改为逆时针
玩家 1 说 8
玩家 5 说 9  # 逆时针继续
玩家 4 说 10
玩家 3 说 11
玩家 2 说 12
玩家 1 说 13
玩家 5 说 14 # 方向改为顺时针
玩家 1 说 15
玩家 2 说 16
玩家 3 说 17 # 方向改为逆时针
玩家 2 说 18
玩家 1 说 19
玩家 5 说 20
```

玩几局游戏。将你们小组最高的分数发布到 Discord 上。

然后，实现在 `sevens` 函数中，它接收一个正整数 `n` 和一个玩家数 `k`，返回第 `k` 个玩家在第 `n` 回合时说了哪个数字。你可以调用 `has_seven` 函数。

解决此问题的有效方法是模拟游戏，直到第 `n` 轮。实现过程中必须跟踪当前的数字 `n`、当前数字 `i`、玩家 `who` 说的 `i` 以及决定下一个玩家的方向 `direction`（顺时针或逆时针）。使用整数来表示所有这些内容非常有效，方向 `direction` 在 1（顺时针）和 -1（逆时针）之间切换。

```python
def sevens(n, k):
    """Return the (clockwise) position of who says n among k players.

    >>> sevens(2, 5)
    2
    >>> sevens(6, 5)
    1
    >>> sevens(7, 5)
    2
    >>> sevens(8, 5)
    1
    >>> sevens(9, 5)
    5
    >>> sevens(18, 5)
    2
    """
    def f(i, who, direction):
        if i == n:
            return who
        "*** YOUR CODE HERE ***"
    return f(1, 1, 1)

def has_seven(n):
    if n == 0:
        return False
    elif n % 10 == 7:
        return True
    else:
        return has_seven(n // 10)
```

<details>
<summary>提示</summary>
首先检查 <code>i</code> 是否是 7 的倍数或包含数字 7，如果是，则改变方向。然后，将方向加到 <code>who</code> 上，并确保 <code>who</code> 不小于 1 或大于 <code>k</code>。
</details>

### Q6: Karel 机器人

[Karel 机器人](https://compedu.stanford.edu/karel-reader/docs/python/en/chapter1.html)从一个未知大小的 `n` x `n` 方格的角落开始。Karel 只响应以下四个函数：

- `move()`：如果前方没有墙壁，Karel 会向前移动一格；如果前方有墙壁，则会报错。
- `turn_left()`：Karel 将其方向左转 90 度。
- `front_is_blocked()`：返回前方是否有墙壁。
- `front_is_clear()`：返回前方是否没有墙壁。

实现一个 `main()` 函数，使 Karel 停在底行的中间位置。例如，如果方格是 7 x 7 且 Karel 从 (1, 1) 位置开始（即底部左侧），那么 Karel 应该停在 (1, 4) 位置（底部行从两侧各走三步）。Karel 在结束时可以朝向任意方向。如果底行长度为偶数，Karel 可以停在 (1, `n // 2`) 或 (1, `n // 2 + 1`) 位置。

**重要** 在 `main()` 函数体内只能写 `if` 或 `if/else` 语句和函数调用。不能写赋值语句、def 语句、lambda 表达式或 while/for 语句。

<details>
<summary>提示</summary>
每走两步，退后一步，以便最终停在中间。
</details>