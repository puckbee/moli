# 作业工作流程

作者：Ethan Ordentlich

## 作业工作流程

本指南描述了如何在CS 61B课程中设置作业。

## 获取框架代码

本指南的视频演示可在[此链接](https://www.youtube.com/watch?v=tABtNcN5y0A)获取。

`skeleton`远程仓库包含所有作业的框架代码。每当发布新作业，或者我们需要更新作业时，你将从skeleton仓库拉取代码。首先确保你位于`sp25-s***`仓库目录中，然后：

```
git pull skeleton main
```

这会从名为`skeleton`的仓库（位于`https://github.com/Berkeley-CS61B/skeleton-sp25.git`）获取所有远程文件，并将它们复制到你当前的文件夹中。

> 如果你收到类似于`fatal: refusing to merge unrelated histories`的错误，你可以每次使用以下命令解决：
>
> ```
> git pull --no-rebase --allow-unrelated-histories skeleton main
> ```

（如果你正在完成实验1，此时请返回实验说明。）

## 在IntelliJ中打开

以下说明适用于 **每个** 作业。**每次从`skeleton`拉取新的实验或项目文件后，你都需要再次执行以下步骤。**

1. 启动IntelliJ。**如果没有打开任何项目**，点击"Open"按钮。如果当前已打开一个项目，导航至 **"File –> Open"** 。

2. 找到并选择当前作业的目录。例如，对于实验1，你会选择`sp25-s***`仓库内的`lab01`目录。

3. 导航到 **"File -> Project Structure" 菜单，确保你在 Project** 选项卡中。将你的项目SDK设置为已安装的Java版本。如果下拉列表中没有17或更高版本，请确保你已完全下载并安装了Java。

   ![select-jdk](https://sp25.datastructur.es/resources/guides/assignment-workflow/img/select_jdk.png)

4. 仍在 **Project** 选项卡中，将Project Language Level设置为"17 - Sealed types, always-strict floating-point semantics"。

   此时，Project选项卡应该看起来像这样：

   ![project](https://sp25.datastructur.es/resources/guides/assignment-workflow/img/project_structure_settings.png)

   - SDK设置为Java 17或更高版本
   - 语言级别至少为17，且不超过SDK版本
   - 编译器输出已填写，并设置为作业目录，后跟`out`

5. 仍在Project Structure中，转到 **Libraries** 选项卡。点击" **+ -> Java** "按钮，然后导航到`library-sp25`，选择该文件夹，并点击"Ok"。

   ![select-libraries](https://sp25.datastructur.es/resources/guides/assignment-workflow/img/select_libraries.png)

6. 点击"Ok"应用你的设置并离开Project Structure。

此时，如果一切配置正确：

- 每个Java文件名旁边应该有一个蓝色圆圈。
- 当你打开任何文件时，代码中不应有任何红色高亮部分。

<!-- 
## 提交到Gradescope

1. 使用`git add`添加你的作业目录。例如，对于实验1，从你的仓库根目录（`sp25-***`）你可以使用`git add lab01`。从作业目录中，你可以使用`git add .`。
2. 使用`git commit -m "<提交消息>"`提交文件。提交消息是必需的。例如，`git commit -m "完成实验1"`。
3. 使用`git push origin main`将你的代码推送到远程仓库。
4. 在Gradescope上打开作业。选择Github，然后选择你的`sp25-s***`仓库和`main`分支，然后提交你的作业。你将收到一封确认邮件，自动评分器将自动运行。

Gradescope将使用Github上最新版本的代码。**如果你认为Gradescope没有评分正确的代码，请检查你是否已经添加、提交和推送，可以使用`git status`查看。**

如果由于某种原因你无法推送，请参阅[Git WTFS](https://sp25.datastructur.es/resources/guides/git/wtfs/)。 -->
