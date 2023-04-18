# sysu-thesis-typst

中山大学学位论文 Typst 模板，项目基于 [PKUTHSS-Typst](https://github.com/lucifer1004/pkuthss-typst) 重构。

输出成品文件预览： [thesis.pdf](https://liuhaohua.com/sysu-thesis-typst/thesis.pdf)

## 使用方法

### Windows 用户

1. 下载本仓库，或者使用 `git clone https://github.com/howardlau1999/sysu-thesis-typst` 命令克隆本仓库。
2. 右键 `install_typst.ps1` 文件，选择“用 Powershell 运行”，等待 Typst 安装完成。
3. 根据 [Typst 文档](https://typst.app/docs/)，参考 [项目结构](#项目结构) 中的说明，按照你的需要修改论文的各个部分。
4. 双击运行 `compile.bat`，即可生成 `thesis.pdf` 文件。

### Linux 用户

1. 下载本仓库，或者使用 `git clone https://github.com/howardlau1999/sysu-thesis-typst` 命令克隆本仓库。
2. 安装 Rust 工具链以及 Typst：

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
cargo install --git https://github.com/typst/typst.git
```

3. 根据 [Typst 文档](https://typst.app/docs/)，参考 [项目结构](#项目结构) 中的说明，按照你的需要修改论文的各个部分。
4. 执行 `make` 命令，即可生成 `thesis.pdf` 文件。

## 项目结构

### 主要文件

- `info.typ` 文件中包含论文的基本信息，包括作者、学位、导师、学位论文题目等。
- `custom.typ` 文件中包含论文的自定义设置，包括行距，字体等。
- `thesis.typ` 文件是论文的主体，包含论文的各个章节。在添加或者删除章节文件后，需要同步修改这个文件中的 `#include` 命令。
- `template.typ` 文件是论文的模板，包含论文的各个部分的格式。一般不需要修改。

### 文件夹

- `chapters` 文件夹包含了论文的各个章节文件，你可以自由地增加或删除章节文件，按你自己需要的方式组织文件。在添加或删除文件后，需要同步修改 `thesis.typ` 文件中的 `#include` 命令。
- `templates` 文件夹包含了论文的各个部分的模板文件，你可以自由地增加或删除模板文件，按你自己需要的方式组织文件。在添加或删除文件后，需要同步修改 `template.typ` 文件中的 `#include` 命令。欢迎贡献新的模板文件。
- `functions` 文件夹包含了模板使用到的各种自定义辅助函数，如果你想贡献代码，可以在这个文件夹中添加新的辅助函数。
- `fonts` 文件夹包含了模板使用到的字体文件，你可以按需要添加或者删除字体文件。在添加或删除文件后，可以运行 `typst --font-path fonts fonts` 查看 Typst 检测到的字体文件。
- `bibs` 文件夹包含了论文的参考文献文件，你可以按需要添加或者删除参考文献文件，目录结构没有特殊需求。
- `images` 文件夹包含了论文中使用到的图片文件，你可以按需要添加或者删除图片文件，目录结构没有特殊需求。`vi` 文件夹包含了校徽的矢量图文件。