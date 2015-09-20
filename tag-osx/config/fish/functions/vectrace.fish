#!/usr/bin/env fish

function vectrace
  convert $argv bmp:- | potrace --output output.eps
end
