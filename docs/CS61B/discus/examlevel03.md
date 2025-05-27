# CS 61B 继承、比较器、泛型函数
2025年春季 考试级别03：2025年2月10日

## 1 默认方法

假设我们有一个想要实现的`MyStack`接口。我们想添加两个默认方法到接口中：`insertAtBottom`和`flip`。在下面的代码中填写这些方法。

```java
public interface MyStack<E> {
    void push(E element); // 将元素添加到栈顶
    E pop();              // 移除并返回栈顶元素
    boolean isEmpty();    // 如果栈为空则返回true
    int size();           // 返回栈中的元素数量
    
    // 使用push、pop、isEmpty和size方法在栈底插入元素
    private void insertAtBottom(E item) {
        
    }
    // 将栈上下翻转（提示：使用insertAtBottom）
    default void flip() {
        
    }
}
```

## 2 元比较器（MetaComparison）

给定IntList x、IntList y和Comparator<Integer> c，IntListMetaComparator对x和y进行比较。

具体来说，IntListMetaComparator对x和y中的所有项进行成对比较。如果列表长度不同，则忽略较长列表中的额外项。让α为根据c判断，x中小于y中对应项的项数。让β为根据c判断，x中大于y中对应项的项数。如果α > β，则认为x小于y。如果α = β，则认为x等于y。如果α < β，则认为x大于y。例如：

```java
Comparator<Integer> c = new FiveCountComparator(); //比较数字中5的数量
IntList x = [ 55, 70,  90, 115, 5];                //例如，55有2个5
IntList y = [150, 35, 215,  25]; 
IntListMetaComparator ilmc = new IntListMetaComparator( c ); 
ilmc.compare(x, y); // 返回负数
```

对于上面的例子，根据FiveCountComparator，我们有55 > 150，70 < 35，90 < 215，和115 = 25。这得到α = 2和β = 1，因此ilmc.compare将返回一个负数。填写下面的代码：

```java
public class IntListMetaComparator implements Comparator<IntList> {
    _____________________________________ 
    
    public IntListMetaComparator(Comparator<Integer> givenC) { 
        _____________________________________        
    }
    
    /* 如果x中更多项小于对应项，返回负数
       如果x中更多项大于对应项，返回正数 
       如果一个列表比另一个长，多余的项会被忽略 */ 
    public int compare(IntList x, IntList y) { 
        if ((____________________ ) || (______________________ )) {
            _________________________________________________
        } 
        _____________________________________________________ 
        if (________________________ ) {
            return ____________________________ ;
        
        } else if (________________________ ) { 
            return __________________________________ ;
        } else { 
            return __________________________________ ; 
        } 
    }
}
```

## 3 继承语法

假设我们有以下类：

```java
public class ComparatorTester {
    public static void main(String[] args) {
        String[] strings = new String[] {"horse", "cat", "dogs"};
        System.out.println(Maximizer.max(strings, new LengthComparator()));
    }
}   

public class LengthComparator implements Comparator<String> {
    @Override
    public int compare(String a, String b) {
        return a.length() - b.length();
    }
}

public class Maximizer {
    /**
     * 根据给定的Comparator，返回items中的最大元素。
     */
    public static <T> T max(T[] items, Comparator<T> c) {
        ...
        int cmp = c.compare(items[i], items[maxDex]);
        ...
    }
}
```

( a ) 假设我们省略了`LengthComparator`中的`compare`方法。以下哪个文件将无法编译？
- ComparatorTester.java
- LengthComparator.java
- Maximizer.java
- Comparator.java

( b ) 假设我们在`LengthComparator`中省略了`implements Comparator<String>`。哪个文件将无法编译？
- ComparatorTester.java
- LengthComparator.java
- Maximizer.java
- Comparator.java

( c ) 假设我们移除了`@Override`。有什么影响？

( d ) 假设我们改变类型参数出现的位置，使`Maximizer`中的代码看起来像：
```java
public class Maximizer<T> {
    public T max(T[] items, Comparator<T> c) {
        ...
```
使用`Maximizer`的方式会有什么变化？

( e ) 假设我们将`max`的方法签名改为`public static String max(String[] items, Comparator<String> c)`。所展示的代码仍然能工作吗？
