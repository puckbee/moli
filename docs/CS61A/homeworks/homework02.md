# 必答题

---

## 入门视频



<iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries" title="" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---



一些doctest引用了这些函数：

```python
from operator import add, mul

square = lambda x: x * x

identity = lambda x: x

triple = lambda x: 3 * x

increment = lambda x: x + 1
```



## 高阶函数

###  Q1：乘积

编写一个名为 `product` 的函数，该函数返回序列的前 `n` 项的乘积。具体来说， `product` 接收一个整数 `n` 和 `term` ，`term` 是一个单参数函数，该函数确定一个序列。（也就是说， `term(i)` 给出序列的第 `i` 项。） `product(n, term)` 应该返回 `term(1) * ... * term(n)` 。

```python
def product(n, term):
    """返回序列的前n项的乘积

    n: 一个正整数
    term:  一个接收单参数的函数，用来生成序列的项

    >>> product(3, identity)  # 1 * 2 * 3
    6
    >>> product(5, identity)  # 1 * 2 * 3 * 4 * 5
    120
    >>> product(3, square)    # 1^2 * 2^2 * 3^2
    36
    >>> product(5, square)    # 1^2 * 2^2 * 3^2 * 4^2 * 5^2
    14400
    >>> product(3, increment) # (1+1) * (2+1) * (3+1)
    24
    >>> product(3, triple)    # 1*3 * 2*3 * 3*3
    162
    """
    "*** 在这里填写你的代码 ***"
```

使用ok来测试你的代码：

```shell
python3 ok -q product
```



### Q2：累积

我们来了解一下 `product` 是如何作为更通用的 `accumulate` 函数的实例，我们想要实现：

```python
def accumulate(fuse, start, n, term):
    """返回将序列中前n项与初始值融合后的结果。
	   需要融合（fuse）的项为第1项（term(1)）、第2项（term(2)）……直至第n项（term(n)）。
	   函数fuse是一个双参数的、有交换和结合律的函数（commutative & associative function）。

    >>> accumulate(add, 0, 5, identity)  # 0 + 1 + 2 + 3 + 4 + 5
    15
    >>> accumulate(add, 11, 5, identity) # 11 + 1 + 2 + 3 + 4 + 5
    26
    >>> accumulate(add, 11, 0, identity) # 11 (此时fuse永远不会被用到)
    11
    >>> accumulate(add, 11, 3, square)   # 11 + 1^2 + 2^2 + 3^2
    25
    >>> accumulate(mul, 2, 3, square)    # 2 * 1^2 * 2^2 * 3^2
    72
    >>> # 2 + (1^2 + 1) + (2^2 + 1) + (3^2 + 1)
    >>> accumulate(lambda x, y: x + y + 1, 2, 3, square)
    19
    """
    "*** 在这里填写你的代码 ***"
```

`accumulate` 具有以下参数：

- `fuse` ：一个双参数函数，指定当前项如何与先前累积的项融合
- `start` : 从哪个值开始累积
- `n` : 一个非负整数，表示要融合的项数
- `term` : 一个单参数函数； `term(i)` 是序列的第 `i` 项

实现 `accumulate` ，它会使用 `fuse` 函数，将序列 `term` 的前 `n` 项与 `start` 值融合

例如， `accumulate(add, 11, 3, square)` 的结果是

```python
add(11,  add(square(1), add(square(2),  square(3)))) =
    11 +     square(1) +    square(2) + square(3)    =
    11 +     1         +    4         + 9            = 25
```

> 我们假定 `fuse` 是符合交换律的函数，那么就有 `fuse(a, b) == fuse(b, a)` ；我们还假设它是符合结合律的函数，也就有 `fuse(fuse(a, b), c) == fuse(a, fuse(b, c))` 

然后，用单行调用 `accumulate` 的方式实现（课程中提到的） `summation` 和 `product` 。

> **重要提示**： `summation_using_accumulate` 和 `product_using_accumulate` 都应该用一行代码实现，即以 `return` 开头。

```python
def summation_using_accumulate(n, term):
    """返回累加的和：term(1) + ... + term(n)，用到了accumulate。

    >>> summation_using_accumulate(5, square) # square(1) + square(2) + ... + square(4) + square(5)
    55
    >>> summation_using_accumulate(5, triple) # triple(1) + triple(2) + ... + triple(4) + triple(5)
    45
    >>> # 这个测试检查函数体是否仅为一个return语句。
    >>> import inspect, ast
    >>> [type(x).__name__ for x in ast.parse(inspect.getsource(summation_using_accumulate)).body[0].body]
    ['Expr', 'Return']
    """
    return ____

def product_using_accumulate(n, term):
    """返回乘积：term(1) * ... * term(n)，用到了accumulate。

    >>> product_using_accumulate(4, square) # square(1) * square(2) * square(3) * square()
    576
    >>> product_using_accumulate(6, triple) # triple(1) * triple(2) * ... * triple(5) * triple(6)
    524880
    >>> # 这个测试检查函数体是否仅为一个return语句。
    >>> import inspect, ast
    >>> [type(x).__name__ for x in ast.parse(inspect.getsource(product_using_accumulate)).body[0].body]
    ['Expr', 'Return']
    """
    return ____
```

使用 Ok 来测试你的代码：

```shell
python3 ok -q accumulate
python3 ok -q summation_using_accumulate
python3 ok -q product_using_accumulate
```



###  Q3：制作重复器

实现函数 `make_repeater`，该函数接收一个单参数函数 `f` 和一个正整数 `n`。它还返回一个新的单参数函数，使得 `make_repeater(f, n)(x)` 的返回值是对 `x` 连续应用 `n` 次函数 `f` 的结果，也就是 `f(f(...f(x)...))`。

例如，`make_repeater(square, 3)(5)` 会对 `5` 进行三次平方运算并返回 `390625`，效果等同于 `square(square(square(5)))`。

```python
def make_repeater(f, n):
    """返回一个函数，该函数实现连续n次对输入值应用f。

    >>> increment = lambda x: x + 1
    >>> triple = lambda x: x * 3
    >>> square = lambda x: x * x
    >>> add_three = make_repeater(increment, 3)
    >>> add_three(5)
    8
    >>> make_repeater(triple, 5)(1) # 3 * (3 * (3 * (3 * (3 * 1))))
    243
    >>> make_repeater(square, 2)(5) # square(square(5))
    625
    >>> make_repeater(square, 3)(5) # square(square(square(5)))
    390625
    """
    "*** 在这里填写你的代码 ***"
```

使用 Ok 来测试你的代码：

```shell
python3 ok -q make_repeater
```



## 检查你的得分

运行得到本次作业中每个问题的分数。

```shell
python3 ok --score
```
