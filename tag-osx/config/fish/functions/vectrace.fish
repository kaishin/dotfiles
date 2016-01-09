#!/usr/bin/env fish

function vectrace
  convert $argv[1] bmp:- | potrace --output $argv[2]
end
