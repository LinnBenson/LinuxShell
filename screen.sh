#!/bin/bash

echo -e "\033[1m\033[34mScreen 会话管理\033[0m"
echo "==============="
echo "1. 打开新会话"
echo "\033[36m=> 运行中的会话"
list=$(screen -ls | grep -o '[0-9]\+\.[^[:space:]]\+')
if [ -n "$list" ]; then
    i=1
    echo "$list" | while read s; do
        echo -e "s${i}. ${s}"
        i=$((i + 1))
    done
else
    echo -e "当前未启动 screen 会话"
fi
echo ""

read -p "请选择需要执行的功能: " choice
case "$choice" in
    1)
        read -p "请输入会话名称: " name
        if [ -z "$name" ]; then
          echo -e "\033[41m[Error] 会话名称不能为空\033[0m"
          exit 1
        fi
        screen -S "$name"
    ;;
    *) echo -e "\033[41m[Error] 当前选择不存在！\033[0m";;
esac
