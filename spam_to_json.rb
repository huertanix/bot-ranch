#!/usr/bin/env ruby
# This extracts spam from a line-deliminated list of SMS messages from some dude in Brazil
# This was made for Art Hack Day, obvs

require 'rubygems'
require 'json/pure'

raw_spams = Array.new

begin
  File.open('SMSSpamCollection') do |f|  
    while (line = f.gets)
      if line.start_with?('spam')
        raw_spams.push(line.delete 'spam')
      end
    end
  end
rescue => err
  puts "Exception: #{err}"
  err
end

json_spams = JSON.generate(raw_spams)

begin
  File.open('spam.json', 'w') { |f| f.write(json_spams) }
rescue => err
  puts "Exception: #{err}"
  err
end