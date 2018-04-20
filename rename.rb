#! /usr/local/bin/ruby
# coding:utf-8
last_name = ['方','孔','杨','胡','牛','王','陈','张','宋','董','付',
           '李','王','方','卫','孙','崔','文','钟','吴','唐','俞',
           '曾','刘','连','于','潘','黄','罗','苏','马','程','郑','蔡']
Dir.glob("#{ARGV[0]}/**/*") .each do |file_name|
  id = /\d{2,}/.match(file_name).to_s[-2..-1]
  name = file_name.scan(/[\u4e00-\u9fa5]{2,3}/).find {|text| last_name.include?(text[0])}
  new_name = file_name.sub(File.basename(file_name),id + "-" + name + File.extname(file_name))
  File.rename(file_name,new_name)
end