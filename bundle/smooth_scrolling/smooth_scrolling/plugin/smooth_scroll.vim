
function SmoothScroll(up)
  if a:up
    let scrollaction="k"
  else
    let scrollaction="j"
  endif
  exec "norm " . scrollaction
  redraw
  let counter=1
  while counter<&scroll
    let counter+=1
    sleep 10m
    redraw
    exec "norm " . scrollaction
  endwhile
endfunction

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i

