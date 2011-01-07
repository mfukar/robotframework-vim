"=============================================================================
" File:         after/syntax/robot.vim
" Author:       Michael Foukarakis
" Version:      0.0.5
" Created:      Fri 17 Dec 2010 11:31:46 AM EET
" Last Update:  Fri Jan 07 2011 05:38:47 PM GTB Standard Time
"------------------------------------------------------------------------
" Description:
"       Syntax file for Robot test framework files.
"
"------------------------------------------------------------------------
" Installation:
"       Drop this file into {rtp}/after/syntax
"       Requires Vim 7+
" History:
" 	* 0.0.5 - Highlights table headers correctly. Added settings for
" 	the various tables.
" 	* 0.0.4 - Removed leading slashes from path regexp. Restricted to
"		eol, to avoid matching common usage of slash.
"		- Rudimentary string matching.
" TODO:
"       * Links look OK in most of my colorschemes, but your opinions are
"       more than welcome.
"       * Fix word boundaries for numbers.
"       * Figure out a neater alternative for the monster path regex
"       * Robot user guide is a bit foggy on the specs of the syntax. Need
"       clarifications..
"=============================================================================
let s:cpo_save=&cpo
set cpo&vim
"------------------------------------------------------------------------
" Matches
"------------------------------------------------------------------------
syn match robotNumber           display "\<\d\+\>"
syn match robotEllipsis         display "\.\.\."
" Special (escaped) character as defined in Robot's syntax.
syn match robotSpecial          display "\\\(\${.*}\|\\\|#\|[n|r|t]\)"
" As variables may be used next to each other, do a non-greedy match.
" Alternatively, match only alphanumeric chars inside brackets.
syn match robotVariable         "\${.\{-}}"
" This is actually NSN specific, it'll have to go for now.
" syn match robotTestCaseName     "NG\d\+[ \|\n\|\t]"
" This is by far the most stupid regex you'll see in here..
syn match robotPath             display "\(\.\{1,2}\/\)\=\(\(\h\|\d\)\+\/\)\+\(\(\h\|\d\)\+\.\h\+\)\{,1}$"
" Operators
syn match robotOperator         "==\|="
" Table headers
syn match robotTable		"\c^\(\*\+\)\s*\(settings\|variables\|test cases\|\(user \)\?keywords\)\s*\1$"
" Builtins
syn match robotBuiltin          "Call Method\|Catenate\|Comment\|Convert To Boolean\|Convert To Integer\|Convert To Number\|Convert To String\|Create List\|Evaluate\|Exit For Loop\|Fail\|Fatal Error\|Get Count\|Get Length\|Get Library Instance\|Get Time\|Get Variables\|Import Library\|Import Resource\|Import Variables\|Length Should Be\|Log\|Log Many\|Log Variables\|No Operation\|Regexp Escape\|Remove Tags\|Repeat Keyword\|Replace Variables\|Run Keyword\|Run Keyword And Continue On Failure\|Run Keyword And Expect Error\|Run Keyword And Ignore Error\|Run Keyword If\|Run Keyword If All Critical Tests Passed\|Run Keyword If All Tests Passed\|Run Keyword If Any Critical Tests Failed\|Run Keyword If Any Tests Failed\|Run Keyword If Test Failed\|Run Keyword If Test Passed\|Run Keyword If Timeout Occurred\|Run Keyword Unless\|Run Keywords\|Set Global Variable\|Set Library Search Order\|Set Log Level\|Set Suite Variable\|Set Tags\|Set Test Message\|Set Test Variable\|Set Variable\|Set Variable If\|Should Be Empty\|Should Be Equal\|Should Be Equal As Integers\|Should Be Equal As Numbers\|Should Be Equal As Strings\|Should Be True\|Should Contain\|Should Contain X Times\|Should End With\|Should Match\|Should Match Regexp\|Should Not Be Empty\|Should Not Be Equal\|Should Not Be Equal As Integers\|Should Not Be Equal As Numbers\|Should Not Be Equal As Strings\|Should Not Be True\|Should Not Contain\|Should Not End With\|Should Not Match\|Should Not Match Regexp\|Should Not Start With\|Should Start With\|Sleep\|Variable Should Exist\|Variable Should Not Exist\|Wait Until Keyword Succeeds"
" Common settings
syn match robotCommonSet	"\c\[\(Documentation\|Timeout\)\]"
" Keyword settings
syn match robotKeywordSet	"\c\[\(Arguments\|Return\)\]"
" Testcase settings
syn match robotTestcaseSet	"\c\[\(Tags\|Setup\|Teardown\|Precondition\|Postcondition\|Template\)\]"
" Settings (global)
syn match robotSetup		"\c\(Suite\|Test\) \(Setup\|Teardown\|Precondition\|Postcondition\)"
syn match robotSettings		"\c\(Library\|Resource\|Variables\|Documentation\|Metadata\|Force Tags\|Default Tags\|Test Template\|Test Timeout\)"

"------------------------------------------------------------------------
" Regions
"------------------------------------------------------------------------
" Single-line comments. Are there multi-line comments?
syn region robotComment         display start="^#" excludenl end="$"
syn region robotString          start="\"" excludenl end="\""

"------------------------------------------------------------------------
" Keywords
"------------------------------------------------------------------------

"------------------------------------------------------------------------
" Links
"------------------------------------------------------------------------
hi def link robotVariable	Type
hi def link robotSetup		Include
hi def link robotSettings	Include
hi def link robotTestCaseName	Function
hi def link robotComment	Comment
hi def link robotEllipsis	String
hi def link robotTable		Identifier
hi def link robotImport		Include
hi def link robotSpecial	Special
hi def link robotString		String
hi def link robotNumber		Number
hi def link robotPath		Constant
hi def link robotOperator	Operator
hi def link robotBuiltin	Comment
hi def link robotCommonSet	Keyword
hi def link robotKeywordSet	Keyword
hi def link robotTestcaseSet	Keyword

" This is probably redundant - will check later. TODO
let b:current_syntax = "robot"
"------------------------------------------------------------------------
let &cpo=s:cpo_save
"=============================================================================
" vim600: set fdm=marker:
