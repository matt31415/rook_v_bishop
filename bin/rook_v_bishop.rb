#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.expand_path(File.join('..', 'lib'), __dir__))

require('rook_v_bishop_game')

puts RookVBishopGame.new.play
