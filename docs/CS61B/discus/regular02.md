# CS 61B 作用域、静态、链表、数组
2025年春季 讨论02：2025年2月3日

## 1 静态变量和静态函数

```java
public class Pokemon {
    public String name;
    public int level;
    public static String trainer = "Ash";
    public static int partySize = 0;
    
    public Pokemon(String name, int level) {
        this.name = name;
        this.level = level;
        this.partySize += 1;
    }
    
    public static void main(String[] args) {
        Pokemon p = new Pokemon("Pikachu", 17);
        Pokemon j = new Pokemon("Jolteon", 99);
        System.out.println("Party size: " + Pokemon.partySize);
        p.printStats();
        int level = 18;
        Pokemon.change(p, level);
        p.printStats();
        Pokemon.trainer = "Ash";
        j.trainer = "Cynthia";
        p.printStats();
    }
    
    public static void change(Pokemon poke, int level) {
        poke.level = level;
        level = 50;
        poke = new Pokemon("Luxray", 1);
        poke.trainer = "Team Rocket";
    }
    
    public void printStats() {
        System.out.println(name + " " + level + " " + trainer);
    }
}
```

## 2 作用域、静态、链表、数组

( a ) 写出main方法执行后将打印的内容。

( b ) 在第28行，我们将level设置为50。这里的level指的是什么？
A. Pokemon对象的实例变量
B. 包含change方法参数的局部变量
C. main方法中的局部变量
D. 其他（请解释）

( c ) 如果我们在main方法结束时调用Pokemon.printStats()，会发生什么？

## 2 旋转数组（Rotate Extra）

编写一个函数，当给定数组A和整数k时，返回一个新数组，其内容已向右移动k个位置，必要时绕回索引0。例如，如果A包含值0到7（包含），且k = 12，则在调用rotate(A, k)后返回的数组如下所示（右侧）：

```
01234567 => 45670123
```

k可以任意大或小 - 也就是说，k可以是正数或负数。如果k为负，则向左移动k个位置。调用rotate后，A应保持不变。

提示：你可能会发现模运算符%很有用。请注意，负数的模仍然是负数（即(-11) % 8 = -3）。

```java
/** 返回一个包含A中元素向右移动k个位置的新数组。 */
public static int[] rotate(int[] A, int k) {
    int rightShift = _______________________________;
    if(_________________________) {
        _____________________________________________;
    }
    int[] newArr = ___________________________________;
    for (__________________________________________) {
        int newIndex = ________________________________;
        _____________________________________________;
    }
    return newArr;
}
```

## 3 方向指针

绘制运行以下代码后产生的框和指针图。DLLStringNode类似于DLList中的Node。它有3个实例变量：prev、s和next。

```java
public class DLLStringNode {
    DLLStringNode prev;
    String s;
    DLLStringNode next;
    public DLLStringNode(DLLStringNode prev, String s, DLLStringNode next) {
        this.prev = prev;
        this.s = s;
        this.next = next;
    }
    public static void main(String[] args) {
        DLLStringNode L = new DLLStringNode(null, "eat", null);
        L = new DLLStringNode(null, "bananas", L);
        L = new DLLStringNode(null, "never", L);
        L = new DLLStringNode(null, "sometimes", L);
        DLLStringNode M = L.next;
        DLLStringNode R = new DLLStringNode(null, "shredded", null);
        R = new DLLStringNode(null, "wheat", R);
        R.next.next = R;
        M.next.next.next = R.next;
        L.next.next = L.next.next.next;
        
        /* 下面是可选练习。 */
        
        L = M.next;
        M.next.next.prev = R;
        L.prev = M;
        L.next.prev = L;
        R.prev = L.next.next;
    }
}
```

## 4 网格化（Gridify）

( a ) 考虑一个由Node组成的SLList的循环哨兵实现。对于前rows * cols个Node，将每个Node的项目按行主序放入一个2D rows×cols数组中。元素按顺序添加，填满整行后再移动到下一行。

例如，如果SLList包含元素5→3→7→2→8，且rows = 2和cols = 3，对其调用gridify应该返回这个网格。

```
537
280
```

注意：如果SLList包含的元素少于2D数组的容量，剩余的数组元素应为0；如果包含更多元素，则忽略多余的元素。

提示：Java的/运算符默认向下取整。你能使用这个以及%来移动行吗？

```java
public class SLList {
    Node sentinel;
    
    public SLList() {
        this.sentinel = new Node();
    }
    
    private static class Node {
        int item;
        Node next;
    }
    
    public int[][] gridify(int rows, int cols) {
        int[][] grid = __________________________________;
        _________________________________________________;
        return grid;
    }
    
    private void gridifyHelper(int[][] grid, Node curr, int numFilled) {
        if(_________________________________________________________________________) {
            return;
        }
        
        int row = ________________________________________;
        int col = ________________________________________;
        
        grid[row][col] = _____________________________;
        _________________________________________________;
        
    }
}
```

( b ) 为什么我们在这里使用辅助方法？即，为什么不能简单地使用签名gridify(int rows, int cols, Node curr, int numFilled)，完全省略gridifyHelper？
