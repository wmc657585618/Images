#!/bin/sh

folder=${SRCROOT}

temp_name_file="name.text"

: > $temp_name_file

# 在工程中查找 .imageset结尾的文件
for f in $(find "${folder}" \( -name "*.imageset" \)); do

# 去前缀
temp_file=`basename ${f} *.imageset`

# 去后缀
temp_file=${temp_file%.*}

# 写到文件保存
echo ${temp_file} >> $temp_name_file

done

# 去重
temp_file="temp.text"

sort -u $temp_name_file >> $temp_file

# 按行读取
h="${SRCROOT}/ShellImagesDemo/UIImage+Assets.h"
m="${SRCROOT}/ShellImagesDemo/UIImage+Assets.m"

: > $h

: > $m

# 预存 .h
echo -e "#import <UIKit/UIKit.h>\
\n\n\
@interface UIImage (Assets)\n" >> $h

#.m
echo -e "#import \"UIImage+Assets.h\"\n\n\
@implementation UIImage (Assets)\n" >> $m

for line in $(cat "temp.text")
do

name=${line}

#echo "${name}\n"

echo -e "+ (UIImage *)${name};\n" >> $h

echo -e "+ (UIImage *)${name} {\n\
\n\
\treturn [UIImage imageNamed:@\"${name}\"];\n\
}\n"  >> $m

done

echo "@end" >> $h

echo "@end" >> $m

# 删除临时文件
rm -f $temp_file

rm -f $temp_name_file

