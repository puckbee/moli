# Lab 0: 课程介绍与环境配置

!!! info "MOLI：本次实验你将会学到什么"
    * Git 基本用法
    * SSH 基本用法
    * Vim, 基础命令行（CLI）操作

你好！欢迎来到 CS61C！我们非常欢迎你的加入 :D

请注意聆听，接下来我们将为你演示本次“航班”的安全须知。
本次实验可能稍微有点长，但请你认真阅读；它包含了许多重要内容，将为你接下来的学习打下坚实基础！

> Lab 0的大部分内容主要面向UC Berkeley在校生，MOLI 学员可以选择性阅读（Git, Vim, SSH相关的部分仍然值得学习）。  

## 练习1：访问课程服务平台  

<details>
<summary>点击展开 / 折叠</summary>

<p>不幸的是，本课程的注册确实需要进行一些（可能有点无聊的）前期设置。在学期正式开始前，让我们先把这些准备工作搞定。以下是一个清单：</p>

<ol>
  <li><strong>Ed</strong>：确认你加入了61C的Ed课程。Ed将是我们主要的交流方式。</li>
  <li><strong>Gradescope</strong>：确认你在Gradescope上加入了61C课程</li>
  <li><strong>PrairieLearn</strong>：访问PrairieLearn。单击<code>Add or remove courses</code>按钮，然后注册CS61C 2025 春季课程</li>
  <li><strong>OH Queue</strong>：访问61C的OH(Office Hours) Queue。确认你可以登录。</li>
  <li><strong>Youtube</strong>：确认你可以观看此私有测试Youtube视频。</li>
  <li><strong>Zoom</strong>：下载Zoom。单击<code>Sign In with SSO</code>，根据提示输入<code>berkeley</code>，然后根据提示登录。</li>
</ol>

<h3>访问Gradar</h3>
<ol>
  <li>前往Gradar并使用你的伯克利 Google 账户登录。</li>
  <li>在主屏幕上，确认可以看到<code>CS 61C Spring 2025</code>课程。</li>
  <li>在右上角单击你的姓名，然后单击<code>Profile</code>。</li>
  <li>在<code>GitHub: Login</code>下，单击<code>Link Account</code>，然后使用要用于61C的GitHub账户登录。</li>
</ol>

<h3>注：校园VPN</h3>
<p>如果由于互联网访问限制而无法访问任何服务或资源，可以使用伯克利校园 VPN（稍后将在本实验室中安装）。</p>

</details>


## 练习2：安装软件
以下小节包含针对特定 OS（操作系统）的说明。请遵循针对你的特定操作系统的说明；针对错误操作系统的命令可能会破坏你的操作系统！

### Ubuntu Linux
Ubuntu 18.04+ 的默认 APT 软件源中包含所需的程序。以下命令将自动安装它们：
```bash
$ sudo apt update
$ sudo apt install curl git openjdk-17-jre openssh-client python3 python3-pip
```
任何终端和任何现代网络浏览器都能满足 61C 的要求。

### macOS
1.  打开 `终端` 应用程序。 
2.  安装 Xcode Command Line Tools。    
    ```zsh
    $ xcode-select --install
    ```
3.  检查你的Java版本：
    ```zsh  
    $ java -version  
    ```  
