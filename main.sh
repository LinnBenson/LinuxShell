#!/bin/bash

echo -e "\033[1m\033[34mTodu Shell 服务器管理\033[0m"
echo -e "\033[34mVersion 1.0.0\033[0m"
echo "==============="
echo "1. Screen 会话管理"
echo ""

read -p "请选择需要执行的功能: " choice
echo ""
case "$choice" in
    1) bash <(curl -Ls https://raw.githubusercontent.com/LinnBenson/LinuxShell/main/screen.sh);;
    *) echo -e "\033[41m[Error] 当前选择不存在！\033[0m";;
esac
