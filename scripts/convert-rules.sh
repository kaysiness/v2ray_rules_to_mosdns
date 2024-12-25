#!/bin/bash

# 转换函数
convert_category() {
    local category="$1"
    local dat_file="$2"
    local suffix="$3"
    echo "Converting category: $category from $dat_file"
    ./temp/v2ctl geosite --dat="$dat_file" --category="$category" | \
        grep -Ev '^include:' | \
        grep -Ev '^$' | \
        grep -Ev '^#' > "rules/${category}_${suffix}.txt"
}

# 要转换的类别列表
categories=(
    "netflix"
    "disney"
)

# 清理并创建规则目录
mkdir -p rules

# 执行转换
for category in "${categories[@]}"; do
    convert_category "$category" "temp/geosite.dat" "domain"
    convert_category "$category" "temp/geoip.dat" "ip"
done

echo "Conversion completed. Files are stored in the 'rules' directory."