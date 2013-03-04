

# 需求：

复制文件夹A中的所有某一日后的文件到文件夹B中。不包括空文件夹及时它的时间戳也符合要求，是不是？

# ruby脚本用法:

      ruby -w script.rb 输入文件夹 输出文件夹 日期yyyymmdd

比如：

      ruby -w script.rb inputdir outputdir 20121202

# bash脚本

      find inputdir -type f -mtime -300 | sort | xargs -n1 -t -i cp --parents {} outpudir
	  
inputdir和outputdir最好用绝对路径，如果你是把上面命令放到脚本中

-300 是复制300天之内有更新的。
+300 是复制300天之前更新的

cp的--parents这么强大了！








