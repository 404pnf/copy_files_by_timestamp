# shell脚本递归复制某目录中某个日期之内的所有文件到另外一个文件夹
# 不包括空目录，是不是？

# 这个脚本还没有写好
# 在bash中实现比我想象的难很多
# 主要是我不会保留目录结构
# 这里是个开始
# 参考：  http://unix.stackexchange.com/questions/33486/how-to-copy-only-matching-files-preserving-subdirectories
ls | grep 2 | xargs -n1 -t -i cp -R {} ./testdirTwo/{}
