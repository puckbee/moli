# 讨论 2：环境图，高阶函数 [disc02.pdf](https://cs61a.org/disc/disc02/disc02.pdf)

切换到 Pensieve：

- **所有人**：请访问 [pensieve.co](https://tutor.pensieve.co/student/courses/cs61a/clazzes/cs61a_sp25/assignments/65b9e05d81508f3afeaad829)，使用你的 @berkeley.edu 邮箱登录，并输入分配给 **你的组号** 作为房间号（本次讨论的组号已在分配给你的电子邮件中）。只要你们都输入相同的号码（任何号码），你们就会使用共享文档。

一旦你进入 Pensieve，就不需要返回这个页面；Pensieve 上有与本页面相同的内容（但功能更多）。如果 Pensieve 无法正常工作，请返回此页面并继续进行讨论。

## 考勤

填写这个[讨论考勤表](http://go.cs61a.org/discussion-attendance)，输入你从 TA 那里收到的独一无二的号码。一旦你得到号码，填写表格并选择 *到达*（不是 *离开* ——这是离开时填写的）。

## 开始 【5分钟】

说出你的名字和一个你喜欢的城市（或地方），它不能是伯克利，也不能是你曾经生活过的地方。可以分享一下你为什么喜欢它。

**非常重要**：在这个讨论中，在你的小组完全确认答案正确之前，请不要点击 *检查答案* 或运行任何 Python 代码。你们的目标应该是在 **第一次检查时确保所有检查通过**！通过 *思考* 你的代码会做什么来解决问题。如果不确定，跟你的小组讨论！（你们在期中考试中不会使用 Python，所以现在就要习惯于在没有它的情况下解决问题。）

### 问题 1：热身

执行 `result = (lambda x: 2 * (lambda x: 3)(4) * x)(5)` 后，`result` 的值是多少？和你的整个小组讨论并保证在查看结果之前你们每个人都同意这个结果。

## 调用表达式 【15分钟】

为以下代码绘制环境图。你可以使用纸、平板或白板。与小组讨论你们将如何绘制图表，然后一起逐步完成每个步骤。之后，通过 Python Tutor 生成的图表逐步检查你们的工作。


这是一个空白图表模板，供你在使用平板时使用：

template

如果有问题，先问问你的组员，而不是直接查找答案！首先向你的小组提问，然后再向你的助教求助。

## 高阶函数 【60分钟】

记住上次讨论中的问题解决方法；它同样适用于实现高阶函数。

1. 选择一个示例输入和对应的输出（*这次可能是一个函数*）。
2. 用简单的步骤描述一个过程（用英文），将输入转换为输出。
3. 想出你需要什么额外的名称来完成这个过程。
4. 使用这些额外的名称在代码中实现该过程。
5. 确定实现是否在你原始的示例上正常工作。
6. 确定实现是否在其他示例上也正常工作。（如果不行，可能需要修改第2步。）

### 问题 2：实现 `make_keeper`

实现 `make_keeper`，它接受一个正整数 `n`，并返回一个函数 `f`，该函数接受一个单参数函数 `cond` 作为参数。当 `f` 被 `cond` 调用时，它会打印出从 1 到 `n`（包括 `n`）的所有能使 `cond` 返回真值的整数。每个整数单独成行。

```python
def make_keeper(n):
    """Returns a function that takes one parameter cond and prints
    out all integers 1..i..n where calling cond(i) returns True.

    >>> def is_even(x): # Even numbers have remainder 0 when divided by 2.
    ...     return x % 2 == 0
    >>> make_keeper(5)(is_even)
    2
    4
    >>> make_keeper(5)(lambda x: True)
    1
    2
    3
    4
    5
    >>> make_keeper(5)(lambda x: False)  # Nothing is printed
    """
    "*** YOUR CODE HERE ***"
```

不要偷看！先在没有提示的情况下实现它。

<details>
<summary>提示</summary>
<p>为了返回一个函数 <code>f</code>，在实现的第一行包括 <code>def f(cond):</code>，并在最后返回 <code>f</code>。<br>
    <code>f</code> 函数应该引入 <code>i = 1</code>，以便循环遍历所有整数，通过调用 <code>cond(i)</code> 来判断 <code>cond</code> 是否对每个整数返回真值。</p>
</details>

**不要运行 Python 来检查你的代码。你可以通过思考来检查它是否正确！**

一旦你们小组已经达成解决方案，现在是时候练习描述自己代码的能力了。一个好的描述就像一个好的程序：简洁而准确。指定某个人来描述你的解决方案，并让他们向小组展示。如果你想要反馈，也可以向你的助教展示。

### 问题 3: 数字查找器

实现 `find_digit`，该函数接受一个正整数 `k`，并返回一个函数，该函数接受一个正整数 `x`，返回 `x` 从右边数的第 `k` 位数字。如果 `x` 的位数少于 `k`，则返回 0。

例如，在数字 4567 中，7 是从右数的第 1 位，6 是第 2 位，从右数的第 5 位是 0（因为只有 4 位）。

**重要**：在这个问题中，你不能使用字符串或索引。尝试仅用一行代码解决此问题。

> 提示：使用 Lambda 表达式。
>
> 提示：通过对 10 的幂进行整除，可以去掉右边的数字。

```python
def find_digit(k):
    """Returns a function that returns the kth digit of x.

    >>> find_digit(2)(3456)
    5
    >>> find_digit(2)(5678)
    7
    >>> find_digit(1)(10)
    0
    >>> find_digit(4)(789)
    0
    """
    assert k > 0
    "*** YOUR CODE HERE ***"
```

<details>
<summary>提示</summary>
首先去掉第 <code>k</code> 位之后的所有数字，这时第 <code>k</code> 位将是最后一位数字。
</details>

### 问题 4: 配对匹配器

实现 `match_k`，该函数接受一个整数 `k`，并返回一个函数，该函数接受一个变量 `x`，如果 `x` 中相隔 `k` 位的所有数字相同，则返回 `True`。

例如，`match_k(2)` 返回一个接受 `x` 的函数，检查 `x` 中相隔 2 位的数字是否相同。

`match_k(2)(1010)` 的值为 `x = 1010`，从左到右的数字为 1, 0, 1, 0。`1 == 1` 且 `0 == 0`，因此 `match_k(2)(1010)` 结果为 `True`。

`match_k(2)(2010)` 的值为 `x = 2010`，从左到右的数字为 2, 0, 1, 0。`2 != 1` 且 `0 == 0`，因此 `match_k(2)(2010)` 结果为 `False`。

**重要**：在这个问题中，你不能使用字符串或索引。

> 提示：通过对 10 的幂进行整除，可以去掉右边的数字。

```python
def match_k(k):
    """Returns a function that checks if digits k apart match.

    >>> match_k(2)(1010)
    True
    >>> match_k(2)(2010)
    False
    >>> match_k(1)(1010)
    False
    >>> match_k(1)(1)
    True
    >>> match_k(1)(2111111111111111)
    False
    >>> match_k(3)(123123)
    True
    >>> match_k(2)(123123)
    False
    """
    def check(x):
        while x // (10 ** k) > 0:
            if ____________________________:
                return ____________________________
            x //= 10
        ____________________________
    ____________________________
```

<details>
<summary>提示</summary>
在每次迭代中，将最后一位数字与前面第 k 位的数字进行比较。
</details>

## 留存记录

让你的助教知道你们已经完成了任务，以便你们每个人都能获得 **离开** 号码，并重新填写[考勤表](http://go.cs61a.org/discussion-attendance)（这次选择 *离开* 而不是 *到达*）。如果你的助教不在房间里，去隔壁找他们。

