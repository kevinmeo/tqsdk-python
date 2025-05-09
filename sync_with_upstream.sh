#!/bin/bash

# 切换到脚本所在目录
cd "$(dirname "$0")"

# 获取上游仓库的更新
echo "正在获取上游仓库更新..."
git fetch upstream

# 检查是否有更新
if [ $(git rev-parse HEAD) != $(git rev-parse upstream/master) ]; then
    echo "发现新更新，正在合并..."
    git merge upstream/master
    echo "更新完成！"
else
    echo "当前已是最新版本"
fi 