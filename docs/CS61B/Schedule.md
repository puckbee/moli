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
        border: 1px solid #ccc;
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
        border-bottom: 1px solid #ccc;
    }
    tbody td[rowspan]:first-child {
        text-align: center !important;
        vertical-align: middle !important;
        font-size:20px;
        border-bottom: 1px solid #ccc;
    }

    tbody tr:hover td:not([rowspan]) {
        background-color: #e9ecef;
        transition: background-color 0.3s ease;
    }
    th:last-child {
        border-right: none;
    }
    td:last-child {
        border-right: 1px solid #ccc;
    }
    th {
        font-weight: 500;
        text-transform: uppercase;
        letter-spacing: 0.03em;
        padding: 12px 15px;
        border-bottom: 1px solid #ccc;
        border-right: 1px solid rgba(255, 255, 255, 0.2);
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
<table><thead>
  <tr>
    <th>讲座</th>
    <th>讨论</th>
    <th>实验</th>
    <th>作业</th>
    <th>项目</th>
  </tr></thead>
<tbody>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=1">1.简介，实例变量</a></td>
    <td rowspan="2"><br>无讨论</td>
    <td rowspan="2"><a href="../labs/lab01">实验1:设置,git</a></td>
    <td rowspan="2"><a href="../homework/hw0/hw0a/">作业0A</a></td>
    <td></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=2">2.定义个使用类，列表，集合和映射</a></td>
    <td></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=3">3. 引用、递归与IntLists</a></td>
    <td rowspan="3">1.Java入门<br><a href="../discus/regular01">讨论 01</a> <br> <a href="../discus/regular01sol">讨论 01 解答</a><br><a href="../discus/examlevel01">考试 01</a> <br> <a href="../discus/examlevel01sol">考试 01 解答</a></td>
    <td rowspan="3"><a href="../labs/lab02">实验2:调试</a></td>
    <td><a href="../homework/hw0/hw0b/">作业0B</a></td>
    <td rowspan="4"><a href="../projects/proj0">迷你项目0：2048</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=4">4. 单链表、嵌套类与哨兵节点</a></td>
    <td rowspan="5"><a href="https://www.gradescope.com/login">作业1</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=5">5. 双链表与数组</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=6">6. 测试（含附加视频）</a></td>
    <td rowspan="3">2. 范围、静态、链接列表、数组<br><a href="../discus/regular02">讨论 02</a> <br> <a href="../discus/regular02sol">讨论 02 解答</a><br><a href="../discus/examlevel02">考试 02</a> <br> <a href="../discus/examlevel02sol">考试 02 解答</a></td>
    <td rowspan="3"><a href="../labs/lab03">实验3:调试（第 2 部分）</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=7">7. 动态数组与扩容</a></td>
    <td rowspan="3"><a href="../projects/proj1a">项目1A：链表双端队列</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=8">8. 接口与实现继承</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=9">9. 子类型多态、比较器与泛型函数</a></td>
    <td rowspan="3">3. 接口继承、可比较对象/比较器、泛型函数<br><a href="../discus/regular03">讨论 03</a> <br> <a href="../discus/regular03sol">讨论 03 解答</a><br><a href="../discus/examlevel03">考试 03</a> <br> <a href="../discus/examlevel03sol">考试 03 解答</a></td>
    <td rowspan="3"><a href="../labs/lab04">实验4:Git</a></td>
    <td rowspan="6"></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=10">10. 迭代器与对象方法</a></td>
    <td rowspan="3"><a href="../projects/proj1b">项目1B：数组双端队列</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=11">11. 渐进分析I</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=12">12. 渐进分析II</a></td>
    <td rowspan="2">4. 迭代器、可迭代对象、渐近线<br></td>
    <td rowspan="2"></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=13">13. 渐进分析III</a></td>
    <td rowspan="3"></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=14">14. 并查集</a></td>
    <td rowspan="3">5. 渐近线 II</td>
    <td rowspan="3">实验5:项目1回顾</td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=15">15. 继承、集合、映射与二叉搜索树</a></td>
    <td rowspan="5">作业2</td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=16">16. B树（2-3树、2-3-4树）</a></td>
    <td rowspan="6">项目2A：N元语法模型</td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=17">17. 红黑树</a></td>
    <td rowspan="3">6. 不相交集、ADT、BST</td>
    <td rowspan="3">实验6：BST映射</td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=18">18. 哈希I</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=19">19. 哈希II</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=20">20. 堆与优先队列</a></td>
    <td rowspan="3">7. B 树、LLRB、哈希</td>
    <td rowspan="3">实验7：哈希映射</td>
    <td rowspan="12">作业3</td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=21">21. 树与图的遍历</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=22">22. 图的遍历与实现</a></td>
    <td rowspan="4">项目2B：检查点</td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=23">23. 最短路径</a></td>
    <td rowspan="3">8. 图表、堆</td>
    <td rowspan="3">实验8：左倾红黑树</td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=24">24. 最小生成树</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=25">25. 最小生成树</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=26">26. 字典树</a></td>
    <td rowspan="3">9. 最短路径，MST</td>
    <td rowspan="3"></td>
    <td rowspan="6">项目2B：Wordnet</td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=27">27. 基础排序算法</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=28">28. 软件工程I（项目3）</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=29">29. 归并排序、插入排序与快速排序</a></td>
    <td rowspan="3">10. 图表 II</td>
    <td rowspan="3">实验9：项目3入门（可选）</td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=30">30. 软件工程II（可选）</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=31">31. 软件工程III（项目3）</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=32">32. 快速排序进阶、快速选择与稳定性</a></td>
    <td rowspan="3">11.排序I</td>
    <td rowspan="3">实验10：俄罗斯方块（可选）</td>
    <td rowspan="3"></td>
    <td rowspan="6">项目3A：世界生成</td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=33">33. 排序与算法下界</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=34">34. 软件工程IV（可选）</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=35">35. 基数排序</a></td>
    <td rowspan="3">12.排序II</td>
    <td rowspan="6"></td>
    <td rowspan="6">作业4</td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=36">36. 排序总结与算法设计实践</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=37">37. 数据压缩（可选）</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=38">38. 压缩（可选）</a></td>
    <td rowspan="3">无讨论</td>
    <td rowspan="3">项目3B：交互功能</td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=39">39. P与NP问题（可选）</a></td>
  </tr>
  <tr>
    <td><a href="https://www.bilibili.com/video/BV1hJ4m1M7ZA?p=40">40. 课程总结与趣味内容（可选）</a></td>
  </tr>
</tbody></table>
</html>

> 视频为 2024 年伯克利讲座汉化版本，感谢 [@CS自学社区](https://space.bilibili.com/526939229) 的工作。
>
> 如果需要观看讨论、实验和项目相关的课程视频，这里推荐由 [@小乖乖的喵星球](https://space.bilibili.com/95093036) 搬运并汉化的 [这个视频合集](https://www.bilibili.com/video/BV1QP4y1u7jv)。
