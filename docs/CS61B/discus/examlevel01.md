# CS 61B 作用域、值传递、静态
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

( a ) 判断正误,对于下面的每个修改，如果我们只进行该修改，Library和Book类的代码是否会编译或报错，即每个修改独立对待。

1. 将totalBooks变量改为非静态
2. 将lastBookTitle方法改为非静态
3. 将addBook方法改为静态
4. 将last变量改为非静态
5. 将library变量改为静态

( b ) 使用原始的Book和Library类（即，不包含部分a中的修改），写出下面main方法的输出。如果某行出错，请写出错误的确切原因并继续执行。

```java
public class Main {
    public static void main(String[] args) {
        System.out.println(Library.totalBooks); _____________________
        System.out.println(Book.lastBookTitle()); _____________________
        System.out.println(Book.getTitle()); _____________________
        
        Book goneGirl = new Book("Gone Girl");
        Book fightClub = new Book("Fight Club");
        
        System.out.println(goneGirl.title); _____________________
        System.out.println(Book.lastBookTitle()); _____________________
        System.out.println(fightClub.lastBookTitle()); _____________________
        System.out.println(goneGirl.last.title); _____________________
        
        Library libraryA = new Library(1);
        Library libraryB = new Library(2);
        libraryA.addBook(goneGirl);
        
        System.out.println(libraryA.index); _____________________
        System.out.println(libraryA.totalBooks); _____________________
        
        libraryA.totalBooks = 0;
        libraryB.addBook(fightClub);
        libraryB.addBook(goneGirl);
        
        System.out.println(libraryB.index); _____________________
        System.out.println(Library.totalBooks); _____________________
        System.out.println(goneGirl.library.books[0].title); _____________________
    }
}
```
