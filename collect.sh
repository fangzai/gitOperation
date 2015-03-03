#!/bin/bash
#平时收集的字符处理代码
cat -n upCommand |sed 's/^[ \t]*//g'  |grep "^1"   # 显示某行文本，这里显示的是第一行
sed -n '3p' upCommand    #完成的也是这个功能
head -3 upCommand | tail -1


#删除指定行号的那一行文本
sed 1d file1  #表示删除第一行

# 在一个文本的开头添加文本 可用cat实现
cat - file1 <<< "my Title" > file1.new  #添加后重定向到新的文本中

#显示文本的行数
wc -l file1 | awk '{print $1}'   # wc可以统计文件或者I/O中的单词量

#字符转换过滤器 tr
ls -l | tr 'a-z' 'A-Z'   #大小写转换
echo "abcdef" | tr -d 'b-d' # -d选项删除字符

#查询某个文件夹里面文件名字包含特定字符的文件
#例如查询 /home/ht/shLearning/目录下名字包含最后一个～字符的
 find /home/ht/shLearning/ -name '*~'
#当然后面也可以加上exec选项
find /home/ht/shLearning/ -name '*~' -exec rm -f {} \;   #找到之后删掉 不知道为什么后面就是要加 \;

#将当前目录的文件拷贝到另一个文件夹中
ls . | xargs -i -t cp ./{}  newfolder  #newfolder就是目标文件夹 

#kill掉指定进程
ps ax | grep "$PROCESS_NAME" | awk '{print $1}' | xargs -i kill {} 2&>/dev/null
# 第一条命令，显示所有进程信息，$PROCESS_NAME就是你想kill的进程
# awk输出第一列，后面的dev/null表示如果kill错误也不输出日志

#从网页上下载文件
wget -r ftp://ftp.xyz24.net/~bozo/project_files/ -O $SAVEFILE
#-r 选项将会递归的从指定站点上下载所有连接.



