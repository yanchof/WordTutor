require 'optparse'
opt = OptionParser.new

OPTS = {} #オプション記録

#-f :f 入力ファイルパス
opt.on("-f:") { |v|
  OPTS[:f] = v
}

#-c :c 出力ファイルパス
opt.on("-c:") { |v|
  OPTS[:c] = v
}

#--mode モード
opt.on("--mode:") { |v|
  OPTS[:mode] = v
}

opt.parse!(ARGV)

if OPTS[:f] == nil then
  puts("error: No input file.")
  exit(1)
end
inputfilepath = OPTS[:f]

#if output file was not named
if OPTS[:c] == nil then
  puts("output file wasn't named")
  outputfilepath = "output.html"
else
  outputfilepath = OPTS[:c]
end

if OPTS[:mode] == nil then
  mode = 0
else
  mode = OPTS[:mode]
end

require './dataload.rb'
worddata = dataload(inputfilepath)

require './output.rb'
rawpath = outputfilepath.split('.')
output(path: rawpath[0]+"_answer."+rawpath[1], data: worddata, mode: 0)
rawpath = outputfilepath.split('.')
output(path: rawpath[0]+"_problem1."+rawpath[1], data: worddata, mode: 1)
rawpath = outputfilepath.split('.')
output(path: rawpath[0]+"_problem2."+rawpath[1], data: worddata, mode: 2)
