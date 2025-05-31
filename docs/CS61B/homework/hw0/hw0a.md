# 语言结构
许多 Python 的基础语法在 Java 中都有对应形式，例如循环和条件语句。本节将直接对比两者的语法差异。

!!! info "MOLI：本次实验你将会学到什么"
    
    - Java 语法基础与 Python 对比
    - 变量声明与数据类型使用
    - 控制结构（条件与循环）
    - Java 函数定义与调用
    - 字符串操作与程序结构

## 变量声明

| Python | Java |
|:------|:------|
| ```i = 0``` | ```int i = 0;``` |


- 与Python一样，Java变量具有 **类型** 。在Java中，声明变量时必须显式指定其类型。变量声明的类型永远不能更改。有关“静态类型”的更多信息，请参阅第1讲。
- 语句末尾还必须加上分号。 

## 类型
| Python     | Java     | 说明                                                         |
| ---------- | -------- | ------------------------------------------------------------ |
| `bool`     | `boolean`| Python 使用 `True` 和 `False`；Java 使用 `true` 和 `false`。 |
| `int`      | `int`    | Python 的 `int` 无范围限制，而 Java 的 `int` 有（很大的）最大值和最小值。 |
| `float`    | `double` | 表示十进制数值。Java 的 `double` 也是有范围限制的。              |
| `str`      | `String` | Java 的 `String` 使用双引号（`"`），可以是任意文本。           |
| 无对应类型 | `char`   | Java 的 `char` 表示单个字符，使用单引号（`'`）。               | 
## 注释

| Python | Java |
| ---- | ---- |
| `# 这是单行注释。` | `// 这是单行注释。` | 


Java也有多行注释，以`/*` 开始，以 `*/` 结束。 
## `while`循环

| Python | Java |
|--------|------|
| <pre><code>i = 0<br><span style="color:green">while</span> i < 10:<br>    <span style="color:blue">print</span>(i)<br>    i <span style="color:green">+=</span> 1</code></pre> | <pre><code>int i = 0;<br><span style="color:green">while</span> (i < 10) {<br>    <span style="color:blue">System.out.println</span>(i);<br>    i<span style="color:green">++</span>;<br>}</code></pre> |

- 循环条件周围的括号 `( )` 是必需的。
- 在Java中，通常使用 `++` 来代替 `+= 1`。 
- 在Java中，我们使用 `System.out.println` 来进行打印操作。
- 我们使用花括号 `{ }` 来包裹while循环的代码块，而不是通过缩进。Java并不强制要求缩进，但缩进是一种良好的编程风格。 

## `for`循环(递增计数)
| Python | Java |
|--------|------|
| <pre><code><span style="color:green">for</span> i <span style="color:green">in</span> <span style="color:green">range</span>(10):<br>    <span style="color:blue">print</span>(i)</code></pre> | <pre><code><span style="color:green">for</span> (int i = 0; i < 10; i++) {<br>    <span style="color:blue">System.out.println</span>(i);<br>}</code></pre> | 

在 Java 中，for循环的语法如下：

```
for (initialization; termination; increment) {
    // loop body
}
```

这与while循环类似：
| Python | Java |
| ---- | ---- |
| <pre><code>initialization<br><span style="color:green">while</span> termination:<br>    # Loop body<br>    increment</code></pre> | <pre><code>initialization<br><span style="color:blue">while</span> (termination) {<br>    // Loop body<br>    increment<br>}</code></pre> |

当终止条件为假时，while 循环和 for 循环都会退出。对比表中的 for 循环会一直执行到 i = 10 为止。
## `for`循环(递减计数)
| Python | Java |
| ---- | ---- |
| <pre><code><span style="color:green">for</span> i <span style="color:green">in</span> <span style="color:green">range</span>(9, -1, -1):<br>    <span style="color:blue">print</span>(i)</code></pre> | <pre><code><span style="color:green">for</span> (int i = 9; i >= 0; i--) {<br>    <span style="color:blue">System.out.println</span>(i);<br>}</code></pre> |

- 注意Java的`for`循环中不同的“初始化”“终止条件”和“递增（此处为递减）”部分。

- 与`++`类似，`--` 常用来代替 `-= 1`。
- 对比表中的`for`循环会一直执行到 `i < 0` 为止。 
## 条件语句

