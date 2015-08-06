#!/usr/bin/env fish

function purify
  for img in *.jpg
    mogrify -normalize -level 10%,90% -colorspace gray -brightness-contrast 5x20 $img
  end
end
