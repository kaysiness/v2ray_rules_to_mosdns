#!/bin/bash

set -e  # 遇到错误立即退出

# 转换 geosite 类别函数
convert_geosite_category() {
    local category="$1"
    local dat_file="$2"
    echo "Converting geosite category: $category from $dat_file"
    ./temp/v2ray geosite --dat="$dat_file" --category="$category" | \
        grep -Ev '^include:' | \
        grep -Ev '^$' | \
        grep -Ev '^#' > "rules/${category}.txt"
}

# 要转换的类别列表
categories=(
    "netflix"
    "disney"
)

# 清理并创建规则目录
mkdir -p rules

# 执行转换 geosite
for category in "${categories[@]}"; do
    convert_geosite_category "$category" "temp/geosite.dat"
done

echo "Conversion completed. Files are stored in the 'rules' directory."
