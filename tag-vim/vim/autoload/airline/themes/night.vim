let g:airline#themes#night#palette = {}

let s:standard = airline#themes#get_highlight2(["AirlineStandard", "fg"], ["AirlineStandard", "bg"])
let s:normal = airline#themes#get_highlight2(["AirlineNormal", "fg"], ["AirlineStandard", "bg"])
let s:modified = airline#themes#get_highlight2(["AirlineModified", "fg"], ["AirlineStandard", "bg"])
let s:insert = airline#themes#get_highlight2(["AirlineInsert", "fg"], ["AirlineStandard", "bg"])
let s:replace = airline#themes#get_highlight2(["AirlineReplace", "fg"], ["AirlineStandard", "bg"])
let s:visual = airline#themes#get_highlight2(["AirlineVisual", "fg"], ["AirlineStandard", "bg"])
let s:inactive = airline#themes#get_highlight2(["AirlineInactive", "fg"], ["AirlineStandard", "bg"])

let g:airline#themes#night#palette.normal = airline#themes#generate_color_map(s:normal, s:standard, s:standard)
let g:airline#themes#night#palette.normal_modified = airline#themes#generate_color_map(s:normal, s:modified, s:modified)

let g:airline#themes#night#palette.insert = airline#themes#generate_color_map(s:insert, s:standard, s:standard)
let g:airline#themes#night#palette.insert_modified = airline#themes#generate_color_map(s:insert, s:modified, s:modified)
let g:airline#themes#night#palette.insert_paste = airline#themes#generate_color_map(s:insert, s:standard, s:standard)

let g:airline#themes#night#palette.replace = airline#themes#generate_color_map(s:replace, s:standard, s:standard)
let g:airline#themes#night#palette.replace_modified = airline#themes#generate_color_map(s:replace, s:modified, s:modified)

let g:airline#themes#night#palette.visual = airline#themes#generate_color_map(s:visual, s:standard, s:standard)
let g:airline#themes#night#palette.visual_modified = airline#themes#generate_color_map(s:visual, s:modified, s:modified)

let g:airline#themes#night#palette.inactive = airline#themes#generate_color_map(s:inactive, s:inactive, s:inactive)
let g:airline#themes#night#palette.inactive_modified = airline#themes#generate_color_map(s:inactive, s:inactive, s:modified)

let g:airline#themes#night#palette.accents = { "red": ["#CC6666", "", 167, ""] }