4.  如果尚未安装 Java 16 或更高版本，请下载并安装 [Adoptium OpenJDK 17](https://adoptium.net/zh-CN/temurin/releases/)。  
    * 我们推荐使用 .pkg 安装程序。  
    * 如果你使用的是 Apple Silicon CPU（M系列），则需要安装 aarch64 版本。否则，你可能使用的是英特尔/AMD CPU，需要安装 x64 版本。  
5.  检查你的 Python 版本：
    ```zsh
    $ python3 --version
    ```  
6.  如果尚未安装 Python 3.6 或更高版本，请下载并安装 Python 3。   
7.  检查你的Python安装是否具有有效的SSL证书：
    ```zsh
    $ python3 -c 'import urllib.request; urllib.request.urlopen("https://inst.eecs.berkeley.edu")'
    ```
    * 如果没有打印出任何内容，说明安装没有问题。
    * 如果证书出错（如`certificate verify failed: unable to get local issuer certificate`），请重新创建证书。  

        1. 在"访达"中，打开"应用程序"文件夹
        2. 打开 Python 安装文件夹（例如 `Python 3.11`）
        3. 运行 `Install Certificates.command` 程序(右键单击 => 打开)
        4. 关闭现有终端窗口，打开新终端
        5. 再次运行 `python3` SSL检查命令

### Windows
1.  下载并安装 Git Bash。
    * 如果安装程序提示，请选择 `"Use Windows' default console window"` 选项，而不是 `"Use MinTTY"` 选项。
2.  打开 Git Bash 终端(开始菜单 => Git Bash)。
    * 对于61C，请使用 Git Bash 而不是 `cmd.exe` 或 Powershell
3.  检查你的Java版本：
    ```bash
    $ java -version
    ```
4.  如果尚未安装Java 16或更高版本，请下载并安装 [Adoptium OpenJDK 17 或 21](https://adoptium.net/zh-CN/temurin/releases/)
    * 我们推荐使用 `.msi` 安装程序。
5.  检查你的Python版本：
    ```bash
    $ python3 --version
    ```
    如果它启动了 Microsoft 商店，则Python可能未安装。
6.  如果尚未安装 Python 3.6 或更高版本，请[下载并安装 Python3](https://www.python.org/downloads/)。    

### 其他操作系统
如果你使用的是其他 Linux 发行版（Alpine/Arch/Asahi/Debian/Fedora/NixOS/等），我们的大多数程序在有依赖关系的情况下都可以正常运行，但我们没有资源在 Ubuntu 之外的发行版上进行测试。如果你遇到问题，可以尝试联系 Ed 或访问 OH，但请注意我们的员工在这方面经验有限。

> 当然，你也可以在MOLI交流群中寻找是否有使用相同环境的同学😎

如果你使用 *BSD、HaikuOS、TempleOS、ToaruOS 或其他平台，很遗憾我们没有资源支持这些平台。如果程序无法运行，你可以使用教学电脑（或其他支持的平台）。

## 练习3： 教学账户和服务器（Hive Machine!）

> 此小节同样面向 Berkeley 在校生，MOLI 学员可以跳过。  

<details>
<summary>点击展开 / 折叠</summary>

<p>你将使用 Hive machine 作为课程作业的教学服务器。你可以使用 SSH（安全登录协议）连接到这些机器。让我们来设置一下！</p>

<blockquote>
Hive machine 是Berkeley EECS提供的一个专用的教学与研究集群。
</blockquote>

<p>你可以使用 Hivemind 来检查每台 Hive machine 是否繁忙或离线。请注意，Hivemind 会显示不以 hive 开头的机器；这些机器无法使用 61C。</p>

<h3>校园VPN设置</h3>
<p>按照<a href="https://security.berkeley.edu/services/bsecure/bsecure-remote-access-vpn">此处</a>的说明安装和设置 bSecure Remote Access VPN。确保安装过程中没有错误。从现在起，我们将把此 VPN 称为 "校园 VPN"。</p>
<p>在本实验的剩余时间内，请保持与校园 VPN 的连接。</p>

<p>这是我们使用此系统的首个学期，所以如果你遇到任何问题，请在 Lab 0 Ed 帖子中跟进或在 Ed 上提出私人问题。</p>

<h3>教学账户设置</h3>
<ol>
<li>
<p>在 WebAccount 上注册 <code>cs61c</code> 教学账户。</p>
<ul>
<li>在接下来的练习中，你需要输入密码。</li>
<li>注册/候补注册后可能需要一两天时间才能创建账户。</li>
<li>如果你是待录取的同期入学学生，或者填写了 "计划稍后入学 "表格，我们将为你申请账户，你应能在提交申请或表格后 5 天内创建账户。</li>
</ul>
</li>
<li>
<p>尝试通过 SSH 连接到 Hive machine（确保已连接到校园 VPN）：</p>
<pre><code>$ ssh cs61c-???@hive2.cs.berkeley.edu
</code></pre>
<p>请记住将 cs61c-??? 替换为你的教学账户用户名。输入密码时，不会出现任何提示；这对许多终端程序来说都是正常的。</p>
<ul>
<li>如果出现 <code>Permission denied, please try again</code> ，请检查输入的用户名/密码是否正确。如果密码是复制粘贴的，请尝试手动输入。</li>
<li>如果出现 <code>Connection timeout</code> 或其他连接错误，请确保你不是在 CalVisitor 或其他阻止 SSH 的网络上，并确保你已连接到校园 VPN。</li>
<li>如果你收到 <code>Connection refused</code> 或 <code>Connection timeout</code> 或其他连接错误，机器可能暂时宕机或拒绝连接。请尝试使用其他 hive 机器（例如，将 hive2 替换为 hive3 ）。</li>
</ul>
</li>
<li>
<p>连接成功后，系统可能会提示你输入一些信息，包括姓名和电子邮件，如果没有，请跳至下一步。</p>
<ul>
<li>请输入你的Berkeley电子邮件。</li>
<li>请仔细检查你的电子邮件、SID 和姓名的拼写。</li>
</ul>
</li>
<li>
<p>输入你的信息后，为了确保你的信息正确无误，运行：</p>
<pre><code>$ check-register
</code></pre>
<p>如果发生错误，运行：</p>
<pre><code>$ re-register
</code></pre>
</li>
<li>
<p>连接成功后，请检查是否出现类似的红黄色提示：</p>
<pre>
(<font color="#ae543d"> 00:00:00 Thu Nov 30 2434 </font> <font color="#b5b744">cs61c-lol@hive42 Linux x86_64 </font>)
</pre>
<p>如果提示是白色，请运行：</p>
<pre><code>$ /home/ff/cs61c/bin/fix-dotfiles && exit
</code></pre>
<p>然后再从第2步开始。</p>
</li>
<li>
<p>运行 <code>exit</code> 退出 SSH 会话。</p>
</li>
</ol>

<h3>使用快捷方式连接 Hive machines</h3>
<p>我们可以配置 SSH 主机别名，这样就可以使用 <code>ssh hive#</code> 代替 <code>ssh cs61c-???@hive#.cs.berkeley.edu</code></p>
<p>本节还将介绍基于终端的文本编辑器 Vim。</p>

<ol>
<li>打开一个新的终端窗口。</li>
<li>创建 <code>~/.ssh</code> 文件夹：
<pre><code>$ mkdir -p ~/.ssh
</code></pre>
</li>
<li>在 Vim 中打开 <code>~/.ssh/config</code>：
<pre><code>$ vim ~/.ssh/config
</code></pre>
</li>
<li>按下 <kbd>i</kbd> 进入插入模式，左下方应出现 <code>-- INSERT --</code>。</li>
<li>如果你看到下面两行在一起，它们来自61B。如果不再需要它们，请使用箭头键和退格键删除他们。
<pre><code>Host *.cs.berkeley.edu *.eecs.berkeley.edu
IdentityFile ~/.ssh/cs61b_id_rsa
</code></pre>
<p>如果你仍然需要使用 61B 设置，请联系 61C 课程的工作人员。</p>
</li>
<li>将以下文本复制到文件中：
<pre><code>
# Begin CS61C hive machine config v2.0.3
Host s330-? s330-?? hive? hive??
    HostName %h.cs.berkeley.edu
Match Host *.cs.berkeley.edu,*.eecs.berkeley.edu
    Port 22
    User cs61c-???
    ServerAliveInterval 60
# End CS61C hive machine config v2.0.3
</code></pre>
<p>记住将 <code>cs61c-???</code> 替换为你的教学账户用户名。 <code>Host s330-? s330-?? hive? hive??</code> 中的问号保持不变。</p>
</li>
<li>按下 <kbd>Esc</kbd> 退出插入模式，<code>-- INSERT --</code> 应消失。</li>
<li>输入 <code>:w</code> ,然后按下 <kbd>Enter</kbd> 保存文件。</li>
<li>退出 Vim，键入 <code>:q</code> ，然后按下 <kbd>Enter</kbd>。</li>
<li>现在就尝试通过 SSH 连接到 Hive machine。
<pre><code>$ ssh hive7
</code></pre>
</li>
<li>运行 <code>Exit</code> 退出 SSH 会话。</li>
</ol>
<p>以后（完成本练习后），你可以运行 <code>ssh hive#</code> 连接到 Hive machine。 从 hive1 到 hive30 共有30台 Hive machine。使用哪一台并不重要，因为所有Hive machine都共享相同的文件。</p>

<h3>在不输入密码的情况下连接Hive machine</h3>

<ol>
<li>打开一个新的终端窗口。</li>
<li>运行以下命令，它将打印出你拥有的 SSH 密钥，如果没有，会生成一个新的。
<pre><code>
$ curl -sS https://raw.githubusercontent.com/61c-teach/sp25-lab-starter/main/lab00/get-ssh-key.sh | bash
</code></pre>
<p>记下 SSH 密钥的位置，稍后将在实验室中使用。</p>
</li>
<li>将你的公钥复制到你的教学账户：
<pre><code>
$ ssh-copy-id hive3
</code></pre>
</li>
<li>现在就尝试通过 SSH 连接到Hive machine：
<pre><code>
$ ssh hive5
</code></pre>
</li>
<li>运行 <code>exit</code> 退出 SSH 会话。</li>
</ol>

<p>如果你读得累了，不妨休息一会儿；有人想玩<a href="https://www.xarg.org/project/html5-snake/">贪吃蛇</a>吗？</p>

</details>

## 练习4：GitHub 设置

### 配置你的本地机器

配置本地用户账户，使用 SSH 密钥验证 GitHub。

1. 打开一个新的终端窗口。

2. 打印公钥（确保将 `path_to_ssh_key` 替换为上面打印出的位置，并添加 `.pub` 后缀）：
    ```bash
    $ cat path_to_ssh_key.pub
    ```
    > 这里提到的 **上面打印出的位置** 使用的是 Berkeley 在校生连接 Hive 服务器的同个公钥，你可以自己 STFW 如何创建一个SSH密钥。

    打印出的内容格式应该如下所示(长度可能不同)：
    ```
    ssh-ed25519 AAAAC3NzaC1lZDI1N6jpH3Bnbebi7Xz7wMr20LxZCKi3U8UQTE5AAAAIBTc2HwlbOi8T some_comment_here
    ```

3. 在浏览器中，转到 GitHub => 设置 => SSH 和 GPG 密钥 => 新 SSH 密钥，然后添加公钥。
    
    * （可选）将 Title 设置为可以帮助你记住此密钥在你的本地账户的名称（如 CS61C Laptop）

4. 尝试用 SSH 连接到 GitHub：
    ```bash
    $ ssh -T git@github.com
    ```

    如果一切顺利，你应该会看到类似的内容：
    ```
    Hi USERNAME! You've successfully authenticated, but GitHub does not provide shell access.
    ```

5. 今后，在克隆需要身份验证的 repo 时（例如接下来要创建的私有实验室 repo），不要使用 HTTPS repo URL（如 `https://github.com/USERNAME/REPO_NAME.git` ），而应使用 SSH repo URL（如 `git@github.com:USERNAME/REPO_NAME.git` ）。例如，在 `https://github.com/61c-student/sp25-lab-ghost.git` 中，名为 `sp25-lab-ghost` 的 repo 位于 `61c-student` 用户/组织之下，因此 SSH 克隆 URL 应为 `git@github.com:61c-student/sp25-lab-ghost.git` 。

### 配置教学账户

> 此处亦可以跳过，原因同上。

<details>
<summary>点击展开 / 折叠</summary>

让我们配置你的教学账户，使用 SSH 密钥验证 GitHub。<br><br>

1. 打开一个新的终端窗口。<br><br>

2. 通过 SSH 连接到 Hive machine:<br>
<pre><code>$ ssh hive11
</code></pre>
你应该会再一次看到红黄相间的提示。<br><br>

3. 运行以下命令，它将打印出你拥有的任何 SSH 密钥，如果没有，则生成一个新的：<br>
<pre><code>$ curl -sS https://raw.githubusercontent.com/61c-teach/sp25-lab-starter/main/lab00/get-ssh-key.sh | bash
</code></pre>
记下 SSH 密钥的位置，稍后将在实验室中使用。<br><br>

4. 打印公钥（确保将 <code>path_to_ssh_key</code> 替换为上面打印出的位置，并添加 .pub 后缀）：<br>
<pre><code>$ cat path_to_ssh_key.pub
</code></pre>
打印出的内容格式应该如下所示(长度可能不同)：<br>
<pre><code>ssh-ed25519 AAAAC3NzaC1lZDI1N6jpH3Bnbebi7Xz7wMr20LxZCKi3U8UQTE5AAAAIBTc2HwlbOi8T your_email@example.com
</code></pre>
<br>

5. 在浏览器中，转到 GitHub =&gt; 设置 =&gt; SSH 和 GPG 密钥 =&gt; 新 SSH 密钥，然后添加公钥。<br>
* 将 Title 设置为可以帮助你记住此密钥在你的教学账户中的名称（如 CS61C Hive）。<br><br>

6. 尝试用 SSH 连接到 GitHub：<br>
<pre><code>$ ssh -T git@github.com
</code></pre>
如果一切顺利，你应该会看到类似的内容：<br>
<pre><code>Hi USERNAME! You've successfully authenticated, but GitHub does not provide shell access.
</code></pre>
<br>

7. 运行 <code>exit</code> 退出 SSH 会话。<br>

</details>

## 练习 5: 试试看 Git

在本练习中，你将获取用于实验课的 Git 仓库（"repo"），并使用各种 Git 命令。

本练习的说明假设你使用 Vim 来编辑文本文件。如需 Vim 快速入门指南，请查阅[附录的 Vim 基础部分](https://cs61c.org/sp25/labs/lab00/#vim-basics)。

<!-- 此处附录连接在完成附录汉化后应该替换为MOLI连接 -->

如果你想使用其他文本编辑器，当然可以。但是，助教将无法为除 Vim 以外的编辑器提供支持。一些例子：

* **Nano:** 简单且比 Vim 对初学者更友好。它在界面底部提供了一个有用的命令列表（^ 表示 Ctrl 键）。随许多 UNIX 发行版（例如 macOS, Ubuntu Linux）一同提供。使用 `nano file.txt` 打开。
* **[Visual Studio Code (VSCode)](https://code.visualstudio.com/):** 花哨的图形化文本编辑器。它有一些非常有用的扩展，包括 [Remote SSH 扩展](https://code.visualstudio.com/docs/remote/ssh)，允许你在 VSCode 而不是其他基于终端的编辑器上通过 SSH 编辑文件。但是，过去有些学生遇到过复杂的设置问题。

> Lab 讲义中提到的"助教"为 Berkeley 校内的课程助教（TA），但MOLI的助教们**可能**掌握多种编辑器，欢迎交流。

在继续 Lab 1 之前，请确保你能够熟练地使用你选择的文本编辑器在 Hive 上编辑你的文件。

### 获取你的实验报告

访问 [Gradar](https://gradar.cs61c.org/) ，开始名为 Labs 的作业，并创建一个仓库。这将是你整个学期所有实验室作业的个人仓库。

### 配置 Git

在开始之前，先告诉 Git 你是谁。这些信息将用来签署和记录你的提交。如果你以前安装过 Git，可能不需要在本地机器上做这些，但你需要在你的教学账户上做一遍。

在本地计算机上，告诉 Git 你的姓名和电子邮件地址：

```bash
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
```

以 SSH 方式连接到 Hive ，并在指导账户上运行相同的命令。

### Clone 你的仓库

Git 有 "本地 "和 "远程 "仓库的概念。本地仓库位于你的终端会话所在的位置；如果是在 SSH 会话中，本地仓库就是 Hive 上的一个文件夹；如果终端会话是在本地机器上，本地仓库就位于本地机器的文件系统中。远程版本库（如 GitHub 版本库）通常托管在互联网上。

你在 GitHub 上有一个实验仓库，但不在本地（如果某个网站可以自动访问你的本地文件，那就有点可怕了）。要获取此仓库的本地副本，你可以使用 git clone ，它会根据远程仓库的信息创建一个本地仓库。

通过 SSH 连接到 Hive。在 Hive 上，将仓库克隆到名为 labs 的文件夹中：
```bash
$ git clone git@github.com:61c-student/sp25-lab-USERNAME.git labs
```

请记住将 `sp25-lab-USERNAME` 替换为你的实际仓库名称！

### 探索你的仓库：Git

`cd` 进入这个新文件夹。 列出所有隐藏文件 (`ls -a`)。 你看到隐藏文件/文件夹了吗？

确实有一个名为 `.git` 的文件夹。它的存在表明当前文件夹（包含 `.git` 的文件夹）包含一个 Git 存储库。

查看你的仓库当前的远程仓库和状态：
```bash
$ git remote -v
$ git status
```

`git clone` 在这里已经发挥了一点魔力——有一个名为 `origin` 的远程仓库，它的 URL 指向你在 GitHub 上的 labs 仓库！你现在位于一个名为 `main` 的本地分支上，它正在“跟踪” `origin/main` （即 `origin` 远程仓库上的 `main` 分支）。

> 注意 ：GitHub 现在使用 `main` 作为默认分支名称，而不是 `master`

在整个学期中，课程工作人员可能会更新起始代码，以修复错误或发布新的实验。要接收这些更新，你需要添加另一个远程服务器。
```bash
$ git remote add starter https://github.com/61c-teach/sp25-lab-starter.git
```

> 注意 ：我们的启动存储库是公开的，你没有对它们的写权限，因此在这种情况下你实际上应该使用未经身份验证的 HTTPS 链接克隆 URL！

如果你想要获取**更新的**启动代码，请执行以下命令：
```bash
$ git pull starter main
```

现在就试试吧！由于你才刚刚开始实验，所以可能还没有任何更新可以拉取。

### 探索你的仓库：文件
你的实验室 repo 结构如下所示：
<style>
  .file-tree {
    background-color: #000;
    color: #fff;
    font-family: "Courier New", Courier, monospace;
    padding: 12px 20px;
    border-radius: 6px;
    line-height: 1.5;
    max-width: 400px;
  }
  .file-tree ul {
    list-style-type: none;
    padding-left: 20px;
    margin: 4px 0;
  }
  .file-tree li {
    margin: 3px 0;
  }
  .dir {
    color: #6ec1ff; /* 浅蓝色，高亮目录名 */
    font-weight: 600;
  }
  .file {
  }
</style>

<div class="file-tree">
  <ul>
    <li><span class="dir">labs/ (current directory)</span>
      <ul>
        <li><span class="dir">lab00/</span>
          <ul>
            <li><span class="file">code.py</span></li>
            <li><span class="file">gen-debug.sh</span></li>
            <li><span class="file">get-ssh-key.sh</span></li>
            <li><span class="file">init.sh</span></li>
          </ul>
        </li>
        <li><span class="dir">tools/</span>
          <ul>
            <li><span class="file">download_tools.sh</span></li>
          </ul>
        </li>
        <li><span class="file">README.md</span></li>
      </ul>
    </li>
  </ul>
</div>

从 `labs` 仓库开始，运行 `ls` 。输出应如下所示：
```bash
~/labs $ ls
lab00  README.md  tools
```

现在，`cd` 进入 `lab00` 文件夹，然后列出其中的文件。输出应该如下所示：
```bash
~/labs/lab00 $ ls
code.py  gen-debug.sh  get-ssh-key.sh  init.sh
```

在路径中， `.` 本身指的是当前目录。以下命令都将列出 `lab00` 文件夹中的文件：
```bash
~/labs/lab00 $ ls
~/labs/lab00 $ ls .
~/labs/lab00 $ ls ./././.
```

如何返回到整个 `labs` 文件夹？在路径中， `..` 指的是父文件夹。
```bash
~/labs/lab00 $ ls ..
lab00   tools
~/labs/lab00 $ ls ../..
<你的 home 文件夹下的一些内容，可能是许多文件>
~/labs/lab00 $ cd ..
~/labs $ ls
lab00   tools
```

以下命令序列将列出 `lab00` 中的所有文件：
```bash
~/labs $ cd lab00
~/labs/lab00 $ ls
```

```bash
~/labs $ ls lab00
```

```bash
~/labs $ cd tools
~/labs/tools $ ls ../lab00
```

```bash
~/labs $ cd lab00
~/labs/lab00 $ ls ../lab00/../lab00/../lab00
```

尝试做一些实验吧！

### “Fizzing and Buzzing”

如果你已开始做其他实验，请确保在开始本练习之前将你的作业复制到其他地方，因为你的作业可能会在本练习中被覆盖。

1. `cd` 进入你的仓库中的 `lab00` 文件夹，并查看其中的文件（ `ls` ）。然后运行以下命令初始化实验室：
```bash
$ bash init.sh
```

确保没有输出任何错误。

2. 使用 Vim 打开 `code.py` 并查看 `fizzbuzz(num)` 函数。它应该：

    * 如果 num 是 3 的倍数，则打印 `"num: fizz"`

    * 如果 num 是 5 的倍数，则打印 `"num: buzz"`

    * 如果 num 是 3 和 5 的倍数，则打印 `"num: fizzbuzz"`

    * 如果数字不是 3 或 5 的倍数，则不打印任何内容

但是，如果你运行程序 ( `python3 code.py` )，似乎不会出现这种情况！尝试仅编辑 `if` 语句来修复此错误。修复代码后，使用 `git add` 和 `git commit` 保存、添加并提交你的工作。

在许多环境中， `git commit` 会打开 Vim 来编辑提交信息。如果你不清楚如何使用它，请查看[附录中的 Vim 基础部分](https://cs61c.org/sp25/labs/lab00/#vim-basics) 。

3. 提交（commit）修复后，push 你的工作。

    或者至少，尝试 push 一次你的工作。你应该会遇到一个错误：
    ```
     ! [rejected]        main -> main (non-fast-forward)
    error: failed to push some refs to 'github.com:61c-student/sp25-lab-username.git'
    hint: Updates were rejected because the tip of your current branch is behind
    hint: its remote counterpart. Integrate the remote changes (e.g.
    hint: 'git pull ...') before pushing again.
    hint: See the 'Note about fast-forwards' in 'git push --help' for details.
    ```

    如果你没有遇到错误，请尝试从步骤 1 重新开始，或者如果错误持续发生，请联系课程工作人员。

    整个学期，你可能会遇到很多奇怪的错误。把它们分解成小块，看看能不能找出每个块的含义，这会对你很有帮助。举个例子，我们来分解一下：

    * `"failed to push some refs to REPO_URL"` ：推送失败

    * `"the tip of your current branch is behind its remote counterpart"` ：远程版本库（GitHub 上）有你本地版本库没有的 commit 内容

    * `"Integrate the remote changes (e.g. 'git pull ...') before pushing again"` ：我们需要告诉 Git 如何整合神秘的 commit 们

    请尝试使用 `git pull` 拉取远程更改。

    * 如果出现 `"fatal: Need to specify how to reconcile divergent branches."` ，运行 `git config --global pull.rebase false` ，然后再次尝试 pull 一次 

    * 如果显示 `"fatal: Not possible to fast-forward, aborting"` ，请尝试 `git pull --ff`

    * 如果显示 `"fatal: Need to specify how to reconcile diverent branches"` ，请尝试 `git pull --ff`

    如果一切顺利，你应该会遇到另一个错误：

    ```
    Auto-merging lab00/code.py
    CONFLICT (content): Merge conflict in lab00/code.py
    Automatic merge failed; fix conflicts and then commit the result.
    ```

    哦！合并冲突：

    * `"Merge conflict in lab00/code.py"` ：远程版本库和本地版本库都有对 `lab00/code.py` 进行修改的提交。

    * `"Automatic merge failed"` : Git 试图找出整合提交的方法，但无法实现

    * `"fix conflicts and then commit the result"` : 看来我们需要手动解决合并冲突！

    你可以检查 `git status` ：
    ```
    On branch main
    Your branch and 'origin/main' have diverged,
    and have 1 and 1 different commits each, respectively.
    (use "git pull" to merge the remote branch into yours)

    You have unmerged paths.
    (fix conflicts and run "git commit")
    (use "git merge --abort" to abort the merge)

    Unmerged paths:
    (use "git add <file>..." to mark resolution)
    both modified:   code.py
    ```

    用 Vim 打开有冲突的文件。你会看到类似的内容

    ```python
    def fizzbuzz(num):
    <<< HEAD
    "your code"
    ===
    "not your code"
    >>> remote-commit-hash

    for i in range(0, 20):
    ```

    看起来你的虚拟搭档 Oski 也尝试修复了这个错误，但没有告诉你。真是气死我了，Oski！Oski 的代码看起来有点……效率不高，所以你想保留自己的修复方案。不过，Oski 也做了一些有用的事情：多了一个 if 分支，这样对于 15 的倍数，只会打印一行 “fizzbuzz”，而不是分两行打印 “fizz” 和 “buzz”。换句话说，Oski 和你都对代码做了修改，而且你们都希望保留对方的改动！

    现在，考虑到上述情况，请将两个版本合并成一个完整的 fizzbuzz(num) 函数，并删除多余的合并冲突标记（<<< HEAD、===、>>> commit-hash）。修复后的函数大致应如下伪代码所示：

    ```python
    def fizzbuzz(num):
    if 是 15 的倍数:
        # 打印 num: fizzbuzz
    elif 是 3 的倍数:
        # 打印 num: fizz
    elif 是 5 的倍数:
        # 打印 num: buzz
    ```

    完成后，保存、更改、提交你的工作。现在如果你推送代码，应该不会再出现冲突了。合并冲突解决成功！

4. 在你本地机器上（不是通过 SSH 登录的教学账号），克隆你的实验仓库（记得用上面演示过的 SSH 方式克隆，而不是 HTTPS），然后进入 lab00 文件夹。接着，运行以下命令：

    ```bash
    $ bash gen-debug.sh
    ```

    这会生成一个名为 debug.txt 的文件，用来记录自动评分程序的调试信息。将该文件添加、提交并推送。

5. 依然在本地机器上，进入你的实验仓库中的 tools 文件夹，运行以下命令：

    ```bash
    $ bash download_tools.sh
    ```

    如果你看到有关 Illegal date format for -z 或 Disabling time condition 的警告，这属于预期现象，无需担心。

    该命令会下载 Logisim 和 Venus，这两个工具我们后续会用到。确认 Logisim 是否能正常运行：

    ```bash
    $ java -jar logisim-evolution.jar
    ```

    如果弹出窗口，说明运行成功！你可以关闭它，暂时不需要继续使用。

### 练习 6： 欢迎问卷

最后，请填写这份[欢迎调查表](https://docs.google.com/forms/d/e/1FAIpQLSfnptSUQ4uRN8ophmkmGGfHWseAk-efcISEYqrGqRkEmzanwg/viewform?usp=sharing)。 请确保在提交 Gradescope 上的 `Lab 0` 之前提交调查问卷。

## 提交

你完成啦！这可是相当一大段内容，要花不少时间思考，不过现在你对本学期接下来要用到的工具已经有了初步了解，值得的！

每个实验都会包含自动评分的练习。要提交给自动评分系统，你需要把作业推送到 GitHub 上你的实验仓库。然后登录 Gradescope，找到对应的作业（比如这个实验就是 `Lab 0`），选择你的实验仓库，提交作业。等一会儿，页面上就会显示自动评分的成绩。

记住，为了获得实验的学分，一定要确保在截止日期之前完成所有练习，并通过所有自动评分的测试！

## 附录

这些工具可能会对你有所帮助，但绝不是本课程的必修内容：\)

### Vim 基础

`vim` 是一个文本编辑器，包含在 hive 和许多基于 UNIX 的发行版中。

注意：我们将在大部分示例和文档中使用 Vim，但我们并不硬性要求你使用哪种文本编辑器；你可以选择任何你熟悉的编辑器，但你至少应该会使用一种基于终端的文本编辑器。

要打开当前目录下的文件，请将文件名传递给 Vim：

```bash
$ vim filename
```

要从其他目录打开文件，请使用相对路径或绝对路径：

```bash
$ vim ../other-folder/filename
```

| 命令                            | 说明                                        |
|---------------------------------|---------------------------------------------|
| <kbd>Esc</kbd> <code>':q'</code>         | 关闭（退出）Vim，不保存                      |
| <kbd>Esc</kbd> <code>':wq'</code>        | 保存文件后关闭 Vim                           |
| <kbd>Esc</kbd> <code>':w'</code>         | 保存文件                                    |
| <kbd>Esc</kbd> <code>':q!'</code>        | 强制退出 Vim（放弃已做的修改，不保存）       |
| <kbd>Esc</kbd> <code>'i'</code>           | 进入插入模式，允许编辑文件                    |
| <kbd>Esc</kbd> <code>'/cats'</code>       | 搜索文件中最近的字符串 “cats”，按 n 查找下一个，按 N 查找上一个 |
| <kbd>Esc</kbd> <code>':set nu'</code>    | 显示文件中的行号                            |
| <kbd>Esc</kbd> <code>':tabe &lt;filepath&gt;'</code> | 在新标签页打开指定路径的文件，支持 Tab 补全             |
| <kbd>Esc</kbd> <code>':tabn'</code>       | 切换到标签栏中的下一个标签页                  |
| <kbd>Esc</kbd> <code>':tabp'</code>       | 切换到标签栏中的上一个标签页                  |


注意：这些命令前面都带有 <kbd>Esc</kbd>，是因为你需要先按键盘上的 Escape 键才能从当前模式切换出来。例如，如果你正在插入模式（输入文本），想保存文件，就得先按 <kbd>Esc</kbd> 退出插入模式，然后输入 `:w` 来保存文件。如果你当前不在任何模式（比如刚打开文件时），就不需要先按 Esc，不过按了也没坏处 :)

默认情况下，Vim 不启用鼠标支持和行号显示。如果你想开启这些功能：

打开 `~/.vimrc` 文件（命令：`vim ~/.vimrc`）
启用鼠标，添加一行：`set mouse=a`
启用行号，添加一行：`set number`
保存并退出。然后再打开你的 vimrc 文件试试看。

Vim 还有许多其他配置选项，欢迎你去网上找资料多多尝试！

我们也准备了一个 [CS61C 专用的 Vim 使用指南](https://docs.google.com/document/d/1WQF6hQK8CXtlGynSAIX7Rts6q8lykarrqX-zkb9ZDyc/view)，供你参考。感谢 Yijie 的贡献！

### 命令行基础

如果你之前学过 CS61A 和 CS61B，可能已经对命令行界面（CLI）和终端命令有一定了解。本课程会大量使用命令行，所以先花点时间复习一下基础知识。

示例命令通常写成这样：
```bash
$ echo Hello world
```

这里 `echo` 是命令，`Hello` 和 `world` 是参数。在终端输入这行命令后，就会执行它，这里会把 `Hello world` 打印到终端上。

命令行中的选项 (flags) 通常用来指定程序行为或参数，通常以一个或两个短横线开头，并且可以带有参数。

```bash
$ git --version | cat
$ python3 -c 'print("Hello world")'
```

一般建议用单引号将本应是单一参数的字符串包起来（例如 "带 *&)_@#(&$! 符号的较长字符串"），否则可能会出现意想不到的行为--如果不加引号/反引号，这些符号中的很多实际上都会发挥作用！

查看 [61B 的常用 CLI 命令列表](https://inst.eecs.berkeley.edu/%7Ecs61b/fa21/materials/lab/lab1/index.html#essential-terminal-commands)可能会对你有所帮助。

### CLI 键盘快捷键

输入命令或文件路径时：

<kbd>Tab</kbd> 会尝试根据你已输入的内容自动补全当前词条。
例如，如果当前目录有 filename1.txt 和 filename2.txt，输入 f 后按 <kbd>Tab</kbd> 会补全成 filename，继续输入 1 后再按 <kbd>Tab</kbd> 就会补全成 filename1.txt。

<kbd>↑</kbd> 和 <kbd>↓</kbd>（上箭头和下箭头）可以让你浏览之前用过的命令，这样不用重复输入。

<kbd>Ctrl</kbd> + <kbd>a</kbd> 会将光标移动到当前行的开头（方便修改错误）。

<kbd>Ctrl</kbd> + <kbd>e</kbd> 会将光标移动到当前行的末尾（同样方便修改错误）。

<kbd>Ctrl</kbd> + <kbd>r</kbd> 允许你搜索最近使用过的命令。

### Hello World

`echo` 会重复你给它的任何参数：

```bash
$ echo Hello World
```

如果字符串包含特殊字符，用单/双引号将其包围起来可避免触发意外的 shell 功能：

```bash
$ echo "It's morbin time!"
```

### 文件操作

`touch` 将创建一个空白文件，文件名由你提供。

```bash
$ touch example.txt
```

这将创建一个名为 `example.txt` 的文件，文件中没有任何内容。

如果你想一次性创建文件并添加文本，可以使用：
```bash
$ echo 'Your contents here' > example.txt
```

这将在当前目录下创建一个文件，文件名为 `example.txt`。 如果该文件已经存在，则会被覆盖。 文件将包含 `Your contents here` ，不含引号。 `>` 符号包含一个参数，用于重定向打印到 stdout 的数据的发送位置。 在这里，我们将 `echo` 的输出重定向到名为 `example.txt` 的文件。

你可以使用 `cat` 或 `less` 命令查看文件内容。

```bash
$ cat example.txt
$ less example.txt
```

`cat` 将 `example.txt` 的内容打印到终端。 `less` 打开一个基本的查看器，允许你滚动和搜索。

### scp - "安全复制"
`scp` 程序用于使用 SSH 协议在计算机之间复制文件。

有时，你可能希望将 hive 中的单个文件或整个文件夹导入本地系统，反之亦然。你可以使用 `scp` ：

```bash
$ scp <source> <destination>
```

要指定远程源或目的地，请使用 `username@host:path` 。要指定本地目的地，只需使用 `path` 。举个例子：

```bash
$ scp hive1:~/some-folder/example.txt ~/Downloads/
```

假设我的用户名是 `cs61c-???` ，上述命令将连接到 `hive1` ，并将我的指导账户上的 `~/some-folder/example.txt` 复制到本地计算机上的 `~/Downloads/example.txt` 。

如果我想从另一个方向复制（从本地计算机复制到 hive 计算机），我会使用
```bash
$ scp ~/Downloads/example.txt hive1:~/some-folder/
```

`scp` 默认情况下只对文件有效。要复制文件夹，需要告诉 scp " 递归 (recursively) "复制文件夹及其所有内容，可以使用 `-r` 标志来实现：

```bash
scp -r hive1:~/some-folder ~/Downloads/
```

注意斜线：写入 `some-folder` 将复制文件夹本身和里面的文件，而 `some-folder/` 只复制里面的文件。

>警告：在 hive 计算机上运行 `scp` （例如，当你在 SSH 会话中）通常是不可取的行为。在 hive 机器上运行 `scp example.txt hive4:~/example.txt` 会将 `example.txt` 复制到......相同的位置。你可能希望在本地终端会话中运行它！