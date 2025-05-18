# 实验 2：高阶函数，Lambda 表达式 [lab02.zip](https://cs61a.org/lab/lab02/lab02.zip)

*截止日期：2 月 5 日星期三晚上 11:59。*

**开始文件：**

下载 [lab02.zip](https://cs61a.org/lab/lab02/lab02.zip)

## 考勤

如果你参加的是 CS 61A 的常规实验组，请从你的助教那里获取 **到达** 编号，并填写此[实验考勤表](https://go.cs61a.org/lab-attendance)。（如果你参加的是大班实验课，则不需要填写该表格）。除了考勤表，你还需要提交实验问题才能获得实验学分。

## 主题

你认为如果我们在 Python 中输入以下内容会发生什么？

```python
1 / 0
```

在 Python 中尝试一下！你应该会看到一个 `ZeroDivisionError` 错误。但这个表达式呢？

```python
True or 1 / 0
```

它的结果是 `True`，因为 Python 中的 `and` 和 `or` 操作符是 *短路求值*。也就是说，他们不一定会计算每个操作数。

| 操作符 | 检查是否： | 从左到右计算结果直到： | 示例 |
|-|-|-|-|
| AND | 所有值为真 | 第一个假值 | `False and 1 / 0` 结果是 `False` |
| OR | 至少一个值为真 | 第一个真值 | `True or 1 / 0` 结果是 `True` |

短路发生在操作符遇到一个能够让他们得出表达式结果的操作数时。例如，`and` 会在遇到第一个假值时短路，因为它知道并非所有值都为真。

如果 `and` 和 `or` 不是 *短路求值*，他们将直接返回最后一个值；另一种记住这一点的方法是，`and` 和 `or` 总是返回他们计算的最后一个值，无论他们是否短路。记住，当使用 `True` 和 `False` 以外的值时，`and` 和 `or` 不一定总是返回布尔值。

如果你需要复习本实验的材料，可以参考这一部分。你可以直接跳到[问题部分](https://cs61a.org/lab/lab02/#required-questions)，并在卡住的时候再回来查看这里的内容。

<details>
<summary>短路求值</summary>

<h1>短路求值</h1>

你认为如果我们在 Python 中输入以下内容会发生什么？

```python
1 / 0
```

在 Python 中尝试一下！你应该会看到一个 <code>ZeroDivisionError</code> 错误。但这个表达式呢？

```python
True or 1 / 0
```

它的结果是 <code>True</code>，因为 Python 中的 <code>and</code> 和 <code>or</code> 操作符是短路求值。也就是说，他们不一定会计算每个操作数。

<table border="1">
  <thead>
    <tr>
      <th>操作符</th>
      <th>检查是否：</th>
      <th>从左到右计算结果直到：</th>
      <th>示例</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>AND</td>
      <td>所有值为真</td>
      <td>第一个假值</td>
      <td><code>False and 1 / 0</code> 结果是 <code>False</code></td>
    </tr>
    <tr>
      <td>OR</td>
      <td>至少一个值为真</td>
      <td>第一个真值</td>
      <td><code>True or 1 / 0</code> 结果是 <code>True</code></td>
    </tr>
  </tbody>
</table>

短路发生在操作符遇到一个能够让他们得出表达式结果的操作数时。例如，`and` 会在遇到第一个假值时短路，因为它知道并非所有值都为真。

如果 <code>and</code> 和 <code>or</code> 不是短路求值，他们将直接返回最后一个值；另一种记住这一点的方法是，<code>and</code> 和 <code>or</code> 总是返回他们计算的最后一个值，无论他们是否短路。记住，当使用 <code>True</code> 和 <code>False</code> 以外的值时，<code>and</code> 和 <code>or</code> 不一定总是返回布尔值。

</details>

<details>
<summary>高阶函数</summary>

<h1>高阶函数</h1>

变量是绑定到值的名称，这些值可以是原始数据类型，比如 <code>3</code> 或 <code>'Hello World'</code>，也可以是函数。因为函数可以接受任何类型的参数，所以其他函数也可以作为参数传递。这就是高阶函数的基础。

高阶函数是操作其他函数的函数，通过接受函数作为参数、返回一个函数，或者两者兼有。在本实验中，我们将介绍高阶函数的基础知识，并将在下一个实验中探索高阶函数的更多应用。

函数作为参数：

在 Python 中，函数对象是可以传递的值。我们知道，创建函数的一种方法是使用 <code>def</code> 语句：

```python
def square(x):
    return x * x
```

上述语句创建了一个内部名称为 <code>square</code> 的函数对象，并将其绑定到当前环境中的名称 <code>square</code>。现在让我们尝试将其作为参数传递。

首先，我们编写一个接受另一个函数作为参数的函数：

```python
def scale(f, x, k):
    """ Returns the result of f(x) scaled by k. """
    return k * f(x)
```

我们现在可以在 <code>scale</code> 上调用，并使用 <code>square</code> 和其他参数

```python
>>> scale(square, 3, 2)  # Doubke square(3)
18
>>> scale(square, 2, 5)  # 5 times 2 squares
20
```

注意，在对 <code>scale</code> 的调用中，拥有内部名称 <code>square</code> 的函数对象被绑定到参数 <code>f</code> 上。然后，我们通过调用 <code>f(x)</code> 来调用 <code>square</code>。

正如我们在上面关于 <code>lambda</code> 表达式的部分所看到的，我们还可以将 <code>lambda</code> 表达式传递到调用表达式中！

```python
>>> scale(lambda x: x + 10, 5, 2)
30
```

在此调用表达式的框架中，名称 <code>f</code> 被绑定到由 <code>lambda</code> 表达式 <code>lambda x: x + 10</code> 创建的函数。

返回函数的函数：

因为函数是值，他们也可以作为返回值！下面是一个例子：

```python
def multiply_by(m):
    def multiply(n):
        return n * m
    return multiply
```

在这个例子中，我们在 <code>multiply_by</code> 的函数体内定义了 <code>multiply</code> 函数，然后返回了它。让我们看看它的运行效果：

```python
>>> multiply_by(3)
<function multiply_by.<locals>.multiply at ...>
>>> multiply(4)
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
NameError: name 'multiply' is not defined
```

调用 <code>multiply_by</code> 返回了一个函数，正如预期的那样。然而，调用 <code>multiply</code> 时却发生了错误，尽管我们给了它这个名字。这是因为 <code>multiply</code> 这个名称只在我们评估 <code>multiply_by</code> 函数体时存在。

那么我们如何实际使用内部函数呢？这里有两种方法：

```python
>>> times_three = multiply_by(3) # Assign the result of the call expression to a name
>>> times_three(5) # Call the inner function with its new name
15
>>> multiply_by(3)(10) # Chain together two call expressions
30
```

关键是，由于 <code>multiply_by</code> 返回了一个函数，你可以像使用任何其他函数一样使用它的返回值。

</details>

<details>
<summary>Lambda 表达式</summary>

<h1>Lambda 表达式</h1>

Lambda 表达式是通过指定两项内容来求值为函数的表达式：参数和返回表达式。

```python
lambda <parameters>: <return expression>
```

虽然 <code>lambda</code> 表达式和 <code>def</code> 语句都创建函数对象，但他们之间有一些显著的区别。<code>lambda</code> 表达式像其他表达式一样工作；就像数学表达式评估为一个数字并且不会改变当前环境一样，<code>lambda</code> 表达式评估为一个函数而不会改变当前环境。让我们仔细看看：

<table border="1">
  <thead>
    <tr>
      <th>类型</th>
      <th>lambda 表达式</th>
      <th>def 语句</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>类型</td>
      <td>评估为一个值的表达式</td>
      <td>改变环境的语句</td>
    </tr>
    <tr>
      <td>执行结果</td>
      <td>创建一个没有内在名称的匿名 <code>lambda</code> 函数</td>
      <td>创建一个带有内在名称的函数并将其绑定到当前环境中的名称</td>
    </tr>
    <tr>
      <td>对环境的影响</td>
      <td>评估 <code>lambda</code> 表达式不会创建或修改任何变量</td>
      <td>执行 <code>def</code> 语句时会创建一个新的函数对象并将其绑定到当前环境中的名称</td>
    </tr>
    <tr>
      <td>用法</td>
      <td><code>lambda</code> 表达式可以在任何需要表达式的地方使用，例如赋值语句中或作为调用表达式的操作数或操作符</td>
      <td>执行 <code>def</code> 语句后，创建的函数会绑定到一个名称。你应该使用这个名称来引用该函数，任何需要表达式的地方都可以使用这个名称</td>
    </tr>
    <tr>
      <td>示例</td>
      <td>
        <pre><code>
# A lambda expression by itself does not alter
# the environment
lambda x: x * x

# We can assign lambda functions to a name
# with an assignment statement
square = lambda x: x * x
square(3)

# Lambda expressions can be used as an operator
# or operand
negate = lambda f, x: -f(x)
negate(lambda x: x * x, 3)
        </code></pre>
      </td>
      <td>
        <pre><code>
def square(x):
    return x * x

# A function created by a def statement
# can be referred to by its intrinsic name
square(3)
        </code></pre>
      </td>
    </tr>
  </tbody>
</table>
</details>

<details>
<summary>环境图</summary>

<h1>环境图</h1>

<p>环境图是理解 <code>lambda</code> 表达式和高阶函数的最佳学习工具之一，因为它可以帮助你跟踪所有不同的名称、函数对象以及函数的参数。如果你在做 “Python 会显示什么？”问题时遇到困难，我们强烈建议绘制环境图或使用 <a href="https://tutor.cs61a.org/" target="_blank">Python Tutor</a>。关于环境图应该是什么样子的，你可以尝试在 Python Tutor 中运行一些代码作为示例。以下是一些规则：</p>

<h2>赋值语句</h2>

<ol>
  <li>评估等号右边的表达式。</li>
  <li>如果等号左边的名称在当前框架中尚不存在，则将其写入；如果已经存在，则删除当前的绑定。将第 1 步获得的值绑定到这个名称上。</li>
  <li>如果语句中有多个名称/表达式，先从左到右依次评估所有的表达式，然后再进行绑定。</li>
</ol>

<p>如果语句中有多个名称/表达式，先从左到右依次评估所有的表达式，然后再进行绑定。</p>

<h2>定义语句</h2>

<ol>
  <li>绘制函数对象，包括其固有名称、形式参数和父框架。函数的父框架是定义该函数的框架。</li>
  <li>如果函数的固有名称在当前框架中尚不存在，则将其写入；如果已经存在，则删除当前的绑定。将新创建的函数对象绑定到这个名称上。</li>
</ol>

<h2>调用表达式</h2>

<p><strong>注意：</strong>对于像 <code>max</code> 或 <code>print</code> 这样的内置 Python 函数，你不需要经过这个过程。</p>

<ol>
  <li>评估操作符，其值应该是一个函数。</li>
  <li>从左到右评估操作数。</li>
  <li>打开一个新框架，并标注框架的顺序编号、函数的固有名称以及其父框架。</li>
  <li>将函数的形式参数绑定到你在第 2 步中找到的参数值。</li>
  <li>在新的环境中执行函数体。</li>
</ol>

<h2>Lambda 表达式</h2>

<p><strong>注意：</strong>正如我们在上面的 <code>lambda</code> 表达式部分所看到的，<code>lambda</code> 函数没有固有名称。在环境图中绘制 <code>lambda</code> 函数时，他们被标记为 <code>lambda</code> 或小写希腊字母 <code>λ</code>。当环境图中有多个 <code>lambda</code> 函数时，这可能会造成混淆，因此你可以通过编号或者写出定义他们的行号来区分他们。</p>

<ol>
  <li>绘制 <code>lambda</code> 函数对象，并标注为 <code>λ</code>、其形式参数以及其父框架。函数的父框架是定义该函数的框架。</li>
</ol>

<p>这是唯一的步骤。我们包含这一部分是为了强调 <code>lambda</code> 表达式与 <code>def</code> 语句之间的区别：<code>lambda</code> 表达式不会在环境中创建任何新的绑定。</p>
</details>

## 需要回答的问题

<details>
<summary>获取开始视频</summary>
<h1>获取开始视频</h1>

<p>这些视频可能会为解决这份作业中的编码问题提供一些有用的指导。</p>

<p>要查看这些视频，您需要登录您的 berkeley.edu 邮箱。</p>

<a href="https://youtu.be/playlist?list=PLx38hZJ5RLZe3y57961XyBIvQoyT0IaqF" target="_blank">YouTube link</a>
</details>

### Python 会显示什么？

#### 问题 1: WWPD: 真理会胜利

> 使用 Ok 来测试你的知识，以下是一些“Python 会显示什么？”的问题：
>
>`python3 ok -q short-circuit -u`

```python
>>> True and 13
______

>>> False or 0
______

>>> not 10
______

>>> not None
```
```

>>> True and 1 / 0
______

>>> True or 1 / 0
______

>>> -1 and 1 > 0
______

>>> -1 or 5
______

>>> (1 + 1) and 1
______

>>> print(3) or ""
______
```
```
>>> def f(x):
...     if x == 0:
...         return "zero"
...     elif x > 0:
...         return "positive"
...     else:
...         return ""
>>> 0 or f(1)
______

>>> f(0) or f(-1)
______

>>> f(0) and f(-1)
______
```

#### 问题 2: WWPD: 高阶函数

> 使用 Ok 来测试你的知识，以下是一些“Python 会显示什么？”的问题：
>
>`python3 ok -q hof-wwpd -u`

```python
>>> def cake():
...    print('beets')
...    def pie():
...        print('sweets')
...        return 'cake'
...    return pie
>>> chocolate = cake()
______

>>> chocolate
______

>>> chocolate()
______

>>> more_chocolate, more_cake = chocolate(), cake
______

>>> more_chocolate
______

>>> def snake(x, y):
...    if cake == more_cake:
...        return chocolate
...    else:
...        return x + y
>>> snake(10, 20)
______

>>> snake(10, 20)()
______

>>> cake = 'cake'
>>> snake(10, 20)
______
```

#### 问题 3: WWPD: Lambda

> 使用 Ok 来测试你的知识，以下是一些“Python 会显示什么？”的问题：
>
>`python3 ok -q lambda -u`
>
> 提醒一下，以下两行代码执行时将不会在交互式 Python 解释器中显示任何输出：
>
> ```python
> >>> x = None
> >>> x
> >>>
> ```

```python
>>> lambda x: x  # A lambda expression with one parameter x
______

>>> a = lambda x: x  # Assigning the lambda function to the name a
>>> a(5)
______

>>> (lambda: 3)()  # Using a lambda expression as an operator in a call exp.
______

>>> b = lambda x, y: lambda: x + y  # Lambdas can return other lambdas!
>>> c = b(8, 4)
>>> c
______

>>> c()
______

>>> d = lambda f: f(4)  # They can have functions as arguments as well.
>>> def square(x):
...     return x * x
>>> d(square)
______
```
```
>>> higher_order_lambda = lambda f: lambda x: f(x)
>>> g = lambda x: x * x
>>> higher_order_lambda(2)(g)  # Which argument belongs to which function call?
______

>>> higher_order_lambda(g)(2)
______

>>> call_thrice = lambda f: lambda x: f(f(f(x)))
>>> call_thrice(lambda y: y + 1)(0)
______

>>> print_lambda = lambda z: print(z)  # When is the return expression of a lambda expression executed?
>>> print_lambda
______

>>> one_thousand = print_lambda(1000)
______

>>> one_thousand # What did the call to print_lambda return?
______
```

### 代码练习

#### 问题 4: 复合恒等函数

编写一个函数，该函数接收两个单参数函数 `f` 和 `g`，并返回另一个函数，该函数具有一个单一参数 `x`。返回的函数应当返回 `True`，如果 `f(g(x))` 等于 `g(f(x))`，否则返回 `False`。你可以假设 `g(x)` 的输出是 `f` 的有效输入，反之亦然。

```python
def composite_identity(f, g):
    """
    Return a function with one parameter x that returns True if f(g(x)) is
    equal to g(f(x)). You can assume the result of g(x) is a valid input for f
    and vice versa.

    >>> add_one = lambda x: x + 1        # adds one to x
    >>> square = lambda x: x**2          # squares x [returns x^2]
    >>> b1 = composite_identity(square, add_one)
    >>> b1(0)                            # (0 + 1) ** 2 == 0 ** 2 + 1
    True
    >>> b1(4)                            # (4 + 1) ** 2 != 4 ** 2 + 1
    False
    """
    "*** YOUR CODE HERE ***"
```

使用 Ok 去测试你的代码：
```bash
python3 ok -q composite_identity
```

#### 问题 5: 条件计数

考虑以下 `count_fives` 和 `count_primes` 函数的实现，这些实现使用了之前作业中的 `sum_digits` 和 `is_prime` 函数：

```python
def count_fives(n):
    """Return the number of values i from 1 to n (including n)
    where sum_digits(n * i) is 5.

    >>> count_fives(10)  # Among 10, 20, 30, ..., 100, only 50 (10 * 5) has digit sum 5
    1
    >>> count_fives(50)  # 50 (50 * 1), 500 (50 * 10), 1400 (50 * 28), 2300 (50 * 46)
    4
    """
    i = 1
    count = 0
    while i <= n:
        if sum_digits(n * i) == 5:
            count += 1
        i += 1
    return count

def count_primes(n):
    """Return the number of prime numbers up to and including n.

    >>> count_primes(6)   # 2, 3, 5
    3
    >>> count_primes(13)  # 2, 3, 5, 7, 11, 13
    6
    """
    i = 1
    count = 0
    while i <= n:
        if is_prime(i):
            count += 1
        i += 1
    return count
```

这些实现看起来非常相似！通过编写一个通用函数 `count_cond`，我们可以将其进行抽象化，`count_cond` 接收一个两参数的谓词函数 `condition(n, i)`，并返回一个接受一个参数 `n` 的函数，该函数会计算满足条件的数字数量。

> 说明：当我们说 `condition` 是一个谓词函数时，我们的意思是这个函数会返回 `True` 或 `False`

```python
def sum_digits(y):
    """Return the sum of the digits of non-negative integer y."""
    total = 0
    while y > 0:
        total, y = total + y % 10, y // 10
    return total

def is_prime(n):
    """Return whether positive integer n is prime."""
    if n == 1:
        return False
    k = 2
    while k < n:
        if n % k == 0:
            return False
        k += 1
    return True

def count_cond(condition):
    """Returns a function with one parameter N that counts all the numbers from
    1 to N that satisfy the two-argument predicate function Condition, where
    the first argument for Condition is N and the second argument is the
    number from 1 to N.

    >>> count_fives = count_cond(lambda n, i: sum_digits(n * i) == 5)
    >>> count_fives(10)   # 50 (10 * 5)
    1
    >>> count_fives(50)   # 50 (50 * 1), 500 (50 * 10), 1400 (50 * 28), 2300 (50 * 46)
    4

    >>> is_i_prime = lambda n, i: is_prime(i) # need to pass 2-argument function into count_cond
    >>> count_primes = count_cond(is_i_prime)
    >>> count_primes(2)    # 2
    1
    >>> count_primes(3)    # 2, 3
    2
    >>> count_primes(4)    # 2, 3
    2
    >>> count_primes(5)    # 2, 3, 5
    3
    >>> count_primes(20)   # 2, 3, 5, 7, 11, 13, 17, 19
    8
    """
    "*** YOUR CODE HERE ***"
```

使用 Ok 去测试你的代码：

```bash
python3 ok -q count_cond
```

### 本地查看分数

你可以通过运行以下命令本地查看每个问题的分数：

```bash
python3 ok --score
```

**这不会提交作业！** 当你对分数满意时，可以将作业提交到 Gradescope 以获得学分。

## 提交作业

如果你在 CS 61A 的常规实验室中，请让你的助教知道你完成了作业，这样你就可以获得 **离开** 号码，然后在离开之前填写这个[实验考勤表](https://go.cs61a.org/lab-attendance)。（如果你在大实验室中，则无需填写表格。）

然后，通过将你编辑过的文件上传到 **适当的 Gradescope 作业区** 来提交此作业。[实验室 00](https://cs61a.org/lab/lab00/#submit-with-gradescope) 有详细的说明。

## 环境图练习

**这个部分没有 Gradescope 提交。**

然而，我们仍然鼓励你在纸上做这个题目，以便熟悉环境图，这种题型可能会以其他形式出现在考试中。你可以尝试将代码放入 PythonTutor 来检查你的作业。

### 问题 6: 高阶函数环境图练习

绘制执行下面代码时生成的环境图，可以在纸上或白板上完成。使用 [tutor.cs61a.org](https://tutor.cs61a.org/) 来检查你的作业。

```python
n = 7

def f(x):
    n = 8
    return x + 1

def g(x):
    n = 9
    def h():
        return x + 1
    return h

def f(f, x):
    return f(x + n)

f = f(g, n)
g = (lambda y: y())(f)
```

## 可选问题

> 这些问题是可选的。如果你没有完成他们，你仍然会获得此作业的学分。他们是很好的练习，所以还是做一下吧！

### 问题 7: 最小公倍数

编写一个函数，该函数接收两个数字并返回他们的最小公倍数。

```python
def multiple(a, b):
    """Return the smallest number n that is a multiple of both a and b.

    >>> multiple(3, 4)
    12
    >>> multiple(14, 21)
    42
    """
    "*** YOUR CODE HERE ***"
```

使用 Ok 去测试你的代码：
```bash
python3 ok -q multiple
```

### 问题 8: 我听说你喜欢函数...

定义一个函数 `cycle`，该函数接收三个函数 `f1`、`f2` 和 `f3` 作为参数。`cycle` 应返回另一个函数 `g`，`g` 应接收一个整数参数 `n` 并返回另一个函数 `h`。最终的函数 `h` 应接收一个参数 `x`，并根据 `n` 的值循环地将 `f1`、`f2` 和 `f3` 应用到 `x` 上。以下是对于一些 `n` 值，最终函数 `h` 应如何对 `x` 执行操作：

* n = 0, 返回 x
* n = 1, 对 x 应用 f1，即返回 `f1(x)`
* n = 2, 对 x 应用 f1 然后再对结果应用 f2，即返回 `f2(f1(x))`
* n = 3, 对 x 应用 f1，然后对 f1 的结果应用 f2，再对 f2 的结果应用 f3，即返回 `f3(f2(f1(x)))`
* n = 4, 从头开始循环，先应用 f1，然后应用 f2，再应用 f3，最后再应用 f1，即返回 `f1(f3(f2(f1(x))))`
* 依此类推。

> 提示：大部分工作都在最内层的函数中完成。
>
> 提示：你如何利用 `%` 操作符来实现循环行为？尝试计算 `n % 3`，对于从 0 到 12 的所有整数 `n`，你会发现什么模式？

```python
def cycle(f1, f2, f3):
    """Returns a function that is itself a higher-order function.

    >>> def add1(x):
    ...     return x + 1
    >>> def times2(x):
    ...     return x * 2
    >>> def add3(x):
    ...     return x + 3
    >>> my_cycle = cycle(add1, times2, add3)
    >>> identity = my_cycle(0)
    >>> identity(5)
    5
    >>> add_one_then_double = my_cycle(2)
    >>> add_one_then_double(1)
    4
    >>> do_all_functions = my_cycle(3)
    >>> do_all_functions(2)
    9
    >>> do_more_than_a_cycle = my_cycle(4)
    >>> do_more_than_a_cycle(2)
    10
    >>> do_two_cycles = my_cycle(6)
    >>> do_two_cycles(1)
    19
    """
    "*** YOUR CODE HERE ***"
```

使用 Ok 去测试你的代码：
```bash
python3 ok -q cycle
```
