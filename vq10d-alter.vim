"= 10 Copy
"== 20 Copying Objects
"=== 60 Functions
function! VimQiuyCopy(...)
    let objecta   = a:0 >= 2 ? a:2 :0
    echo objecta
    if objecta == "line"
        echo "this is a line"
    elseif objecta == "word"
        echo "thi is a word"
    elseif objecta == "paragraph"
        echo "thi is a paragraph"
    else
        echo "baaa!"
    endif
    " let clobject = (object == "line") ? "yy": "dd"
    " if request == copy
        " if object == "line"
        "     let clobject = "yy"
        " elseif
        "     let clobject = "dw"
        " endif
    " endif
    " let clbase     = "ui"
    " let clup       = "k"
    " let cldown     = "j"
    " let clprevious = "h"
    " let clnext     = "l"
    " execute "normal!".5.clup
    " execute "normal! inowwriting\<ESC>"
    " execute "normal!".cldown
    " execute "normal!".objecta
    " execute "normal!" . clobject
    " echo clup "moved" 5.cldown
endfunction
"== 50 Environment
"==== 50 Arguments
function Func(foo, ...)
  if a:0 < 1
    let bar = "Unspecified bar"
  else
    let bar = a:1
  endif
  if a:0 < 2
    let baz = "Unspecified baz"
  else
    let baz = a:2
  endif
  echo a:foo
  echo bar
  echo baz
endfunction
"= 10 Delete
"== 20 Delete Text Objects
    " Delete unwanted whitespace at the end of lines
        Plug 'https://github.com/vim-scripts/DeleteTrailingWhitespace',
"= 10 Edit
    " Improved handling of '.' repeat function with other plugins
        Plug 'http://github.com/tpope/vim-repeat'
"== 20 Edit Objects
"=== 10 Edit Indentation
    " Provides text objects to act on a block of indentation whitespace Based
    " on the indentation of the current line.
    " Depends on https://github.com/kana/vim-textobj-user
        Plug 'https://github.com/glts/vim-textobj-indblock',
            \ { 'on': 'TextobjIndblockDefaultKeyMappings' }
"=== 10 Edit Words
    " toggle words like:'true'=>'false', 'True'=>'False' etc
        Plug 'https://github.com/vim-scripts/toggle_words.vim',
            \ { 'on': 'ToggleWord' }
"=== 10 Edit Parentheses
    " Sophisticated editing with parentheses
    " // TODO get the hang of function
        Plug 'https://github.com/tpope/vim-surround'
    " Autoclose parentheses
        Plug 'http://github.com/Townk/vim-autoclose'
            " \ { 'on': ['AutoCloseOff',
            " \ 'AutoCloseOn',
            " \ 'AutoCloseToggle'] }
"=== 10 Edit Comments
    Plug 'https://github.com/tomtom/tcomment_vim',
        \ { 'on': 'TComment' }
"== 60 Editing By Language
    " Helps to end certain structures automatically
        Plug 'https://github.com/tpope/vim-endwise'
            " \ { 'for': 'tex' }
"=== 60 Latex
    Plug 'https://github.com/coot/atp_vim',
            " \ { 'for': ['latex','tex'] }
    " Seemingly included with apt_vim
        " Plug 'https://github.com/LaTeX-Box-Team/LaTeX-Box'
            " \ { 'for': ['latex','tex'] }
"= 10 Insert
"== 10 Snippets
    " Add templates in a dynamic and extensible manner
        Plug 'http://github.com/sirver/ultisnips'
            " \ { 'on': ['UltiSnipsEdit',
            " \ 'UltiSnipsAddFileType'] }
"= 10 Paste
    " Greater flexibility re how a yank is pasted
    " // TODO learn mapping habits and contexts
            Plug 'http://github.com/vim-scripts/UnconditionalPaste'
    " Buffer full of available pastes
        Plug 'https://github.com/vim-scripts/YankRing.vim'
"== 60 Functions
"=== 60 Plug Bundles Paste Function
    function! MyFunc()
    " if BufFile = **/60_Plugins/**
        " let m = getcwd()
        " echo m
    " for ascertaining whether working on plugins
        let plugins_folder     = '60_System/60_Plugins'
        let plugins_production = 'production'
        let buffer_folder      = expand('%:p')
    " for ascertaining whether paste relates to a vim
    " plugin address
        let github_address     = 'github.com'
        let vimscripts_address = 'vim.org'
        let paste_buffer       = getreg('+')
    " For testing the folder concerns plugins
    " buffer_folder =~ plugins_folder ? echo true : echo false
    if buffer_folder =~ plugins_folder
        let folder_pass = 1
        else
        let folder_pass = 0
    endif
    " For testing the url paste concerns a vim plugin:
        if paste_buffer =~ github_address
        " if buffer_folder =~ plugins_folder
            let url_pass = 1
        else
            let url_pass = 0
            " return a:url_pass
        endif
    " Print results
        if folder_pass && url_pass == 1
            execute "normal! oPlug \'\'\<Esc>\"+P=="
            " echo 'success'
        else
            execute "normal! p"
            " echo 'boo'
        endif
        " echo 'next' url_pass
        " echo folder_pass == url_pass ? 'poo' : 'taa'

        " echo folder_pass 'next' url_pass
        " if n=~ '60_System/60_Plugins/production'
    "     if o=~ 'github.com'
    "         return test
    "     else
    "         echo 'not github'
    "     endif
        " else
        "     nnoremap p inb UltiSnips#ExpandSnippet<ESC>P
        "     echo n
        "     echo 'in production folder'
        "     echo o
        " else
        "     echo 'not in production folder'
        " endif
        " if m
            " :pwd<CR>
            " echo 'this is a test'
            " let m = visualmode()
        " if m ==# 'v'
        "     echo 'character-wise visual'
        " elseif m == 'V'
        "     echo 'line-wise visual'
        " elseif m == "\<C-V>"
        "     echo 'block-wise visual'
        " endif
    endfunction
"= 10 Replace
"== 10 Substitute
    " Create text transformation mappings and commands
    " TODO See if 'on' conditional can be returned
        Plug 'https://github.com/vim-scripts/TextTransform'
        " , {
            " \ 'on': ['call TextTransform#MakeMappings',
            " \ 'call TextTransform#MakeCommand',
            " \ 'call TextTransform#MakeSelectionCommand'] }
    " Easily search for, substitute,
    " and abbreviate multiple variants of a word
    " Not comfortable using yet
    Plug 'https://github.com/tpope/vim-abolish',
        \ { 'on': ['Abolish',
        \ 'Subvert'] }
    " Find-N-Replace helper free of regular expressions
    " With live preview
    " Test if functional
    " Test if correct activation part
    " Perhaps not required given vim-abolish
        Plug 'https://github.com/junegunn/vim-fnr' ",
            " \ { 'on': 'VNR' }
"= 40 Movement
    " Killer drag visuals block plugin
        Plug 'https://github.com/gavinbeatty/dragvisuals.vim'",
            " \ { 'on': '<C-V>' }
" Edit
    " Provides language integration with LanguageTool toolset
        Plug 'https://github.com/vim-scripts/LanguageTool'
"= 40 Movement
    " Adds vertical move motions to vim
        Plug 'https://github.com/bruno-/vim-vertical-move'
