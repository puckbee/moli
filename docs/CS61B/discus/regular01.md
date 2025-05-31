# CS 61B Java 入门
2025年春季 讨论01：2025年1月27日

## 1 欢迎来到 CS 61B

本学期刚刚开始，CS 61B 的工作人员正在为课程基础设施添加一些最后的修饰，但他们需要你的帮助！你需要使用下面定义的 CS61BStudent 类。

```java
public class CS61BStudent { // 类声明
    public int idNumber;      // 实例变量
    public int grade;
    public static String instructor = "Hug"; // 类（静态）变量
    
    public CS61BStudent(int id) { // 构造函数
        this.idNumber = id;
        this.grade = 100;
    }
    
    public boolean watchLecture() { // 实例方法
        // 返回学生是否真正观看了讲座
        ...
    }
    
    public static String getInstructor() { // 静态方法
        ...
    }
}
```

## 2 Java 入门

以下所有部分都涉及填写下面的 CS61B 类。你可以使用任何类型。

### ( a ) 声明变量

我们需要声明（可能还需要实例化和赋值！）一些重要的变量。请记住，类主体中的变量甚至在构造函数完全创建类的实例之前就已编译；换句话说，仔细考虑我们可以访问哪些信息。在类中定义以下变量：

1. university：大学的名称，对于所有学期的 CS61B 都应该是 "UC Berkeley"
2. semester：课程教授的学期
3. students：本学期 CS61B 中注册的 CS61BStudent。记住课程有固定的容量！

### ( b ) 构造函数

每个 CS61B 实例代表课程的一个学期。创建一个构造函数，该构造函数接收课程最大可注册学生人数的容量 capacity，由报名课程的学生（按顺序）组成的数组 signups，以及学期 semester（例如 "Fall 2023"）。

在构造函数中，我们希望从 signups 中注册 capacity 名学生，并初始化学期实例变量。

提示：我们有一个名为 semester 的构造函数变量和一个名为 semester 的实例变量。我们如何区分它们？

### ( c ) 实现方法

现在让我们将一些高度需求的功能实现为方法。考虑方法应该返回什么，其参数类型，它是否应该是静态的等等。

1. makeStudentsWatchLecture：让本学期课程中注册的每个 CS61BStudent 观看讲座（不包括候补学生）。返回实际观看讲座的学生总数。请记住，Student 类中的 watchLecture 方法返回单个学生是否真正观看了讲座！
2. changeUniversity：接收一个新的大学名称 newUniversity。将所有学期的 CS61B 的大学更改为 newUniversity。

### ( d ) 支持课程扩展

修改你现有的实现以支持 expand 功能，该功能允许我们的基础设施处理课程扩展。每当课程扩展时，原本在候补名单上的学生应该被注册，直到达到新的容量。假设新容量始终小于或等于报名的学生人数。

挑战：在不额外使用 new 的情况下支持课程扩展。

## Java 入门 3

```java
/** 哈哈，懂了吧...因为 CS61B 是一个类...在一所公立大学...我会自己离开 */
public class CS61B {
    // 变量（部分 a）
    
    // 构造函数（部分 b）
    
    // 方法（部分 c）
    /** 让本学期课程中注册的每个 CS61BStudent 观看讲座。返回实际观看讲座的学生数量。 */
    
    /** 接收一个新的大学名称 newUniversity 并将所有学期的 CS61B 的大学更改为 newUniversity。 */
    
    // 扩展（部分 d）
    /** 将课程扩展到给定的容量。 */
}
```