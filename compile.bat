@echo off 
chcp 65001>nul
set Path=%cd%\;%Path%
set TYPST_FONT_PATHS=%cd%\fonts
echo 编译中……
typst compile --font-path fonts thesis.typ
echo 命令运行完毕，按任意键退出
pause>nul