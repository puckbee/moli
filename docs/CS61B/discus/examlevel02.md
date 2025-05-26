# CS 61B 数组、链表
2025年春季 考试级别02：2025年2月3日

## 1 框和指针

绘制框和指针图，表示在每个语句之后的IntLists L1、L2和L3。

```java
IntList L1 = IntList.list(1, 2, 3);
IntList L2 = new IntList(4, L1.rest);
L2.rest.first = 13;
L1.rest.rest.rest = L2;
IntList L3 = IntList.list(50);
L2.rest.rest = L3;
```

## 2 交错（Interweave）

实现`interweave`方法，该方法接收一个IntList lst和一个整数k，并将lst破坏性地交错成k个IntList，存储在一个IntList数组中。这里，破坏性意味着你应该专注于修改现有IntList lst中的指针，而不是创建新的IntList实例。

具体要求：
- 它与其他列表长度相同。你可以假设IntList可以被均匀地分割。
- lst中的第一个元素放在IntList数组的第一个索引中。第二个元素放在第二个索引中。这样一直持续到遍历完数组，然后我们回到数组的第一个索引继续放置元素。
- 其顺序与lst的顺序一致，即lst中较早的项目必须在较晚的项目之前。

例如，如果lst包含元素[6, 5, 4, 3, 2, 1]，且k = 2，那么该方法应该返回一个IntList数组，索引0处为[6, 4, 2]，索引1处为[5, 3, 1]。

在开始时，我们对IntList lst进行了破坏性反转，因为通常从后向前构建IntList更容易。

提示：数组中的元素应该跟踪它们正在构建的小IntList的头部。

```java
public static IntList[] interweave(IntList lst, int k) {
    IntList[] array = new IntList[k];
    int index = k - 1;
    IntList L = reverse(lst); // 假设reverse已正确实现
    while (___________________) {
        IntList prevAtIndex = ___________________;
        IntList next = ___________________;
        __________________________________;
        __________________________________;
        L = ___________________;
        index -= 1;
        if(______________________) {
            _______________________;
        }
    }
    return array;
}
```

## 3 移除重复项

使用下一页定义的简化DLList类，实现`removeDuplicates`方法。`removeDuplicates`应该从DLList中移除所有重复项。例如，如果我们的初始列表是[8, 4, 4, 6, 4, 10, 12, 12]，最终列表应该是[8, 4, 6, 10, 12]。你不能假设重复项是分组在一起的，或者列表是排序的！

```java
public class DLList {
    Node sentinel;

    public DLList() {
        // 构造函数实现
    }

    public class Node {
        int item;
        Node prev;
        Node next;
    }

    public void removeDuplicates() {
        Node ref = sentinel.next;  // 从第一个有效节点开始
        Node checker;
        
        while (ref != sentinel) {  // 遍历整个链表
            checker = ref.next;    // 检查ref之后的所有节点
            
            while (checker != sentinel) {  // 内层循环检查重复
                if (checker.item == ref.item) {  // 发现重复节点
                    Node checkerPrev = checker.prev;
                    Node checkerNext = checker.next;
                    
                    // 删除重复节点
                    checkerPrev.next = checkerNext;
                    checkerNext.prev = checkerPrev;
                }
                checker = checker.next;  // 移动到下一个检查节点
            }
            ref = ref.next;  // 移动到下一个参考节点
        }
    }
}
```
