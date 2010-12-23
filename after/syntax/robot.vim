"=============================================================================
" $Id$
" File:         after/syntax/robot.vim
" Author:       Michael Foukarakis
" Version:      0.0.3
" Created:      Fri 17 Dec 2010 11:31:46 AM EET
" Last Update:  $Date$
"------------------------------------------------------------------------
" Description:
"       Syntax file for ROBOT test framework files.
" 
"------------------------------------------------------------------------
" Installation:
"       Drop this file into {rtp}/after/syntax
"       Requires Vim 7+
" History:      None yet
" TODO:         
" 	* Links look OK in some colorschemes, ask people to try more of them
" 	* Fix word boundaries for numbers.
" 	* String highlighting.
"	* Figure out a better alternative for the path regex - it currently
"	  highlights stuff like <enable/...>
" 
"=============================================================================

let s:cpo_save=&cpo
set cpo&vim
"------------------------------------------------------------------------
"syn match robotString
syn match robotNumber		display "\<\d\+\>"

syn match robotEllipsis		display "\.\.\."
" Special (escaped) character as defined in Robot's syntax.
syn match robotSpecial		display "\\\(\${.*}\|\\\|#\|[n|r|t]\)"
" As variables may be used next to each other, do a non-greedy match.
" Alternatively, match only alphanumeric chars inside brackets.
syn match robotVariable		"\${.\{-}}"
" No need to be non-greedy here, labels are followed by 2+ spaces.
syn match robotLabel		"\[[a-zA-Z]*\]"
syn match robotSetup		display "^\(Suite\|Test\) \(Setup\|Teardown\)"
syn match robotTestCaseName	"NG\d\+[ \|\n\|\t]"
" This is by far the most stupid regex you'll see in here..
syn match robotPath		display "\/\{,1}\(\.\{1,2}\/\)\=\(\(\h\|\d\)\+\/\)\+\(\(\h\|\d\)\+\.\h\+\)\{,1}"
" Operators
syn match robotOperator		"==\|="

syn region robotIdentifier	start="\*\*\*" end="\*\*\*"
" Single-line comments. Are there multi-line comments?
syn region robotComment		start="^#" excludenl end="$"

syn keyword robotImport		Resource Library Variables
"syn keyword robotKeyword	foo
syn keyword robotDoc	Comment Documentation 

hi def link robotVariable	Type
hi def link robotSetup		Include
hi def link robotTestCaseName	Function
hi def link robotComment	Comment
hi def link robotEllipsis	String
hi def link robotIdentifier	Identifier
hi def link robotImport		Include
hi def link robotDoc	Statement
hi def link robotLabel		Label
hi def link robotSpecial	Special
hi def link robotString		String
hi def link robotNumber		Number
hi def link robotPath		Constant
hi def link robotOperator	Operator

let b:current_syntax = "robot"
"------------------------------------------------------------------------
let &cpo=s:cpo_save
"=============================================================================
" vim600: set fdm=marker:
