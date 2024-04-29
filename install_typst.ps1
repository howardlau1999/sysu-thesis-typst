# Install Rustup with Powershell
$OutputEncoding = [System.Text.Encoding]::UTF8

# Use TUNA rustup mirror
$Env:RUSTUP_DIST_SERVER = "https://mirrors.tuna.tsinghua.edu.cn/rustup"

# Check if Rust is already installed
if (Get-Command cargo -ErrorAction SilentlyContinue) {
  Write-Output "检测到 Rust 已安装，尝试更新。"
  rustup update
}
else {
  # Download the installer
  Write-Output "下载 Rustup 安装程序..."
  Invoke-WebRequest -Uri https://win.rustup.rs/x86_64 -OutFile $Env:Temp/rustup-init.exe

  # Run the installer
  Write-Output "运行 Rustup 安装程序..."
  Start-Process -FilePath $Env:Temp/rustup-init.exe -Args -y

  # Add Rustup to the PATH
  Write-Output "将 Rustup 添加到 PATH 环境变量..."
  $env:Path += ";$env:USERPROFILE\.cargo\bin"

  # Install the stable toolchain
  rustup toolchain install stable

  # Write cargo config file
  Write-Output "写入 cargo 配置文件..."

  # Check if the .cargo directory exists
  if (!(Test-Path $env:USERPROFILE\.cargo)) {
    New-Item -ItemType Directory -Path $env:USERPROFILE\.cargo
  }

  # Check if the config file exists
  if (Test-Path $env:USERPROFILE\.cargo\config) {
    Write-Output "检测到 cargo 配置文件已存在，跳过写入。"
  }
  else {
    # Write the config file
    New-Item -ItemType File -Path $env:USERPROFILE\.cargo\config
    Set-Content -Path $env:USERPROFILE\.cargo\config -Value @'
[source.crates-io]
replace-with = "tuna"

[source.tuna]
registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"
'@
  }
}

# Run cargo to install the typst binary
Write-Output "运行 cargo 安装 typst 二进制文件..."
cargo install --git https://github.com/typst/typst.git typst-cli

# Check if the binary is installed
if (Get-Command typst -ErrorAction SilentlyContinue) {
  Write-Output "安装成功！"
}
else {
  Write-Output "安装失败！"
}

# Wait for user input
Write-Output "按任意键退出..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
