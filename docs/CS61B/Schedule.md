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
  <body>
  <h1>时间表</h1>
  <table>
    <thead>
      <tr>
        <th>周次</th>
        <th>讲座</th>
        <th>讨论</th>
        <th>实验</th>
        <th>作业</th>
        <th>项目</th>
      </tr>
    </thead>
    <tbody>
        <tr>
          <td rowspan="2">1</td>
          <td>1.简介，实例变量</td>
          <td rowspan="2"><br>无讨论</td>
          <td rowspan="2">实验1:设置,git</td>
          <td rowspan="2">作业0</td>
          <td></td>
        </tr>
        <tr>
          <td>2.定义个使用类，列表，集合和映射</td>
          <td></td>
        </tr>
        <tr>
          <td rowspan="3">2</td>
          <td>3. 引用、递归与IntLists</td>
          <td rowspan="3">1.Java入门</td>
          <td rowspan="3">实验2:调试</td>
          <td>作业0</td>
          <td rowspan="4">迷你项目0：2048</td>
        </tr>
        <tr>
          <td>4. 单链表、嵌套类与哨兵节点</td>
          <td rowspan="5">作业1</td>
        </tr>
        <tr>
          <td>5. 双链表与数组</td>
        </tr>
        <tr>
          <td rowspan="3">3</td>
          <td>6. 测试（含附加视频）</td>
          <td rowspan="3">2. 范围、静态、链接列表、数组</td>
          <td rowspan="3">实验3;调试（第 2 部分）</td>
        </tr>
        <tr>
          <td>7. 动态数组与扩容</td>
          <td rowspan="3">项目1A：链表双端队列</td>
        </tr>
        <tr>
          <td>8. 接口与实现继承</td>
        </tr>
        <tr>
          <td rowspan="3">4</td>
          <td>9. 子类型多态、比较器与泛型函数</td>
          <td rowspan="3">3. 接口继承、可比较对象/比较器、泛型函数</td>
          <td rowspan="3">实验4:Git</td>
          <td rowspan="6"></td>
        </tr>
        <tr>
          <td>10. 迭代器与对象方法</td>
          <td rowspan="3">项目1B：数组双端队列</td>
        </tr>
        <tr>
          <td>11. 渐进分析I</td>
        </tr>
        <tr>
          <td rowspan="2">5</td>
          <td>12. 渐进分析II</td>
          <td rowspan="2">4. 迭代器、可迭代对象、渐近线<br></td>
          <td rowspan="2"></td>
        </tr>
        <tr>
          <td>13. 渐进分析III</td>
          <td rowspan="3"></td>
        </tr>
        <tr>
          <td rowspan="3">6</td>
          <td>14. 并查集</td>
          <td rowspan="3">5. 渐近线 II</td>
          <td rowspan="3">实验5:项目1回顾</td>
        </tr>
        <tr>
          <td>15. 继承、集合、映射与二叉搜索树</td>
          <td rowspan="5">作业2</td>
        </tr>
        <tr>
          <td>16. B树（2-3树、2-3-4树）</td>
          <td rowspan="6">项目2A：N元语法模型</td>
        </tr>
        <tr>
          <td rowspan="3">7</td>
          <td>17. 红黑树</td>
          <td rowspan="3">6. 不相交集、ADT、BST</td>
          <td rowspan="3">实验6：BST映射</td>
        </tr>
        <tr>
          <td>18. 哈希I</td>
        </tr>
        <tr>
          <td>19. 哈希II</td>
        </tr>
        <tr>
          <td rowspan="3">8</td>
          <td>20. 堆与优先队列</td>
          <td rowspan="3">7. B 树、LLRB、哈希</td>
          <td rowspan="3">实验7：哈希映射</td>
          <td rowspan="12">作业3</td>
        </tr>
        <tr>
          <td>21. 树与图的遍历</td>
        </tr>
        <tr>
          <td>22. 图的遍历与实现</td>
          <td rowspan="4">项目2B：检查点</td>
        </tr>
        <tr>
          <td rowspan="3">9</td>
          <td>23. 最短路径</td>
          <td rowspan="3">8. 图表、堆</td>
          <td rowspan="3">实验8：左倾红黑树</td>
        </tr>
        <tr>
          <td>24. 最小生成树</td>
        </tr>
        <tr>
          <td>25. 最小生成树</td>
        </tr>
        <tr>
          <td rowspan="3">10</td>
          <td>26. 字典树</td>
          <td rowspan="3">9. 最短路径，MST</td>
          <td rowspan="3"></td>
          <td rowspan="6">项目2B：Wordnet</td>
        </tr>
        <tr>
          <td>27. 基础排序算法</td>
        </tr>
        <tr>
          <td>28. 软件工程I（项目3）</td>
        </tr>
        <tr>
          <td rowspan="3">11</td>
          <td>29. 归并排序、插入排序与快速排序</td>
          <td rowspan="3">10. 图表 II</td>
          <td rowspan="3">实验9：项目3入门（可选）</td>
        </tr>
        <tr>
          <td>30. 软件工程II（可选）</td>
        </tr>
        <tr>
          <td>31. 软件工程III（项目3）</td>
        </tr>
        <tr>
          <td rowspan="3">12</td>
          <td>32. 快速排序进阶、快速选择与稳定性</td>
          <td rowspan="3">11.排序I</td>
          <td rowspan="3">实验10：俄罗斯方块（可选）</td>
          <td rowspan="3"></td>
          <td rowspan="6">项目3A：世界生成</td>
        </tr>
        <tr>
          <td>33. 排序与算法下界</td>
        </tr>
        <tr>
          <td>34. 软件工程IV（可选）</td>
        </tr>
        <tr>
          <td rowspan="3">13</td>
          <td>35. 基数排序</td>
          <td rowspan="3">12.排序II</td>
          <td rowspan="6"></td>
          <td rowspan="6">作业4</td>
        </tr>
        <tr>
          <td>36. 排序总结与算法设计实践</td>
        </tr>
        <tr>
          <td>37. 数据压缩（可选）</td>
        </tr>
        <tr>
          <td rowspan="3">14</td>
          <td>38. 压缩（可选）</td>
          <td rowspan="3">无讨论</td>
          <td rowspan="3">项目3B：交互功能</td>
        </tr>
        <tr>
          <td>39. P与NP问题（可选）</td>
        </tr>
        <tr>
          <td>40. 课程总结与趣味内容（可选）</td>
        </tr>
      </tbody>
    </table>
  </div>
</body>
</html>
