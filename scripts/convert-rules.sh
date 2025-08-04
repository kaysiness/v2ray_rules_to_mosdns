#!/bin/bash
set -e # 遇到错误立即退出

## ----- geosite ----- ##
# 转换 geosite 类别函数
convert_geosite_category() {
  local category="$1"
  echo "Converting geosite category: $category"
  ./temp/mosdns v2dat unpack-domain -o rules "temp/geosite.dat:$category"
}
# 要转换的 geosite 类别列表
categories_domain=(
  "cn"
  "gfw"
  "geolocation-!cn"
  "category-ads-all"
)

## ----- geoip ----- ##
# 转换 geoip 类别函数
convert_geoip_category() {
  local category="$1"
  echo "Converting geoip category: $category"
  ./temp/mosdns v2dat unpack-ip -o rules "temp/geoip.dat:$category"
}
# 要转换的 geoip 类别列表
categories_ip=(
  "cn"
  "private"
)

# 清理并创建规则目录
mkdir -p rules

# 执行转换 geosite
for domain in "${categories_domain[@]}"; do
  convert_geosite_category "$domain"
done

# 执行转换 geoip
for ip in "${categories_ip[@]}"; do
  convert_geoip_category "$ip"
done

echo "Conversion completed. Files are stored in the 'rules' directory."