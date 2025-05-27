# CS 61B 继承、比较器、泛型函数（解答）
2025年春季 讨论03：2025年2月10日

## 1 是鸟！是飞机！是猫巴士！

( a ) 在一次研究空中交通的科学考察中，我们发现了一个新物种：会飞的接口猫巴士（Flying Interfacing CatBus），它像一种交通工具，并且有发出噪音的能力（安全很重要！）。

给定`Vehicle`和`Noisemaker`接口，填写`CatBus`类，使猫巴士可以轰鸣引擎并以猫巴士特有的声音向其他猫巴士发出噪音。

### 解答

```java
interface Vehicle {
    public void revEngine();
}

interface Noisemaker {
    public void makeNoise();
}

public class CatBus implements Vehicle, Noisemaker {
    @Override
    public void revEngine() {
        // 猫巴士轰鸣引擎，实现未显示
    }
    
    @Override
    public void makeNoise() {
        // 猫巴士发出噪音，实现未显示
    }
    
    /** 允许猫巴士向其他猫巴士发出噪音。 */
    public void conversation(CatBus target) {
        makeNoise();
        target.makeNoise();
    }
}
```

( b ) 在空中的一个美好早晨，我们遇到了一只可怕的鹅，它也实现了`Noisemaker`接口（它的嘴里有一把刀！）。修改`conversation`方法签名，使猫巴士可以向`CatBus`和`Goose`对象发出噪音，同时只有一个参数`target`。

我们可以更改方法签名，使参数`target`的类型为`Noisemaker`（`CatBus`和`Goose`都实现了`Noisemaker`）：

```java
/** 允许猫巴士向猫巴士和鹅都发出噪音。 */
public void conversation(Noisemaker target) {
    makeNoise();
    target.makeNoise();
}
```

## 2 默认方法

( a ) 假设我们有一个想要实现的`MyQueue`接口。我们想添加三个默认方法到接口中：`clear`、`remove`和`max`。在下面的代码中填写这些方法。

### 解答

```java
// 从队列中移除所有项目
default void clear() {
    while (!isEmpty()) {
        dequeue();
    }
}

// 从队列中移除所有等于item的项目
// 剩余项目应该保持与之前相同的顺序
default void remove(E item) {
    int removed = 0;
    int currSize = size();
    while (removed < currSize) {
        E currItem = dequeue();
        if (!currItem.equals(item)) {
            enqueue(currItem);  
        }
        removed++;
    }
}

// 根据比较器返回队列中的最大元素
// 队列中的项目应该保持与之前相同的顺序
// 假设队列不为空
default E max(Comparator<E> c) {
    int removed = 0;
    int currSize = size();
    E currMax = null;
    while (removed < currSize) {
        E currItem = dequeue();
        if (currMax == null) {
            currMax = currItem;
        } else if (c.compare(currItem, currMax) > 0) {
            currMax = currItem;
        }
        enqueue(currItem);
        removed++;
    }
    return currMax;
}
```

注意，使用`for (int i = 0; i < currSize; i++) {...}`在这里也可以工作。

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

`LengthComparator`，因为它声称是一个`Comparator`，但缺少`compare`方法。

( b ) 假设我们在`LengthComparator`中省略了`implements Comparator<String>`。哪个文件将无法编译？
- ComparatorTester.java
- LengthComparator.java
- Maximizer.java
- Comparator.java

`ComparatorTester`，因为我们试图将`LengthComparator`（不是`Comparator`）提供给需要`Comparator`的`max`方法。

`LengthComparator`，因为`compare`不再重写任何东西，从而导致`@Override`触发编译器错误。

( c ) 假设我们移除了`@Override`。有什么影响？

代码会正常工作，但最佳实践是说"Override"以防止拼写错误并使我们的代码更清晰。

( d ) 假设我们改变类型参数出现的位置，使`Maximizer`中的代码看起来像：
```java
public class Maximizer<T> {
    public T max(T[] items, Comparator<T> c) {
        ...
```
使用`Maximizer`的方式会有什么变化？

我们必须实例化一个`Maximizer`对象才能使用它，例如`Maximizer<String> m = new Maximizer<>();`
这不是很好。

( e ) 假设我们将`max`的方法签名改为`public static String max(String[] items, Comparator<String> c)`。所展示的代码仍然能工作吗？

是的，它仍然可以工作，只是不能推广到`String`以外的类型。
