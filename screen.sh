#!/bin/bash
set -e

echo -e "\033[1;34mScreen 会话管理\033[0m"
echo "==============="
echo "1. 打开新会话"
echo "2. 所有会话信息"
echo -e "\033[36m=> 运行中的会话\033[0m"
mapfile -t sessions < <(screen -ls | grep -o '[0-9]\+\.[^[:space:]]\+' || true)
if [ ${#sessions[@]} -gt 0 ]; then
  for i in "${!sessions[@]}"; do
    idx=$((i + 1))
    echo "s${idx}. ${sessions[$i]}"
  done
else
  echo "当前未启动 screen 会话"
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
  2) screen -ls;;
  s[0-9]*)
    n=${choice#s}
    idx=$((n - 1))
    sess=${sessions[$idx]}
    if [ -z "$sess" ]; then
      echo -e "\033[41m[Error] 会话不存在\033[0m"
      exit 1
    fi
    # 会话子菜单
    echo ""
    echo -e "\033[1;34m会话：${sess}\033[0m"
    echo "==============="
    echo "1. 恢复会话"
    echo "2. 关闭会话"
    echo ""
    read -p "请选择操作: " act
    case "$act" in
      1) screen -r "$sess";;
      2)
        screen -X -S "$sess" quit
        echo -e "\033[32m会话 ${sess} 已关闭！\033[0m"
        ;;
      *) echo -e "\033[41m[Error] 此操作不存在！\033[0m";;
    esac
    ;;
  *) echo -e "\033[41m[Error] 当前选择不存在！\033[0m";;
esac
