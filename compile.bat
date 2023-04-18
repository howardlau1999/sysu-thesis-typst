@echo off 
set Path=%cd%\;%Path%
set TYPST_FONT_PATHS=%cd%\fonts
typst --font-path fonts compile thesis.typ
echo 运行结束，按任意键退出
pause>nul