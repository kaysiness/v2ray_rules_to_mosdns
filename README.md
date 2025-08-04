使用Github Actions每日一次自動把`GeoSite.dat`和`GeoIP.dat`轉換為`mosdns v5`能使用的txt文件。

# 說明
1. 每日從[`Loyalsoldier/v2ray-rules-dat`](https://github.com/Loyalsoldier/v2ray-rules-dat/)獲取最新的`GeoSite.dat`和`GeoIP.dat`
2. 使用`mosdns v4`的`unpack`指令把以下的規則集合從dat轉換為`txt`格式
# 轉換的規則集合
## GeoSite.dat
* cn
* gfw
* geolocation-!cn
* category-ads-all

## GeoIP.dat
* cn
* private

# 感謝
* https://github.com/IrineSistiana/mosdns
* https://github.com/Loyalsoldier/v2ray-rules-dat
* https://github.com/ypxun/v2ray_rules_to_mosdns