| Python | Java |
|--------|------|
| <pre><code><span style="color:green">if</span> i % 3 == 0 <span style="color:green">and</span> i % 5 == 0:<br>    <span style="color:blue">print</span>("FizzBuzz")<br><span style="color:green">elif</span> i % 3 == 0:<br>    <span style="color:blue">print</span>("Fizz")<br><span style="color:green">elif</span> i % 5 == 0:<br>    <span style="color:blue">print</span>("Buzz")<br><span style="color:green">else</span>:<br>    <span style="color:blue">print</span>(i)</code></pre> | <pre><code><span style="color:green">if</span> (i % 3 == 0 <span style="color:green">&&</span> i % 5 == 0) {<br>    <span style="color:blue">System.out.println</span>("FizzBuzz");<br>} <span style="color:green">else</span> <span style="color:green">if</span> (i % 3 == 0) {<br>    <span style="color:blue">System.out.println</span>("Fizz");<br>} <span style="color:green">else</span> <span style="color:green">if</span> (i % 5 == 0) {<br>    <span style="color:blue">System.out.println</span>("Buzz");<br>} <span style="color:green">else</span> {<br>    <span style="color:blue">System.out.println</span>(i);<br>}</code></pre> | 

布尔运算符如下：
| Python | Java |
| ---- | ---- |
| `and` | `&&` |
| `or` | `\|\|` |
| `not` | `!` |
| `==` | `==` |

- 注意`elif`和`else if`之间的区别。
- 注意：在Java中，`==`用于判断对象的 **同一性（即是否为同一个对象，比较内存地址 ）** ，而`.equals()`用于判断对象的 **相等性（比较对象的值 ）** 。对于基本数据类型，这两者效果相同，但对于引用数据类型，情况可能有所不同。在本次作业中，你无需了解这一区别，我们稍后会进一步学习。 
## 指数运算
| Python | Java |
| ---- | ---- |
| <pre><code>x = 2**10</code></pre> | <pre><code>double x = Math.pow(2, 10);</code></pre> |

请注意，在Java中`^` 是“异或”运算符，并非指数运算。也就是说，`2 ^ 10` 是有效代码，但它将返回`8` ，而不是`1024` 。 
## 函数声明和使用
| Python | Java |
| ---- | ---- |
| <pre><code><span style="color:green">def</span> greet(name):<br>    <span style="color:green">return</span> "Hello, " + name<br><br># Elsewhere...<br><span style="color:blue">print</span>(greet("Josh"))</code></pre> | <pre><code><span style="color:green">public</span> <span style="color:green">static</span> <span style="color:blue">String</span> greet(<span style="color:blue">String</span> name) {<br>    <span style="color:green">return</span> "Hello, " + name;<br>}<br>// Elsewhere...<br><span style="color:blue">System.out.println</span>(greet("Josh"));</code></pre> | 


- 在Java中，函数有特定的返回类型，该返回类型位于函数名之前。函数还会指定其参数的类型。
- 当函数不返回任何值时，其返回类型为`void`。 

- 目前，我们所有的函数前面都会有`public static` 修饰。我们稍后会学习到更多关于类的东西。 
- 调用函数的方式与Python中类似。 
## 字符串
| Python | Java |
| ---- | ---- |
| <pre><code>s = "hello"<br>s += " world"<br>s += <span style="color:green">str</span>(5)<br>s_length = <span style="color:green">len</span>(s)<br>substr = s[1:5]<br>c = s[2]<br><span style="color:green">if</span> "hello" <span style="color:green">in</span> s:<br>    <span style="color:blue">print</span>('"hello" in s')<br><br><span style="color:green">for</span> letter <span style="color:green">in</span> s:<br>    <span style="color:blue">print</span>(letter)</code></pre> | <pre><code><span style="color:blue">String</span> s = "hello";<br>s += " world";<br>s += 5;<br><span style="color:blue">int</span> sLength = s.length();<br><span style="color:blue">String</span> substr = s.substring(1, 5);<br><span style="color:blue">char</span> c = s.charAt(2);<br><span style="color:green">if</span> (s.indexOf("hello") != -1) {<br>    <span style="color:blue">System.out.println</span>('"hello" in s');}<br><br><span style="color:green">for</span> (<span style="color:blue">int</span> i = 0; i < s.length(); i++) {<br>    <span style="color:blue">char</span> letter = s.charAt(i);<br>    <span style="color:blue">System.out.println</span>(letter);<br>}</code></pre> | 

- 在Java中，`String`不能直接迭代。我们要么通过索引进行迭代并使用`charAt` 方法，要么将其转换为数组（后续会讲到 ）。

