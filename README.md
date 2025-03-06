# sbepp Conda 包

本仓库为 **sbepp** 提供 conda 包的构建配置，使用了 Pixi 和 Rattler-build 工具。主要包含以下文件：

- **pixi.toml**：项目构建依赖的配置文件
- **recipe.yaml**：conda 包的构建配方
- **.github/workflows/release-conda.yml**：GitHub Actions 工作流配置，当推送版本标签（如 `v1.0.0`）时自动构建并发布 conda 包

## 本地构建说明

1. **安装必要工具**  
   请确保已安装以下工具：
   - [pixi](https://github.com/prefix-dev/pixi) 用于管理 conda 配方
   - [rattler-build](https://github.com/prefix-dev/rattler-build) 用于构建 conda 包

2. **安装项目依赖**  
   在项目根目录下运行：
   ```bash
   pixi install
   ```

3. **构建包**  
   执行以下命令构建 conda 包：
   ```bash
   rattler-build build
   ```
   构建完成的包将保存在 `output` 目录下。

## GitHub Actions 自动发布

本仓库配置了 GitHub Actions 工作流，当推送以 `v` 开头的标签时，会自动执行以下步骤：

- **检出代码**：从 GitHub 检出仓库代码
- **配置 Miniconda**：创建 Miniconda 环境并设置 conda-forge 通道
- **安装构建工具**：安装 `rattler-build`（从 conda-forge）和 `pixi`
- **构建包**：使用 `rattler-build build` 构建 conda 包
- **创建发布**：自动创建 GitHub Release 并上传构建好的 conda 包

## 关于 sbepp

**sbepp** 是一个零开销的 C++ 实现的 FIX Simple Binary Encoding (SBE)。它由两部分组成：

- `sbeppc`：模式编译器，生成仅头文件的 C++ 代码
- `sbepp`：仅头文件的支持库

主要特点：
- 快速，生成与手写代码相同的汇编
- 生成的代码只需要 C++11，除了 `sbepp` 本身外没有其他依赖
- 随机访问 API，可以按任意顺序访问字段
- 基于游标的 API，以前向方式高效处理复杂消息
- 轻量级，从不分配内存，大多数对象只存储一个指针
- 方便的 STL 风格接口
- 在 C++20 中支持 `constexpr` 编码/解码
- 从不更改模式名称，没有 `get_FieldName()`-类似的函数
- 通过特性提供所有 XML 模式信息

## 参与贡献

如果你有任何问题或建议，欢迎提交 Issue 或 Pull Request。

## 许可证

MIT 许可证
