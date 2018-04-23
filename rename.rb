#! /usr/local/bin/ruby
# coding:utf-8
family_names=File.read("family_names.txt").split(" ")
teacher_names=["老师","大嘴"]
# 可根据人数调整此参数
num_of_classmates = 47
id_list = (1..num_of_classmates).to_a
Dir.glob("#{ARGV[0]}/**/*") .each do |file_name|
  id = /\d{2,}/.match(file_name).to_s[-2..-1]
  id_list.delete(id.to_i)
  name = file_name.sub("号","").scan(/[\u4e00-\u9fa5]{2,3}/).select {|text| family_names.include?(text[0]) unless teacher_names.include?(text[1..-1])}
  puts "WARNING: more than one names got: ",name if name.size>1
  new_name = file_name.sub(File.basename(file_name), id.to_s + "-" + name.join('-') + File.extname(file_name))
  File.rename(file_name,new_name)
end
puts "没交作业的同学学号："
puts id_list.to_s
