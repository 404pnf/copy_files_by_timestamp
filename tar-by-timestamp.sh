
# 将inputdir文件夹中300天内更新了的文件打包到outputdir中

tar cvf /path/to/outputdir/recent-300-days.tar $(find /path/to/inputdir -type f -mtime -300)
