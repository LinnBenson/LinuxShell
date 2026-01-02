#!/bin/bash

echo -e "\033[1m\033[34mScreen 会话管理\033[0m"
echo "==============="
echo "1. 打开新会话"
echo ""

read -p "请选择需要执行的功能: " choice
case "$choice" in
    1) wget -qO- https://shell.todu.io/screen.sh | bash;;
    *) echo -e "\033[41m[Error] 当前选择不存在！\033[0m";;
esac
