require 'html2markdown'
require 'fileutils'

file = ARGV[0]

str= File.open(file).read

html = HTMLPage.new :contents => str

mdwn = html.markdown

p mdwn
