"=============================================================================
" $Id$
" File:         ftdetect/robot.vim                                {{{1
" Author:       Michael Foukarakis
" Version:      0.1
" Created:      Tue 21 Dec 2010 09:08:35 AM EET
" Last Update:  $Date$
"------------------------------------------------------------------------
" Description:
"       Filetype detection plugin for Robot files.
"------------------------------------------------------------------------
" Installation:
"       Drop this file into {rtp}/ftdetect
"       Requires Vim7+
" History:      None yet.
" TODO:         Missing features go here.
" }}}1
"=============================================================================
let s:cpo_save=&cpo
set cpo&vim

au BufNewFile,BufRead *.txt call s:FTrobot()

func! s:FTrobot()
	let b:topl = getline(1)
	if (exists("g:robot_syntax_for_txt") && g:robot_syntax_for_txt) || b:topl =~ '\*\*\*.\{-}\*\*\*'
		setf robot
	elseif b:topl =~ '^# -\*- coding: robot -\*-$'
		setf robot
	else
		setf human
	endif
endfunc

"------------------------------------------------------------------------
let &cpo=s:cpo_save
" vim600: set fdm=marker:
