" Copy this file to your home directory and call it .gvimrc 
set ch=2		" Make command line two lines high
if version >= 500
  "set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
  " set guifont=-adobe-courier-medium-r-normal-*-*-140-*-*-m-*-iso10646-1
  " set guifont=andale\ mono\ 11
  set guifont=monospace\ regular\ 10
  " set guifont=-monotype-andale\ mono-medium-r-normal--14-100-100-100-m-80-koi8-ru
  " Switch on search pattern highlighting.
  set hlsearch

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background
  highlight Normal   guibg=grey90
  highlight Cursor   guibg=Green guifg=NONE
  highlight lCursor  guibg=Cyan guifg=NONE
  highlight NonText  guibg=grey80
  highlight Constant gui=NONE guibg=grey95
  highlight Special  gui=NONE guibg=grey95
  "e
endif


"augroup syntax
"au! BufNewFile,BufReadPost *.tmpl
"au  BufNewFile,BufReadPost *.tmpl so /home/schumack/tmpl.vim
"augroup END
"autocmd BufRead *.tmpl set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
"
"augroup syntax
"au! BufNewFile,BufReadPost *.typelist
""au  BufNewFile,BufReadPost *.typelist so /home/ic/calibre/calibre_typelist.vim
"au  BufNewFile,BufReadPost *.typelist so /home/schumack/control_work_area/calibre_dir/calibre_typelist.vim
"augroup END
"autocmd BufRead *.typelist set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
"
"augroup syntax
"au! BufNewFile,BufReadPost *.icrules,*.railmill,*.calibre,*.mgcmd,*.device,*.exclude_cells
"au  BufNewFile,BufReadPost *.icrules,*.railmill,*.calibre,*.mgcmd,*.device,*.exclude_cells so /home/ic/calibre/calibre_icrules.vim
""au  BufNewFile,BufReadPost *.icrules,*.railmill,*.calibre,*.mgcmd,*.device,*.exclude_cells so /home/schumack/control_work_area/calibre_dir/calibre_icrules.vim
"augroup END
"autocmd BufRead *.icrules,*.railmill,*.calibre,*.mgcmd,*.device,*.exclude_cells set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
"
"augroup syntax
"au! BufNewFile,BufReadPost *.ictrace
"au  BufNewFile,BufReadPost *.ictrace so /home/ic/calibre/calibre_ictrace.vim
"augroup END
"autocmd BufRead *.ictrace set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
"
augroup syntax
au! BufNewFile,BufReadPost *.lvsnet,*.net,*.sp,*.spc,*.hspice,*.dspf
"au! BufNewFile,BufReadPost *.lsi,*.net,*.sp
"au  BufNewFile,BufReadPost *lsi,*.net,*.sp so /user/loukusa/spice.vim
au  BufNewFile,BufReadPost *.lvsnet,*.net,*.sp,*.spc,*.hspice,*.dspf cal SetSyn("spice") 
augroup END
autocmd BufRead *.lvsnet,*.net,*.sp,*.spc,*.hspice,*.dspf set formatoptions=croql cindent 

"augroup syntax
"au! BufNewFile,BufReadPost README
"au  BufNewFile,BufReadPost README
"augroup END
"autocmd BufRead README set tw=60 cindent 

augroup syntax
au! BufNewFile,BufReadPost *.coffee
au  BufNewFile,BufReadPost *.coffee so /home/schumack/.vim/bundle/vim-coffee-script/syntax/coffee.vim
augroup END
autocmd BufRead *.coffee set formatoptions=croql 

augroup syntax
au! BufNewFile,BufReadPost *.ibs,*s2i
au  BufNewFile,BufReadPost *.ibs,*s2i so /user/ic/setup/vim/ibis.vim
"au  BufNewFile,BufReadPost *.ibs,*s2i so /user/schumack/SUBVERSION/icstuff/trunk/setup/vim/ibis.vim
augroup END
autocmd BufRead *.ibs,*s2i set formatoptions=croql cindent 

augroup syntax
au! BufNewFile,BufReadPost *.gdt
au  BufNewFile,BufReadPost *.gdt so /user/ic/setup/vim/gdt.vim
"au  BufNewFile,BufReadPost *.gdt so /user/schumack/SUBVERSION/icstuff/trunk/setup/vim/gdt.vim
augroup END
autocmd BufRead *.gdt set formatoptions=croql

augroup syntax
au! BufNewFile,BufReadPost *.lib
au  BufNewFile,BufReadPost *.lib so /user/ic/setup/vim/lib.vim
"au  BufNewFile,BufReadPost *.lib so /user/schumack/SUBVERSION/icstuff/trunk/setup/vim/lib.vim
augroup END
autocmd BufRead *.lib set formatoptions=croql

augroup syntax
au BufNewFile,BufRead *.R     setf r
au BufNewFile,BufRead *.R     set syntax=r 
"au BufNewFile,BufRead *.pl    TlistToggle 
"au BufNewFile,BufRead *.pm    TlistToggle 
augroup END

augroup filetypedetect
au BufNewFile,BufRead *.scs	setf spectre
au BufNewFile,BufRead *.scs set syntax=spectre
au BufNewFile,BufRead *.pl6	setf perl
au BufNewFile,BufRead *.pl6 set syntax=perl
augroup END

augroup syntax
au! BufNewFile,BufReadPost spice_netlist_requirements.txt
"au  BufNewFile,BufReadPost spice_netlist_requirements.txt so /user/ic/setup/vim/snr.vim
au  BufNewFile,BufReadPost spice_netlist_requirements.txt so /user/schumack/SUBVERSION/icstuff/trunk/setup/vim/snr.vim
augroup END

"augroup syntax
"au! BufNewFile,BufReadPost *.list,*.list.tMp
"au  BufNewFile,BufReadPost *.list,*.list.tMp so /home/schumack/control_work_area/script_dir/todo.vim
"augroup END
"autocmd BufRead *.list,*.list.tMp set formatoptions=croql  
"
"augroup syntax
"au! BufNewFile,BufReadPost *.lcrules
"au  BufNewFile,BufReadPost *.lcrules so /home/schumack/control_work_area/libchk_dir/libchk.vim
"" au  BufNewFile,BufReadPost *.lcrules so /home/ic/libchk/libchk.vim
"augroup END
"autocmd BufRead *.lcrules set formatoptions=croql  
"
"augroup syntax
"au! BufNewFile,BufReadPost *.vimtest
"au  BufNewFile,BufReadPost *.vimtest so /home/schumack/.vim/syntax/vimtest.vim
"augroup END
"autocmd BufRead *.vimtest set formatoptions=croql  
"
""augroup syntax
""au! BufNewFile,BufReadPost *.table.do.ndst
""au  BufNewFile,BufReadPost *.table.do.ndst so /home/schumack/.vim/syntax/colorizetabledondst.vim
""augroup END
""autocmd BufRead *.table.do.ndst set formatoptions=croql  
"
"augroup syntax
"au! BufNewFile,BufReadPost *.table.do.ndst
"au  BufNewFile,BufReadPost *.table.do.ndst so /home/schumack/.vim/syntax/aligntabledondst.vim
"augroup END
"autocmd BufRead *.table.do.ndst set formatoptions=croql  
"


