# CS 61B 作用域、值传递、静态（解答）
2025年春季 考试级别01：2025年1月27日

## 1 快速数学

( a ) 在下面的main方法中填空。（2016年秋季，期中考试1）

```java
public class QuikMaths {
    public static void multiplyBy3(int[] A) {
        for (int i = 0; i < A.length; i += 1) {
            int x = A[i];
            x = x * 3;
        }
    }

    public static void multiplyBy2(int[] A) {
        int[] B = A;
        for (int i = 0; i < B.length; i+= 1) {
            B[i] *= 2;
        }
    }

    public static void swap(int A, int B) {
        int temp = B;
        B = A;
        A = temp;
    }

    public static void main(String[] args) {
        int[] arr = new int[]{2, 3, 3, 4};
        multiplyBy3(arr); // arr的值: {________________________}
        
        arr = new int[]{2, 3, 3, 4};
        multiplyBy2(arr); // arr的值: {________________________}
        
        int a = 6;
        int b = 7;
        swap(a, b); // a的值: _______ b的值: _______
    }
}
```

## 2 作用域、值传递、静态

( b ) 现在看看下面的代码。我们如何编写'swap'方法来在函数中交换基本类型变量？请确保使用下面的IntWrapper类。

```java
class IntWrapper {
    int x;
    public IntWrapper(int value) {
        x = value;
    }
}

public class SwapPrimitives {
    public static void main(String[] args) {
        IntWrapper first = new IntWrapper(6);
        IntWrapper second = new IntWrapper(7);
        swap(__________, __________);
    }
    
    public static void swap(_________________, _________________) {
        _______________________________________;
        _______________________________________;
        _______________________________________;
    }
}
```

## 解答：

### 第( a )部分：[点击这里查看可视化链接]()

第23行：/* arr的值: {2, 3, 3, 4} */，因为我们只是改变了每个元素的副本，而不是原始元素。
增强型for循环也会有类似的效果。

第28行：/* arr的值: {4, 6, 6, 8} */，因为B和A指向同一个底层数组。

第34行：/* a的值: 6 b的值: 7 */，Java是值传递，所以你只是交换了原始整数的副本。

### 第( b )部分：

```java
class IntWrapper {
    int x;
    public IntWrapper(int value) {
        x = value;
    }
}

public class SwapPrimitives {
    public static void main(String[] args) {
        IntWrapper first = new IntWrapper(6);
        IntWrapper second = new IntWrapper(7);
        swap(first, second);
    }
    
    public static void swap(IntWrapper first, IntWrapper second) {
        int temp = first.x;
        first.x = second.x;
        second.x = temp;
    }
}
```

## 2 静态书籍

假设我们有以下Book和Library类。

```java
class Book {
    public String title;
    public Library library;
    public static Book last = null;
    
    public Book(String name) {
        title = name;
        last = this;
        library = null;
    }
    
    public static String lastBookTitle() {
        return last.title;
    }
    
    public String getTitle() {
        return title;
    }
}

class Library {
    public Book[] books;
    public int index;
    public static int totalBooks = 0;
    
    public Library(int size) {
        books = new Book[size];
        index = 0;
    }
    
    public void addBook(Book book) {
        books[index] = book;
        index++;
        totalBooks++;
        book.library = this;
    }
}
```

( a ) 对于下面的每个修改，确定如果我们只进行该修改，Library和Book类的代码是否会编译或报错，即每个修改独立对待。

1. 将totalBooks变量改为非静态
2. 将lastBookTitle方法改为非静态
3. 将addBook方法改为静态
4. 将last变量改为非静态
5. 将library变量改为静态

### 解答：

1. 可以编译
2. 可以编译
3. 错误，无法在静态方法中访问实例变量books
4. 错误，无法在静态方法中访问实例变量last
5. 可以编译

( b ) 使用原始的Book和Library类（即，不包含部分a中的修改），写出下面main方法的输出。如果某行出错，请写出错误的确切原因并继续执行。

