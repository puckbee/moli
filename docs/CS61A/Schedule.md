<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>时间表</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&family=Noto+Sans+SC:wght@400;500;700&display=swap" rel="stylesheet">
  <style>
    h1 {
        font-family: 'Roboto', sans-serif;
        font-weight: 700;
        font-size: 2.5rem;
        margin-bottom: 0rem !important;
        color: #2c3e50;
    }
    table {
        font-family: 'Noto Sans SC', sans-serif;
        background: #f9fafb;
        color: #333;
        line-height: 1.6;
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
    tbody tr:hover td {
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
    a:hover {
        text-decoration: underline;
    }
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
          <th>讲座</th>
          <th>实验和讨论链接</th>
          <th>作业和项目</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3">1. 欢迎</a></td>
          <td><a href="../discussions/disc00/index.html">讨论 00: 入门</a><br>
              <a href="../labs/lab00/index.html">实验 00: 入门</a></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=2">2. 函数</a></td>
          <td></td>
          <td><a href="../homeworks/homework01/index.html">作业 01: 函数、控制</a></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=3">3. 控制</a></td>
          <td><a href="../labs/lab01/index.html">实验 01: 函数</a></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=4">4. 高阶函数</a></td>
          <td><a href="../discussions/disc01/index.html">讨论 01: 控制、环境图</a></td>
          <td><a href="../projects/hog/index.html">猪（Hog）</a></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=5">5. 环境</a></td>
          <td></td>
          <td><a href="../homeworks/homework02/index.html">作业 02: 高阶函数</a></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=6">6. 函数抽象</a></td>
          <td><a href="../labs/lab02/index.html">实验 02: 高阶函数、Lambda 表达式</a></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA/?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=7">7. 函数实例</a></td>
          <td><a href="../discussions/disc01/index.html">讨论 02: 环境图、高阶函数</a></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA/?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=8">8. 牛顿迭代法（可选）</a></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=9">9. 递归</a></td>
          <td><a href="../discussions/disc03/index.html">讨论 03: 递归</a></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=10">10. 树递归</a></td>
          <td></td>
          <td><a href="../homeworks/homework03/index.html">作业 03: 递归、树形递归</a></td>
        </tr>
        <tr>
          <td></td>
          <td></td>
          <td>实验 03: 递归、Python 列表</td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=11">11. 序列</a></td>
          <td>讨论 04: 树递归</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=12">12. 容器</a></td>
          <td></td>
          <td>猫（Cats）</td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=13">13. 数据抽象</a></td>
          <td>实验 04: 树递归、数据抽象</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=14">14. 树</a></td>
          <td>讨论 05: 树</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=15">15. 可变性</a></td>
          <td></td>
          <td>作业 04: 序列、数据抽象、树</td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=16">16. 迭代器</a></td>
          <td>实验 05: 迭代器、可变性</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=17">17. 生成器</a></td>
          <td>讨论 06: 生成器</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=18">18. 对象</a></td>
          <td></td>
          <td>作业 05: 生成器<br><br>蚂蚁（Ants）</td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=19">19. 属性</a></td>
          <td>实验 06: 面向对象编程</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=20">20. 继承</a></td>
          <td>讨论 07: 面向对象编程</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=21">21. 表示法</a></td>
          <td></td>
          <td>作业 06: 面向对象编程、链表、可变树</td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=22">22. 组合</a></td>
          <td>实验 07: 链表、继承</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=23">23. 效率</a></td>
          <td>讨论 08: 链表</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=24">24. 分解</a></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=25">25. 数据示例（仅限Zoom平台）</a></td>
          <td>实验 08: 链表、继承（可选）</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=26">26. Scheme 语言</a></td>
          <td></td>
          <td>作业 07: Scheme</td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=27">27. Scheme 列表</a></td>
          <td>实验 09: Scheme</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=28">28. 计算器</a></td>
          <td>讨论 09: Scheme，Scheme 列表</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=29">29. 解释器</a></td>
          <td></td>
          <td>作业 08: Scheme 列表<br><br>Scheme</td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=31">30. 程序作为数据</a></td>
          <td>实验 10: Scheme</td>
          <td>Scheme 比赛（可选）</td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=32">31. 宏</a></td>
          <td>讨论 10: Scheme，Scheme 列表</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=33">32. SQL</a></td>
          <td></td>
          <td>作业 09: 程序作为数据，宏</td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=34">33. 表</a></td>
          <td>实验 11: 解释器</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=35">34. 聚合</a></td>
          <td>讨论 11: 宏</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=36">35. 数据库（可选）</a></td>
          <td></td>
          <td>作业 10: SQL</td>
        </tr>
        <tr>
          <td><a href="https://www.youtube.com/watch?v=_wfbb189nJA&list=PL6BsET-8jgYVlVyu77Ecd3HyXiyY-Z9Ty">36. 设计函数</a></td>
          <td>实验 12: SQL</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://bcourses.berkeley.edu/courses/1542651/pages/lecture-37-language-models-optional">37. 语言模型（可选）</a></td>
          <td>讨论 12: SQL</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1sy411z7nA?spm_id_from=333.788.videopod.sections&vd_source=79c6ce1ec30b05ff9d95e246312064d3&p=37">38. 总结</a></td>
          <td></td>
          <td>作业 11: 期末总结<br><br>Scheme 画廊</td>
        </tr>
      </tbody>
    </table>
  </div>
  <blockquote>
    视频为 2024 年伯克利讲座汉化版本，感谢"CS自学社区"的工作
  </blockquote>
</body>
</html>
