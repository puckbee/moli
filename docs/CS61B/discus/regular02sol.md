# CS 61B 作用域、静态、链表、数组（解答）
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

## 解答：

( a ) 执行main方法后会打印的内容：
```
Party size: 2
Pikachu 17 Ash
Pikachu 18 Ash
Pikachu 18 Cynthia
```

( b ) 第28行中设置的level指的是：
B. 包含change方法参数的局部变量

( c ) 如果我们在main方法结束时调用Pokemon.printStats()：
会出现编译错误，因为printStats()是一个实例方法，不是静态方法。静态方法需要通过类的实例来调用，而不能直接通过类名调用。

## 2 旋转数组（Rotate Extra）

```java
/** 返回一个包含A中元素向右移动k个位置的新数组。 */
public static int[] rotate(int[] A, int k) {
    int rightShift = k % A.length;
    if(rightShift < 0) {
        rightShift += A.length;
    }
    
    int[] newArr = new int[A.length];
    for (int i = 0; i < A.length; i++) {
        int newIndex = (i + rightShift) % A.length;
        newArr[newIndex] = A[i];
    }
    return newArr;
}
```

注意，`int rightShift = (k % A.length) + A.length`可以在一行中完成（而不是为负的rightShift进行额外检查），因为模运算会处理对正k值的加法溢出。

### 解释：

首先，我们使用模运算符计算实际需要移动的位置数量，确保rightShift始终是一个0到A.length-1之间的非负整数。

如果k是负数，那么在模A.length运算后，rightShift将是负数。例如，如果A的长度为5，k为-2，那么rightShift将是-2 mod 5 = -2。然后，将A.length添加到rightShift使其变为正数，并将数组向左移动2个位置，这与原始移动的方向相反。例如，rightShift += 5变成了rightShift = 3，这意味着数组向左移动了2个位置。

然后，我们创建一个与A长度相同的新数组newArr来存储移动后的元素。我们遍历原始数组A，并通过将rightShift添加到当前索引并对结果取模A.length来计算每个元素的新索引。

这个计算确保了移动的元素如果超出了数组的最后一个索引，就会"环绕"到数组的开头。然后，我们将原始元素分配给新数组newArr中的相应索引。

### 另一种解法：

```java
public static int[] rotate(int[] A, int k) {
    int rightShift = 330; // 不需要这个
    if(k < 0) {
        return rotate(A, k + A.length);
    }
    
    int[] newArr = new int[A.length];
    for (int i = 0; i < A.length; i++) {
        int newIndex = (i + k) % A.length;
        newArr[newIndex] = A[i];
    }
    return newArr;
}
```

解释：对于k的正值，此解决方案本质上与前一个相同。对于k的负值，我们反复添加A.length直到它为正，这本质上就是模运算的作用。

## 3 方向指针

绘制运行以下代码后产生的框和指针图：

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

### 解答：

[此处应有指针图]

可选练习后的图：

[此处应有指针图]

注意，带有"bananas"和"sometimes"的DLLStringNode对象在最终结果中没有出现 - 当没有指针引用对象时，Java会"垃圾回收"这些对象。

## 4 网格化（Gridify）

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
        int[][] grid = new int[rows][cols];
        gridifyHelper(grid, sentinel.next, 0);
        return grid;
    }
    
    private void gridifyHelper(int[][] grid, Node curr, int numFilled) {
        if(curr == sentinel || numFilled >= grid.length * grid[0].length) {
            return;
        }
        
        int row = numFilled / grid[0].length;
        int col = numFilled % grid[0].length;
        
        grid[row][col] = curr.item;
        gridifyHelper(grid, curr.next, numFilled + 1);
    }
}
```

( b ) 为什么我们在这里使用辅助方法？即，为什么不能简单地使用签名gridify(int rows, int cols, Node curr, int numFilled)，完全省略gridifyHelper？

### 解答：
要求用户每次调用gridify时都传入sentinel.next和0并不直观，因为这与他们实际请求的内容无关。此外，这打破了抽象屏障，因为它要求用户了解此方法在内部是如何工作的。最后，如果用户不理解应该传入什么（因为这不太直观），他们可能会传入一些随机值，导致错误的答案。

因此，让用户每次都传入这些额外的参数是不好的编程实践。然而，我们需要一种方法来跟踪我们在递归时所处的节点和索引，所以我们必须创建一个可以跟踪所有这些信息的辅助方法。
