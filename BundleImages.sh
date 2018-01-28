#!/bin/sh

bundle=${SRCROOT}/ShellImagesDemo/BundleImages

# h
h=${SRCROOT}/ShellImagesDemo/UIImage+Bundle.h

# m
m=${SRCROOT}/ShellImagesDemo/UIImage+Bundle.m

# 清空
: > $h

: > $m

# .h
echo -e "#import <UIKit/UIKit.h>\
\n\n\
@interface UIImage (Bundle)\n" >> $h

# .m
echo -e "#import \"UIImage+Bundle.h\"\n\n\
@implementation UIImage (Bundle)\n" >> $m

temp_name_file="name.text"

# 查找文件
for f in $(find "${bundle}" \( -name "*.png" \)); do

# 去前缀
temp_file=`basename ${f} *.png`

# 去后缀
temp_file=${temp_file%.*}

# 写到文件保存
echo ${temp_file} >> $temp_name_file

done

# 去重
temp_file="temp.text"

sort -u $temp_name_file >> $temp_file

# 读取图片名称
for line in $(cat "temp.text"); do

name=${line}

# 写到 h
echo -e "+ (UIImage *)${name};\n" >> $h

# 写到 m
echo -e "+ (UIImage *)${name} {\n\
\n\
\tNSString *path = [[NSBundle mainBundle] pathForResource:@\"${name}\" ofType:@\"png\"];\
\n\n\
\treturn [UIImage imageWithContentsOfFile:path];\n\
}\n"  >> $m

done

echo "@end" >> $h

echo "@end" >> $m

# 删除临时文件
rm -f $temp_file

rm -f $temp_name_file





