#! /usr/local/bin/ruby
# Work with family_names.txt
family_names = File.read(File.join(File.dirname(__FILE__),'family_names.txt')).split(' ')
teacher_names = ['老师', '大嘴']
# 可根据人数调整此参数
num_of_classmates = 47
id_list = (1..num_of_classmates).to_a
# 退出的同学学号
dropouts = [29, 45, 34]
id_list = id_list - dropouts
Dir.glob("#{ARGV[0]}/**/*") .each do |file_name|
  if file_name.scan(/\d{1,}号/)[0].length==2:
    id = '0'+file_name.scan(/\d{1,}号/)[0][0]
  else
    id = /\d{2,}/.match(file_name).to_s[-2..-1]
  puts 'WARNING: repeated id: ',file_name unless id_list.include?(id.to_i)
  id_list.delete(id.to_i)
  name = file_name.delete('号').scan(/[\u4e00-\u9fa5]{2,}/).select { |text| (text.length < 4 ) && (family_names.include?(text[0])) unless teacher_names.include?(text[1..-1]) }
  puts 'WARNING: more than one names got: ', name if name.size > 1
  new_name = file_name.sub(File.basename(file_name), id.to_s + '-' + name.join('-') + File.extname(file_name))
  File.rename(file_name, new_name)
end
if id_list.empty?
  puts '作业已收齐'
else
  puts '没交作业的同学学号：'
  puts id_list.to_s
end
