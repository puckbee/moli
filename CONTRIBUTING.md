# 贡献代码

如果你发现一些问题，或者想改进或贡献一个新的模块
那么你可以在 [issues][1] 上提交反馈，或者发起一个提交代码的请求(pull request).

# 问题反馈

* 确认这个问题没有被反馈过
* 确认这个问题最近还没有被修复，请先检查下 `master` 的最新提交

# 本地开发

1. Fork 项目到自己的 GitHub 仓库中
2. 将项目克隆到本地
```bash
git clone https://github.com/<你的用户名>/moli.git
cd moli
```
3. 启动开发服务器
```bash
make serve # 默认访问 http://127.0.0.1:8000/moli/
```

# 提交代码

* 请先更新你的本地分支到最新，再进行提交代码请求，确保没有合并冲突
* 编写友好可读的提交信息
* 请提交代码到 `dev` 分支，如果通过，我们会在特定时间合并到 `master` 分支上

[1]: https://github.com/puckbee/moli/issues
