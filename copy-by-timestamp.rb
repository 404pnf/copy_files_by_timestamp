# -*- coding: utf-8 -*-
require 'find'
require 'date'
require 'set'
require 'fileutils'

# USAGE: ruby script.rb inputdir outpudir date

puts "USAGE: ruby script.rb inputdir outputdir 20121202\n
      这条命令会将所有2012年12月2日后变更过的文件从inputdir复制到outputdir。会保留目录结构的。"  unless ARGV.size == 3
                                                                                                    
src_dir, out_dir, date = ARGV

# 检查一下日期输入是否正确，这个错了最不容易察觉
puts "日期格式必须是yyymmdd，比如20121015"  unless date =~ /[0-9]{8}/

# 绝对目录
abs_src_dir = File.expand_path src_dir
abs_out_dir = File.expand_path out_dir

# 如果输出的目录不存在就创建它吧
FileUtils.mkdir abs_out_dir unless File.exists? abs_out_dir

# 扫一下所有文件吧
all_files = Find.find(File.expand_path src_dir)

# 转换时间 
# 疯狂啊，我搞不明白time和dateteime
# 如果直接 time = Time.new(date).to_i 返回的数字是一个巨大的数字绝对不是epoch time的值
# 这个问题浪费了我半个多小时
date_str = DateTime.parse(date)
time = date_str.to_time.to_i
p "复制#{date_str}之后更新的文件到#{abs_out_dir}"

# 找到需要复制的
files_to_copy = all_files.to_a.select {|f| f if File.file? f and File.mtime(f).to_i > time}

# 目标文件的名字
dest_files = files_to_copy.map {|f| File.dirname(f).sub(abs_src_dir, abs_out_dir)}

# 创建那些不存在的目标目录
dirs_to_make = dest_files.reduce(Set.new){|s, i| s << i}.sort
dirs_to_make.each {|dir| FileUtils.mkdir_p dir}

# zip it up
file_tuples = files_to_copy.zip dest_files

# get her done
file_tuples.each {|src, dest| FileUtils.cp src, dest, :verbose => true}
