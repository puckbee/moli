<div style="display: flex; justify-content: space-between;">
    <figure>
        <img src="images/xv6_img1.png" alt="Robert Morris" width="90%">
        <figcaption>Robert Morris</figcaption>
    </figure>

    <figure>
        <img src="images/xv6_img2.png" alt="Frans Kaashoek" width="98%">
        <figcaption>Frans Kaashoek</figcaption>
    </figure>
</div>

# 课程介绍

MIT6.S081 是 MIT 面向本科生的一门操作系统课程。作为一门极佳的操作系统入门课程，非常适合 **没有接触过操作系统** 、 **对操作系统基本概念理解不深** 或 **已经掌握了基础概念但缺乏实践** 的学生学习。

课程由 Frans Kaashoek 教授和 Robert Morris 教授进行授课。Frans Kaashoek 教授是 MIT PDOS 组的负责人，Robert Morris 教授是著名的“莫里斯蠕虫”创造者。不同于其他“放 PPT 念 PPT”式的讲课方式，MIT6.S081 由教授手写板书 + 阅读源码的方式进行，带领学生通过源码去理解操作系统的众多机制与实现细节。这种方式不仅可以让学生对知识点的理解更加深刻，还可以提升学生的代码阅读与实践能力，防止空讲理论纸上谈兵。

由于现代主流操作系统（如：Linux，FreeBSD）的代码量已经十分巨大了，对于初学者来说通过这样的庞然大物学习起来非常困难。为此 MIT 的教授们专门开发了一个教学式的操作系统 xv6。该系统受 UNIX version 6 启发，一共不到 8000 行的 C 代码，实现了进程管理，POSIX 系统调用，内存管理，并发控制，文件系统等诸多核心功能，是一个完整的操作系统。而且源码中拥有非常详尽的注释，非常适合初学者进行学习。

# 课程实验

本课程的 lab 是完全公开的，包含 **系统调用实现** 、 **页面访问探测** ， **写时复制** 等实验。通过完成课程相应的 lab，并对 xv6 操作系统进行改进与机制添加，可以更加全面而深刻的理解操作系统的核心概念，并大幅提升动手实践能力。所有 lab 都提供有完善的本地测试。

* lab&nbsp;&nbsp;&nbsp;&thinsp;: 公开  
* 测试&nbsp;: 公开

# 先修知识

* 计算机体系结构基础（推荐：CS61C 课程）

# 编程语言

* C 语言（推荐:《C 程序设计语言》）

# 课程资源

* 课程网站：[https://pdos.csail.mit.edu/6.S081/2021/index.html](https://pdos.csail.mit.edu/6.S081/2021/index.html)
* 原版视频：[https://www.youtube.com/watch?v=L6YqHxYHa7A](https://www.youtube.com/watch?v=L6YqHxYHa7A)
* 中文字幕：[https://www.bilibili.com/video/BV166421f7D6/?spm_id_from=333.337.search-card.all.click&vd_source=79c6ce1ec30b05ff9d95e246312064d3](https://www.bilibili.com/video/BV166421f7D6/?spm_id_from=333.337.search-card.all.click&vd_source=79c6ce1ec30b05ff9d95e246312064d3)
* 课程教材：[https://pdos.csail.mit.edu/6.S081/2021/xv6/book-riscv-rev2.pdf](https://pdos.csail.mit.edu/6.S081/2021/xv6/book-riscv-rev2.pdf)
* 中文翻译：[https://github.com/pleasewhy/xv6-book-2020-Chinese](https://github.com/pleasewhy/xv6-book-2020-Chinese)
