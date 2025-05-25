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
          <th>周次</th>
          <th>讲座</th>
          <th>讨论</th>
          <th>实验</th>
          <th>项目</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td rowspan="2">1</td>
          <td>导言</td>
          <td></td>
          <td rowspan="2"><a href="../Labs/Lab_0/index.html">实验 0: 课程介绍与环境配置</a></td>
          <td></td>
        </tr>
        <tr>
          <td>数值表示</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td rowspan="3">2</td>
          <td>C语言: 基础</td>
          <td><a href="../Discussion/Discussion_1/index.html">讨论 1: C语言与数值表示</a></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>C语言: 指针、数组、字符串</td>
          <td></td>
          <td><a href="../Labs/Lab_1/index.html">实验 1: C语言</a></td>
          <td></td>
        </tr>
        <tr>
          <td>C语言: 内存管理</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td rowspan="3">3</td>
          <td>C语言: 泛型</td>
          <td>讨论 2: C语言</td>
          <td></td>
          <td rowspan="5">项目 1: snek</td>
        </tr>
        <tr>
          <td>浮点运算</td>
          <td></td>
          <td><a href="../Labs/Lab_2/index.html">实验 2: C语言调试</a></td>
        </tr>
        <tr>
          <td>RISC-V: 基础</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td rowspan="3">4</td>
          <td>RISC-V: 数据传输</td>
          <td>讨论 3: 浮点/RISC-V</td>
          <td></td>
        </tr>
        <tr>
          <td>RISC-V: 条件分支</td>
          <td></td>
          <td><a href="../Labs/Lab_3/index.html">实验 3: RISC-V, Venus</a></td>
        </tr>
        <tr>
          <td>RISC-V: 程序控制</td>
          <td></td>
          <td></td>
          <td rowspan="8">项目 2: CS61Classify</td>
        </tr>
        <tr>
          <td rowspan="2">5</td>
          <td>RISC-V: 指令格式(1)</td>
          <td>讨论 4: RISC-V 调用约定</td>
          <td></td>
        </tr>
        <tr>
          <td>RISC-V: 指令格式(2)</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td rowspan="3">6</td>
          <td>缓存(1)</td>
          <td>讨论 5: RISC-V ISA, AMAT</td>
          <td></td>
        </tr>
        <tr>
          <td>缓存(2)</td>
          <td></td>
          <td rowspan="3">实验 4: RISC-V 调用约定</td>
        </tr>
        <tr>
          <td>缓存(3)</td>
          <td></td>
        </tr>
        <tr>
          <td rowspan="3">7</td>
          <td>缓存(4)</td>
          <td>讨论 6: 缓存</td>
        </tr>
        <tr>
          <td>编译器、汇编器、链接器、加载器</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>SDS(1)</td>
          <td></td>
          <td></td>
          <td rowspan="15">项目 3: CS61CPU</td>
        </tr>
        <tr>
          <td rowspan="3">8</td>
          <td>SDS(2)</td>
          <td>讨论 7: CALL, 布尔代数</td>
          <td></td>
        </tr>
        <tr>
          <td>SDS(3)</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>SDS(4)</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td rowspan="3">9</td>
          <td>期中考试</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>RISC-V: 单周期数据通路(1)</td>
          <td></td>
          <td>实验 5: Logisim</td>
        </tr>
        <tr>
          <td>RISC-V: 单周期数据通路(2)</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td rowspan="3">11</td>
          <td>RISC-V: 单周期控制逻辑</td>
          <td>讨论 8: SDS, 单周期数据通路</td>
          <td></td>
        </tr>
        <tr>
          <td>RISC-V: 五级流水线(1)</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>RISC-V: 五级流水线(2)</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td rowspan="3">12</td>
          <td>RISC-V: 五级流水线(3) - 冒险</td>
          <td>讨论 9: 流水线与冒险</td>
          <td></td>
        </tr>
        <tr>
          <td>并行(1) - 介绍</td>
          <td></td>
          <td>实验 6: CPU、流水线</td>
        </tr>
        <tr>
          <td>并行(2) - SIMD</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td rowspan="3">13</td>
          <td>并行(3) - TLP</td>
          <td>讨论 10: 性能、DLP</td>
          <td></td>
        </tr>
        <tr>
          <td>并行(4) - 并发</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>并行(5) - MIMD 架构</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td rowspan="3">14</td>
          <td>虚拟内存(1)</td>
          <td>讨论 11: 线程级并行</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>虚拟内存(2)</td>
          <td></td>
          <td rowspan="2">实验 7: 并行</td>
          <td></td>
        </tr>
        <tr>
          <td>操作系统基础</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td rowspan="1">15</td>
          <td>总结</td>
          <td>讨论 12: 虚拟内存</td>
          <td>实验 8: <span style="color:red;">CS61</span>ka<span style="color:red;">C</span>how</td>
          <td></td>
        </tr>
      </tbody>
    </table>
  </div>
</body>
</html>