- 在Java中，你可以将任何内容与`String`相加，它会被隐式转换为`String`，而无需显式强制类型转换。 
# 程序
既然我们已经学习了各种语法，现在来看一些使用这些语法的 Java 程序。这里有一些简单的程序，当你忘记如何做某些事情时，可能会用到它们。
## Hello World
| Python | Java |
| ---- | ---- |
| <pre><code><span style="color:blue">print</span>("Hello World")</code></pre> | <pre><code><span style="color:green">public</span> <span style="color:green">class</span> Helloworld {<br>    <span style="color:green">public</span> <span style="color:green">static</span> <span style="color:blue">void</span> main(<span style="color:blue">String</span>[] args) {<br>        <span style="color:blue">System.out.println</span>("Hello World");<br>    }<br>}</code></pre> |

- 所有Java代码都必须位于 **class** 中。稍后我们会学习到更多关于类的东西。

- 当执行Java程序时，会运行`public static void main(String[] args)` 方法 。这与 Python 不同，Python 中的代码可以在函数外部执行。

# 练习
**在继续之前，请确保你已完成实验 1。**

华盛顿大学（UW）在一个名为 Practice - It 的网站上有大量的 Java 入门练习，我们会选用其中一些。在 作业 0A，我们挑选了几道练习题需要你完成！

注意：华盛顿大学对 Practice - It 的访问权限有限，并且计划停止该服务。完成此作业并不要求（也不期望）你登录 Practice - It。关于如何完成作业 0A 的明确说明，请参阅 “作业提交” 部分。


- 自我检查1.26：`Confusing` 

- 练习2.5：`starTriangle `
- 自我检查2.25：`numberTotal `
- 练习3.23：`printIndexed `
- 练习4.17：`stutter`
- 自我检查4.5：`ifElseMystery1 `
- 练习4.19：`quadrant `

我们提供了一些框架代码来帮助你上手。要获取框架代码，[请遵循常规的作业流程](https://sp25.datastructur.es/resources/guides/assignment-workflow/)。

获取框架代码后，在IntelliJ中打开它。你会在相应方法签名上方的注释中找到每个任务的问题描述。要获得满分，你需要完成`starTriangle`、`printIndexed`、`stutter`和`quadrant`这几个练习。我们也鼓励你完成`Confusing`、`numberTotal`和`ifElseMystery1`这几个练习，但这些不会计分。

如果你在做练习时遇到困难，一种方法是先在Python中解决问题，然后再将其转换为Java代码。如果你在Python中解决问题也有困难，这也没关系，这不是本练习的重点。如果你想参考Python解决方案，请查看下面的下拉菜单。 


??? starTriangle

    ```
    for i in range(5):
        line = ""
        for j in range(5 - i - 1):
            line += " "
        for k in range(i + 1):
            line += "*"
        print(line)

    ```

??? printIndexed

    ```python
    def printIndexed(s):
        output = ""
        for i in range(len(s)):
            output += s[i]
            output += str(len(s) - 1 - i)
        print(output)
    ```


??? stutter

    ```python
    def stutter(s):
        output = ""
        for i in range(len(s)):
            output += s[i]
            output += s[i]
        return output
    ```

??? quadrant

    ```python
    def quadrant(x, y):
        if x == 0 or y == 0:
            return 0
        elif y > 0 and x > 0:
            return 1
        elif y > 0 and x < 0:
            return 2
        elif y < 0 and x < 0:
            return 3
        else:
            return 4
    ```


# 作业提交
本次作业有两种获得学分的方式：
- 向hw0A：提交可运行的代码实现。
- 向hw0A：提交截图。

**如果你是首次完成作业0A** 必须在框架文件中完成练习。将工作提交并推送到远程仓库后，可将代码提交至Gradescope上的“作业0A：代码”。若通过所有自动评分测试，即完成作业。

**如果你之前已经完成过作业0A**（例如，你之前学期选修过61B但退课了 ），可以提交之前完成Practice - It练习时的截图，显示之前的完成日期。你无需再做其他事，但我们强烈建议你重新练习不熟悉的内容以巩固知识。

注意：若将截图转换为Gradescope要求的PDF格式时遇到困难，可尝试使用[此转换器](https://png2pdf.com) 。

恭喜！你已为后续几节课做好准备，并且完成了作业0。上完第2节课后，你就可以开始阅读作业0B了，如果你愿意，现在也可以提前开始。

编程语言与自然语言并无太大不同——尤其是，你编写的代码越多，就会越熟练。PracticeIt网站上有 **许多** 练习题，你可以自由尝试更多（不过，它们的内容编排与我们的课程不完全匹配——如果你遇到涉及`Scanner` 或需要生成随机数的题目，可以跳过 ）。

我们还推荐[https://codingbat.com/java/AP - 1](https://codingbat.com/java/AP-1) ，上面有更多进阶的Java练习题。 
