
"autocmd f * "You have offered respect to shomen Bram"

" --- Custom Quit Function ---"
function! DelayedQuit(command)
    " 1. Diplay the message
    echo "You have bowed to shomen Brem as you successfully found a way to exit Vim and doing so."
    
    " The redraw! command forces Vim to update the screen 
    " so the echo message is visible before the timer starts.
    redraw! 

    echo "You have bowed to shomen Brem as you successfully found a way to exit Vim and doing so."
    " 2. Start a timer to run the quit command
    " The time is in milliseconds (1500ms = 1.5 seconds).
    " The command is executed *after* the delay.
    call timer_start(1500, {-> execute(a:command, '')}, {'repeat': 1})
endfunction

" --- Remap Quit Commands ---
" Map the common quit commands to call the custom function.
" <C-u> is used to clear any preceding count.

cnoreabbrev <expr> f (getcmdtype() == ':' && getcmdline() == 'f') ? '<c-u>echo "You have offered respect to shomen Bram"' : 'f'
" :q (Quit)
cnoreabbrev <expr> q (getcmdtype() == ':' && getcmdline() == 'q') ? '<c-u>call delayedquit("q")' : 'q'
" :q! (Force Quit)
cnoreabbrev <expr> q! (getcmdtype() == ':' && getcmdline() == 'q!') ? '<c-u>call DelayedQuit("q!")' : 'q!'
" :wq (Write and Quit)
cnoreabbrev <expr> wq (getcmdtype() == ':' && getcmdline() == 'wq') ? '<c-u>call DelayedQuit("wq")' : 'wq'
" :x (Write and Quit)
cnoreabbrev <expr> x (getcmdtype() == ':' && getcmdline() == 'x') ? '<c-u>call DelayedQuit("x")' : 'x'
" :qa (Quit All)
cnoreabbrev <expr> qa (getcmdtype() == ':' && getcmdline() == 'qa') ? '<c-u>call DelayedQuit("qa")' : 'qa'

" Additionally, map Normal mode shortcuts
" ZZ (Write and Quit)
nnoremap ZZ :call DelayedQuit("wq")<CR>
" ZQ (Force Quit)
nnoremap ZQ :call DelayedQuit("q")<CR>

