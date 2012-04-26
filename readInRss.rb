# -*- coding: utf-8 -*-
require 'rss/2.0'
require 'open-uri'
require 'fileutils'

# ref: http://rubyrss.com/

#FileUtils.mkdir "_posts"

open('http://0.0.0.0/hanyu.xml') do |http|
  response = http.read
  result = RSS::Parser.parse(response, false)
#  puts "Channel: " + result.channel.title
  result.items.each_with_index do |item, i|
    id = i-106
    title =  item.title.to_s.chomp
    # some item are blank titles
    # we cant allow this, otherwise the following gsub exits if working on a blank string, aka Nil
    # so, fill in some gibberish
    if title == nil
      title = "no title"
    end
    
    mytitle = title

    # pubdae: 2012-02-16T14:36:54+08:00-id
    pubdate = item.date.xmlschema
    # date: 2012-02-16
    date = pubdate.slice(0,10)

    content = item.description.to_s
 
    # read what's been parsed in terminaln
    puts mytitle
   
    File.open("#{date}#{id}.markdown", "w:utf-8") do |file|
      file.puts "---"
      file.puts "title: #{mytitle} "
      file.puts "author:"
      file.puts "layout: post"
      file.puts "---"
      file.puts content
    end
  end      # end each_with_index
end # end open('http://0.0.0.0/rss.xml') do |http|


