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
    tbody td[rowspan]:first-child {
        text-align: center !important;
        vertical-align: middle !important;
        font-size:20px;
    }
    tbody tr:hover td:not([rowspan]) {
        background-color: #e9ecef;
        transition: background-color 0.3s ease;
    }
    th:nth-child(5), td:ntd-child(5) {
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
          <th>讨论</th>
          <th>实验</th>
          <th>项目</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/">1. 导言</a></td>
          <td></td>
          <td rowspan="2"><a href="../Labs/Lab_0/index.html">实验 0: 课程介绍与环境配置</a></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=2">2. 数值表示</a></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=3">3. C语言: 基础</a></td>
          <td><a href="../Discussion/Discussion_1/index.html">讨论 1: C语言与数值表示</a></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=5">4. C语言: 指针、数组、字符串</a></td>
          <td></td>
          <td><a href="../Labs/Lab_1/index.html">实验 1: C语言</a></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=6">5. C语言: 内存管理</a></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1eGwFeQEfm/?p=5">6. C语言: 泛型</a></td>
          <td>讨论 2: C语言</td>
          <td></td>
          <td rowspan="5"><a href="../Projects/Project_1/index.html">项目 1: snek</a></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=8">7. 浮点运算</a></td>
          <td></td>
          <td><a href="../Labs/Lab_2/index.html">实验 2: C语言调试</a></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=9">8. RISC-V: 基础</a></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=10">9. RISC-V: 数据传输</a></td>
          <td>讨论 3: 浮点/RISC-V</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=12">10. RISC-V: 条件分支</a></td>
          <td></td>
          <td><a href="../Labs/Lab_3/index.html">实验 3: RISC-V, Venus</a></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=13">11. RISC-V: 程序控制</a></td>
          <td></td>
          <td></td>
          <td rowspan="8"><a href="../Projects/Project_2/index.html">项目 2: CS61Classify</a></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=14">12. RISC-V: 指令格式(1)</a></td>
          <td>讨论 4: RISC-V 调用约定</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=16">13. RISC-V: 指令格式(2)</a></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=32">14. 缓存(1)</a></td>
          <td>讨论 5: RISC-V ISA, AMAT</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=33">15. 缓存(2)</a></td>
          <td></td>
          <td rowspan="3"><a href="../Labs/Lab_4/index.html">实验 4: RISC-V 调用约定</a></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=34">16. 缓存(3)</a></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=36">17. 缓存(4)</a></td>
          <td>讨论 6: 缓存</td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=17">18. 编译器、汇编器、链接器、加载器</a></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=20">19. SDS(1)</a></td>
          <td></td>
          <td></td>
          <td rowspan="11"><a href="../Projects/Project_3/index.html">项目 3: CS61CPU</a></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=21">20. SDS(2)</a></td>
          <td>讨论 7: CALL, 布尔代数</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=22">21. SDS(3)</a></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=23">22. SDS(4)</a></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>23. 期中考试</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=24">24. RISC-V: 单周期数据通路(1)</a></td>
          <td></td>
          <td><a href="../Labs/Lab_5/index.html">实验 5: Logisim</a></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=25">25. RISC-V: 单周期数据通路(2)</a></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=26">26. RISC-V: 单周期控制逻辑</a></td>
          <td>讨论 8: SDS, 单周期数据通路</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=28">27. RISC-V: 五级流水线(1)</a></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=29">28. RISC-V: 五级流水线(2)</a></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=30">29. RISC-V: 五级流水线(3) - 冒险</a></td>
          <td>讨论 9: 流水线与冒险</td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=38">30. 并行(1) - 介绍</a></td>
          <td></td>
          <td><a href="../Labs/Lab_6/index.html">实验 6: CPU、流水线</a></td>
          <td rowspan="4"><a href="../Projects/Project_4/index.html">项目 4: <span style="color:red;">CS61</span>ka<span style="color:red;">C</span>how</a></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=40">31. 并行(2) - SIMD</a></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=41">32. 并行(3) - TLP</a></td>
          <td>讨论 10: 性能、DLP</td>
          <td></td>
        </tr>
        <tr>
          <td>33. 并行(4) - 并发</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>34. 并行(5) - MIMD 架构</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=42">35. 虚拟内存(1)</a></td>
          <td>讨论 11: 线程级并行</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=44">36. 虚拟内存(2)</a></td>
          <td></td>
          <td rowspan="2"><a href="../Labs/Lab_7/index.html">实验 7: 并行</a></td>
          <td></td>
        </tr>
        <tr>
          <td>37. 操作系统基础</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><a href="https://www.bilibili.com/video/BV1MCDPYZEUf/?p=51">38. 总结</a></td>
          <td>讨论 12: 虚拟内存</td>
          <td></td>
          <td></td>
        </tr>
      </tbody>
    </table>
    <blockquote>
    <p>时间表基于 <a href="https://cs61c.org">cs61c.org</a> 翻译，讲座的课程视频来源于 Bilibili，灰色的部分为2025年秋季新增内容。</p>
    <p>感谢 Bilibili UP主：加加的公开课小屋</p>
    </blockquote>
  </div>
</body>
</html>
