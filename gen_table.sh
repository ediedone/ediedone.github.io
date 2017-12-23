#!/bin/bash
# del lines after </table>
sed '/<\/table>/{n;N;N;N;d}' ~/temp/stock.html > temp
# del lines before <table> and width setting for first table
sed -i '23,28d;1,21d' temp
sed -i '/ddd/d' temp
sed -ri 's/span=([0-9]+)/span="\1" /' temp
sed -ri 's/=middle/="middle"/' temp

sed -i '/<tr>/{N;/ttt/{s/ttt//
s/td/th/g
i\</table>
i\<br />
i\<br />
i\<table>
}}' temp

sed -i '/hhh/{s/hhh//;s/td/th/g}' temp

mv temp ~/temp/stock_ok.html
