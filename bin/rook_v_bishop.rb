#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.expand_path(File.join('..', 'lib'), __dir__))

require 'board'

puts Board.new.to_s
