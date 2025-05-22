<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>课程日历</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>课程日历</h1>
    <table>
        <thead>
            <tr>
                <th>周次</th>
                <th>讲座</th>
                <th>实验和讨论链接</th>
                <th>作业和项目</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>欢迎</td>
                <td><a href="../discussions/disc00/index.html">讨论 00: 入门</a><br>
                <a href="../labs/lab00/index.html">实验 00: 入门</a></td>
                <td></td>
            </tr>
            <tr>
                <td>1</td>
                <td>函数</td>
                <td></td>
                <td><a href="../homeworks/homework01/index.html">作业 01: 函数、控制</a></td>
            </tr>
            <tr>
                <td>2</td>
                <td>控制</td>
                <td><a href="../labs/lab01/index.html">实验 01: 函数</a></td>
                <td></td>
            </tr>
            <tr>
                <td>2</td>
                <td>高阶函数</td>
                <td><a href="../discussions/disc01/index.html">讨论 01: 控制、环境图</a></td>
                <td><a href="../projects/hog/index.html">猪</a></td>
            </tr>
            <tr>
                <td>2</td>
                <td>环境</td>
                <td></td>
                <td><a href="../homeworks/homework02/index.html">作业 02: 高阶函数</a></td>
            </tr>
            <tr>
                <td>3</td>
                <td>函数抽象</td>
                <td><a href="../labs/lab02/index.html">实验 02: 高阶函数、Lambda 表达式</a></td>
                <td></td>
            </tr>
            <tr>
                <td>3</td>
                <td>函数实例</td>
                <td><a href="../discussions/disc01/index.html">讨论 02: 环境图、高阶函数</a></td>
                <td></td>
            </tr>
            <tr>
                <td>3</td>
                <td>牛顿（可选）</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>4</td>
                <td>没有讲座: 期中考试 2/11</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>4</td>
                <td>期中考试 1（7pm-9pm）</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>4</td>
                <td>递归</td>
                <td><a href="../discussions/disc03/index.html">讨论 03: 递归</a></td>
                <td></td>
            </tr>
            <tr>
                <td>4</td>
                <td>树递归</td>
                <td></td>
                <td><a href="../homeworks/homework03/index.html">作业 03: 递归、树递归</a></td>
            </tr>
            <tr>
                <td>5</td>
                <td>没有讲座: 总统日</td>
                <td></td>
                <td>实验 03: 递归、Python 列表</td>
            </tr>
            <tr>
                <td>5</td>
                <td>序列</td>
                <td>讨论 04: 树递归</td>
                <td></td>
            </tr>
            <tr>
                <td>5</td>
                <td>容器</td>
                <td></td>
                <td>猫</td>
            </tr>
            <tr>
                <td>6</td>
                <td>数据抽象</td>
                <td>实验 04: 树递归、数据抽象</td>
                <td></td>
            </tr>
            <tr>
                <td>6</td>
                <td>树</td>
                <td>讨论 05: 树</td>
                <td></td>
            </tr>
            <tr>
                <td>6</td>
                <td>可变性</td>
                <td></td>
                <td>作业 04: 序列、数据抽象、树</td>
            </tr>
            <tr>
                <td>7</td>
                <td>迭代器</td>
                <td>实验 05: 迭代器、可变性</td>
                <td></td>
            </tr>
            <tr>
                <td>7</td>
                <td>生成器</td>
                <td>讨论 06: 生成器</td>
                <td></td>
            </tr>
            <tr>
                <td>7</td>
                <td>对象</td>
                <td></td>
                <td>作业 05: 生成器<br>蚂蚁</td>
            </tr>
            <tr>
                <td>8</td>
                <td>属性</td>
                <td>实验 06: 面向对象编程</td>
                <td></td>
            </tr>
            <tr>
                <td>8</td>
                <td>继承</td>
                <td>讨论 07: 面向对象编程</td>
                <td></td>
            </tr>
            <tr>
                <td>8</td>
                <td>表示法</td>
                <td></td>
                <td>作业 06: 面向对象编程、链表、可变树</td>
            </tr>
            <tr>
                <td>9</td>
                <td>组合</td>
                <td>实验 07: 链表、继承</td>
                <td></td>
            </tr>
            <tr>
                <td>9</td>
                <td>效率</td>
                <td>讨论 08: 链表</td>
                <td></td>
            </tr>
            <tr>
                <td>9</td>
                <td>分解</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>10</td>
                <td>春假：无讲座</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>11</td>
                <td>数据示例（仅 Zoom）</td>
                <td>实验 08: 链表、继承（可选）</td>
                <td></td>
            </tr>
            <tr>
                <td>11</td>
                <td>Scheme</td>
                <td></td>
                <td>作业 07: Scheme</td>
            </tr>
            <tr>
                <td>12</td>
                <td>Scheme 列表</td>
                <td>实验 09: Scheme</td>
                <td></td>
            </tr>
            <tr>
                <td>12</td>
                <td>计算器</td>
                <td>讨论 09: Scheme，Scheme 列表</td>
                <td></td>
            </tr>
            <tr>
                <td>12</td>
                <td>解释器</td>
                <td></td>
                <td>作业 08: Scheme 列表<br>Scheme</td>
            </tr>
            <tr>
                <td>13</td>
                <td>程序作为数据</td>
                <td>实验 10: Scheme</td>
                <td>可选：Scheme 比赛</td>
            </tr>
            <tr>
                <td>13</td>
                <td>宏</td>
                <td>讨论 10: Scheme，Scheme 列表</td>
                <td></td>
            </tr>
            <tr>
                <td>13</td>
                <td>SQL</td>
                <td></td>
                <td>作业 09: 程序作为数据，宏</td>
            </tr>
            <tr>
                <td>14</td>
                <td>表</td>
                <td>实验 11: 解释器</td>
                <td></td>
            </tr>
            <tr>
                <td>14</td>
                <td>聚合</td>
                <td>讨论 11: 宏</td>
                <td></td>
            </tr>
            <tr>
                <td>14</td>
                <td>数据库（可选）</td>
                <td></td>
                <td>作业 10: SQL</td>
            </tr>
            <tr>
                <td>15</td>
                <td>设计函数</td>
                <td>实验 12: SQL</td>
                <td></td>
            </tr>
            <tr>
                <td>15</td>
                <td>语言模型（可选）</td>
                <td>讨论 12: SQL</td>
                <td></td>
            </tr>
            <tr>
                <td>15</td>
                <td>总结</td>
                <td></td>
                <td>作业 11: 期末总结<br>Scheme 项目展示库</td>
            </tr>
            <tr>
                <td>16</td>
                <td>无讲座：复习周</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>17</td>
                <td>期末考试（11:30am-2:30pm）</td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
    </table>
</body>
</html>