### 解答：[点击这里查看可视化链接](https://cscircles.cemc.uwaterloo.ca/java_visualize/#code=class+Book+%7B%0A++++public+String+title%3B%0A++++public+Library+library%3B%0A++++public+static+Book+last+%3D+null%3B%0A%0A++++public+Book(String+name)+%7B%0A++++++++title+%3D+name%3B%0A++++++++last+%3D+this%3B%0A++++++++library+%3D+null%3B%0A++++%7D%0A%0A++++public+static+String+lastBookTitle()+%7B%0A++++++++return+last.title%3B%0A++++%7D%0A++++public+String+getTitle()+%7B%0A++++++++return+title%3B%0A++++%7D%0A%7D%0A%0Aclass+Library+%7B%0A++++public+Book%5B%5D+books%3B%0A++++public+int+index%3B%0A++++public+static+int+totalBooks+%3D+0%3B%0A%0A++++public+Library(int+size)+%7B%0A++++++++books+%3D+new+Book%5Bsize%5D%3B%0A++++++++index+%3D+0%3B%0A++++%7D%0A%0A++++public+void+addBook(Book+book)+%7B%0A++++++++books%5Bindex%5D+%3D+book%3B%0A++++++++index%2B%2B%3B%0A++++++++totalBooks%2B%2B%3B%0A++++++++book.library+%3D+this%3B%0A++++%7D%0A%7D%0A%0Apublic+class+Main+%7B%0A++++public+static+void+main(String%5B%5D+args)+%7B%0A++++++++System.out.println(Library.totalBooks)%3B%0A%0A++++++++Book+goneGirl+%3D+new+Book(%22Gone+Girl%22)%3B%0A++++++++Book+fightClub+%3D+new+Book(%22Fight+Club%22)%3B%0A%0A++++++++System.out.println(goneGirl.title)%3B+++++++++++++++++++++%0A++++++++System.out.println(Book.lastBookTitle())%3B+++++++++++++++%0A++++++++System.out.println(fightClub.lastBookTitle())%3B+++++++++%0A++++++++System.out.println(goneGirl.last.title)%3B+++++++++++++++%0A%0A++++++++Library+libraryA+%3D+new+Library(1)%3B%0A++++++++Library+libraryB+%3D+new+Library(2)%3B%0A++++++++libraryA.addBook(goneGirl)%3B%0A%0A++++++++System.out.println(libraryA.index)%3B+++++++++++++++++++++%0A++++++++System.out.println(libraryA.totalBooks)%3B++++++++++++++++%0A%0A++++++++libraryA.totalBooks+%3D+0%3B%0A++++++++libraryB.addBook(fightClub)%3B%0A++++++++libraryB.addBook(goneGirl)%3B%0A%0A++++++++System.out.println(libraryB.index)%3B+++++++++++++++++++++%0A++++++++System.out.println(Library.totalBooks)%3B+++++++++++++++++%0A++++++++System.out.println(goneGirl.library.books%5B0%5D.title)%3B%0A++++%7D%0A%7D&mode=display&curInstr=0)

```java
public class Main {
    public static void main(String[] args) {
        System.out.println(Library.totalBooks); // 0
        System.out.println(Book.lastBookTitle()); // 错误，空指针异常（NullPointerException）
        System.out.println(Book.getTitle()); // 错误，无法编译
        
        Book goneGirl = new Book("Gone Girl");
        Book fightClub = new Book("Fight Club");
        
        System.out.println(goneGirl.title); // Gone Girl
        System.out.println(Book.lastBookTitle()); // Fight Club
        System.out.println(fightClub.lastBookTitle()); // Fight Club
        System.out.println(goneGirl.last.title); // Fight Club
        
        Library libraryA = new Library(1);
        Library libraryB = new Library(2);
        libraryA.addBook(goneGirl);
        
        System.out.println(libraryA.index); // 1
        System.out.println(libraryA.totalBooks); // 1
        
        libraryA.totalBooks = 0;
        libraryB.addBook(fightClub);
        libraryB.addBook(goneGirl);
        
        System.out.println(libraryB.index); // 2
        System.out.println(Library.totalBooks); // 2
        System.out.println(goneGirl.library.books[0].title); // Fight Club
    }
}
```
