# CS 61B 继承、比较器、泛型函数
2025年春季 讨论03：2025年2月10日

## 1 是鸟！是飞机！是猫巴士！

( a ) 在一次研究空中交通的科学考察中，我们发现了一个新物种：会飞的接口猫巴士（Flying Interfacing CatBus），它像一种交通工具，并且有发出噪音的能力（安全很重要！）。

给定`Vehicle`和`Noisemaker`接口，填写`CatBus`类，使猫巴士可以轰鸣引擎并以猫巴士特有的声音向其他猫巴士发出噪音。

```java
interface Vehicle {
    public void revEngine();
}

interface Noisemaker {
    public void makeNoise();
}

public class CatBus ______________________ ________________ , ________________ {
    @Override
    ___________ __________ _______________ { /* 猫巴士轰鸣引擎，代码未显示 */ }
      
    @Override
    ___________ __________ _______________ { /* 猫巴士发出噪音，代码未显示 */ }
      
    /** 允许猫巴士向其他猫巴士发出噪音。 */
    public void conversation(CatBus target) {
        makeNoise();
        target.makeNoise();
    }
}
```

( b ) 在空中的一个美好早晨，我们遇到了一只可怕的鹅，它也实现了`Noisemaker`接口（它的嘴里有一把刀！）。修改`conversation`方法签名，使猫巴士可以向`CatBus`和`Goose`对象发出噪音，同时只有一个参数`target`。

## 2 默认方法

( a ) 假设我们有一个想要实现的`MyQueue`接口。我们想添加三个默认方法到接口中：`clear`、`remove`和`max`。在下面的代码中填写这些方法。

```java
public interface MyQueue<E> {
    void enqueue(E element); // 将元素添加到队列末尾
    E dequeue();             // 移除并返回队列前端元素
    boolean isEmpty();       // 如果队列为空则返回true
    int size();              // 返回队列中的元素数量
    
    // 从队列中移除所有项目
    default void clear() {
        
    }
    // 从队列中移除所有等于item的项目
    // 剩余项目应该保持与之前相同的顺序
    default void remove(E item) {
        
    }
    // 根据比较器返回队列中的最大元素
    // 队列中的项目应该保持与之前相同的顺序
    // 假设队列不为空
    default E max(Comparator<E> c) {
        
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
