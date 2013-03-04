

# 需求：

1. 复制文件夹A中所有某一日后更新过的文件到文件夹B中。
2. 需要保留目录结构。
3. 不包括空文件夹，即使它的时间戳也符合要求，是不是？

# 说明：

两个脚本简单测试都通过了。但我对ruby更有信心一点。因为bash的是连抄带蒙的。

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

ref:
<http://unix.stackexchange.com/questions/33486/how-to-copy-only-matching-files-preserving-subdirectories>
<http://stackoverflow.com/questions/1650164/bash-copy-named-files-recursively-preserving-folder-structure>







