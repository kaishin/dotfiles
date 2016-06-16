#!/usr/bin/env fish

function vectrace
  set fileName (basename $argv | cut -d. -f1)
  convert $argv bmp:- | potrace --output ./$fileName.eps
end
