#!/bin/bash

# 使用find查找当前目录及其子目录下所有的 .jpg 和 .jpeg 文件
find . -type f \( -name "*.jpg" -o -name "*.jpeg" \) -print0 | while read -d $'\0' file
do
    # 确保文件存在且为普通文件
    if [ -f "$file" ]; then
        # 使用jpegoptim进行无损优化，这里主要移除元数据
        jpegoptim -s -m90 "$file"
        echo "已优化: $file"
    fi
done

echo "所有JPEG图片的元数据已移除，完成优化。"
