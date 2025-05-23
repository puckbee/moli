<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>时间表</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&family=Noto+Sans+SC:wght@400;500;700&display=swap" rel="stylesheet">
  <style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }
    body {
        font-family: 'Noto Sans SC', sans-serif;
        background: #f9fafb;
        color: #333;
        line-height: 1.6;
        padding: 20px;
    }
    h1 {
        font-family: 'Roboto', sans-serif;
        font-weight: 700;
        font-size: 2.5rem;
        margin-bottom: 0rem !important;
        color: #2c3e50;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        border-radius: 0.5rem !important;
    }
    thead {
        background: linear-gradient(90deg, #4e73df, #224abe);
        color: #fff;
    }
    td {
        background-color:GhostWhite;
        padding: 12px 15px;
        text-align: center;
        border-right: 1px solid #ccc;
    }
    /* 带有rowspan的单元格样式 */
    tbody td[rowspan]:first-child {
        text-align: center !important;
        vertical-align: middle !important;
        font-size:20px;
    }
    /* 不带有rowspan的单元格样式 */
    tbody tr:hover td:not([rowspan]) {
        background-color: #e9ecef;
        transition: background-color 0.3s ease;
    }
    th:last-child, td:last-child {
        border-right: none;
    }
    th {
        font-weight: 500;
        text-transform: uppercase;
        letter-spacing: 0.03em;
    }
    a {
        color: #4e73df;
        text-decoration: none;
        font-weight: 500;
    }
    a:hover {
        text-decoration: underline;
    }
    /* 响应式 */
     @media (max-width: 768px) {
        th, td {
            padding: 8px;
            font-size: 0.9rem;
        }
    }
  </style>
</head>
<body>
  <h1>时间表</h1>
  <div>
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
          <td rowspan="2">1</td>
          <td>欢迎</td>
          <td><a href="../discussions/disc00/index.html">讨论 00: 入门</a><br>
              <a href="../labs/lab00/index.html">实验 00: 入门</a></td>
          <td></td>
        </tr>
        <tr>
          <td>函数</td>
          <td></td>
          <td><a href="../homeworks/homework01/index.html">作业 01: 函数、控制</a></td>
        </tr>
        <tr>
          <td rowspan="3">2</td>
          <td>控制</td>
          <td><a href="../labs/lab01/index.html">实验 01: 函数</a></td>
          <td></td>
        </tr>
        <tr>
          <td>高阶函数</td>
          <td><a href="../discussions/disc01/index.html">讨论 01: 控制、环境图</a></td>
          <td><a href="../projects/hog/index.html">猪（Hog）</a></td>
        </tr>
        <tr>
          <td>环境</td>
          <td></td>
          <td><a href="../homeworks/homework02/index.html">作业 02: 高阶函数</a></td>
        </tr>
        <tr>
          <td rowspan="3">3</td>
          <td>函数抽象</td>
          <td><a href="../labs/lab02/index.html">实验 02: 高阶函数、Lambda 表达式</a></td>
          <td></td>
        </tr>
        <tr>
          <td>函数实例</td>
          <td><a href="../discussions/disc01/index.html">讨论 02: 环境图、高阶函数</a></td>
          <td></td>
        </tr>
        <tr>
          <td>牛顿迭代法（可选）</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td rowspan="2">4</td>
          <td>递归</td>
          <td><a href="../discussions/disc03/index.html">讨论 03: 递归</a></td>
          <td></td>
        </tr>
        <tr>
          <td>树递归</td>
          <td></td>
          <td><a href="../homeworks/homework03/index.html">作业 03: 递归、树形递归</a></td>
        </tr>
        <tr>
          <td rowspan="3">5</td>
          <td></td>
          <td></td>
          <td>实验 03: 递归、Python 列表</td>
        </tr>
        <tr>
          <td>序列</td>
          <td>讨论 04: 树递归</td>
          <td></td>
        </tr>
        <tr>
          <td>容器</td>
          <td></td>
          <td>猫（Cats）</td>
        </tr>
        <tr>
          <td rowspan="3">6</td>
          <td>数据抽象</td>
          <td>实验 04: 树递归、数据抽象</td>
          <td></td>
        </tr>
        <tr>
          <td>树</td>
          <td>讨论 05: 树</td>
          <td></td>
        </tr>
        <tr>
          <td>可变性</td>
          <td></td>
          <td>作业 04: 序列、数据抽象、树</td>
        </tr>
        <tr>
          <td rowspan="3">7</td>
          <td>迭代器</td>
          <td>实验 05: 迭代器、可变性</td>
          <td></td>
        </tr>
        <tr>
          <td>生成器</td>
          <td>讨论 06: 生成器</td>
          <td></td>
        </tr>
        <tr>
          <td>对象</td>
          <td></td>
          <td>作业 05: 生成器<br><br>蚂蚁（Ants）</td>
        </tr>
        <tr>
          <td rowspan="3">8</td>
          <td>属性</td>
          <td>实验 06: 面向对象编程</td>
          <td></td>
        </tr>
        <tr>
          <td>继承</td>
          <td>讨论 07: 面向对象编程</td>
          <td></td>
        </tr>
        <tr>
          <td>表示法</td>
          <td></td>
          <td>作业 06: 面向对象编程、链表、可变树</td>
        </tr>
        <tr>
          <td rowspan="3">9</td>
          <td>组合</td>
          <td>实验 07: 链表、继承</td>
          <td></td>
        </tr>
        <tr>
          <td>效率</td>
          <td>讨论 08: 链表</td>
          <td></td>
        </tr>
        <tr>
          <td>分解</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td rowspan="2">11</td>
          <td>数据示例（仅限Zoom平台）</td>
          <td>实验 08: 链表、继承（可选）</td>
          <td></td>
        </tr>
        <tr>
          <td>Scheme 语言</td>
          <td></td>
          <td>作业 07: Scheme</td>
        </tr>
        <tr>
          <td rowspan="3">12</td>
          <td>Scheme 列表</td>
          <td>实验 09: Scheme</td>
          <td></td>
        </tr>
        <tr>
          <td>计算器</td>
          <td>讨论 09: Scheme，Scheme 列表</td>
          <td></td>
        </tr>
        <tr>
          <td>解释器</td>
          <td></td>
          <td>作业 08: Scheme 列表<br><br>Scheme</td>
        </tr>
        <tr>
          <td rowspan="3">13</td>
          <td>程序作为数据</td>
          <td>实验 10: Scheme</td>
          <td>Scheme 比赛（可选）</td>
        </tr>
        <tr>
          <td>宏</td>
          <td>讨论 10: Scheme，Scheme 列表</td>
          <td></td>
        </tr>
        <tr>
          <td>SQL</td>
          <td></td>
          <td>作业 09: 程序作为数据，宏</td>
        </tr>
        <tr>
          <td rowspan="3">14</td>
          <td>表</td>
          <td>实验 11: 解释器</td>
          <td></td>
        </tr>
        <tr>
          <td>聚合</td>
          <td>讨论 11: 宏</td>
          <td></td>
        </tr>
        <tr>
          <td>数据库（可选）</td>
          <td></td>
          <td>作业 10: SQL</td>
        </tr>
        <tr>
          <td rowspan="3">15</td>
          <td>设计函数</td>
          <td>实验 12: SQL</td>
          <td></td>
        </tr>
        <tr>
          <td>语言模型（可选）</td>
          <td>讨论 12: SQL</td>
          <td></td>
        </tr>
        <tr>
          <td>总结</td>
          <td></td>
          <td>作业 11: 期末总结<br><br>Scheme 画廊</td>
        </tr>
      </tbody>
    </table>
  </div>
</body>
</html>
