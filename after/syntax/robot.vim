"=============================================================================
" File:         after/syntax/robot.vim
" Author:       Michael Foukarakis
" Version:      0.2
" Created:      Fri 17 Dec 2010 11:31:46 AM EET
" Last Update:  Tue 28 Jul 2015 15:39:21 AM CEST
"------------------------------------------------------------------------
" Description:
"       Syntax file for Robot test framework files.
"------------------------------------------------------------------------
" Installation:
"       Drop this file into {rtp}/after/syntax
"       Requires Vim 7+
" History:
"       0.1 - Robot now has a standard library, containing all sorts of goodies.
"       0.2 - Add all built-in, ssh and selenium library keywords.
"             Fix to match longest pattern instead of the first one.
" TODO:
"       * Figure out a neater alternative for the monster path regex
"=============================================================================
let s:cpo_save=&cpo
set cpo&vim
"------------------------------------------------------------------------
" Matches
"------------------------------------------------------------------------
syn match robotNumber               display "\<\d\+\>"
syn match robotEllipsis             display "\.\.\."
" Special (escaped) character as defined in Robot's syntax.
syn match robotSpecial              display "\\\(\${.*}\|\\\|#\|[n|r|t]\)"
" As variables may be used next to each other, do a non-greedy match.
" Alternatively, match only alphanumeric chars inside brackets.
syn match robotVariable             "\(\$\|@\){.\{-}}"
" This is by far the most stupid regex you'll see in here..
syn match robotPath                 display "\(\.\{1,2}\/\)\=\(\(\h\|\d\)\+\/\)\+\(\(\h\|\d\)\+\.\h\+\)\{,1}$"
" Operators
syn match robotOperator             "==\|="
" Table headers
syn match robotTable                "\c^\(\*\+\)\s*\(settings\|variables\|test cases\|\(user \)\?keywords\)\s*\1$"
" Common settings
syn match robotCommonSet            "\c\[\(Documentation\|Timeout\)\]"
" Keyword settings
syn match robotKeywordSet           "\c\[\(Arguments\|Return\)\]"
" Testcase settings
syn match robotTestcaseSet          "\c\[\(Tags\|Setup\|Teardown\|Precondition\|Postcondition\|Template\)\]"

" Robot Gherkin support
syn match robotGherkin              "\c\<\(Given\|When\|Then\|And\|But\)\>"

" Settings (global)
syn match robotSetup                "\c\<\(Suite\|Test\) \(Setup\|Teardown\|Precondition\|Postcondition\)\>"
syn match robotSettings             "\c\<\(Library\|Resource\|Variables\|Documentation\|Metadata\|Force Tags\|Default Tags\|Test Template\|Test Timeout\)\>"

" Standard libraries
" List variables in reverse order to match the longest pattern not the first one.
syn match collectionsLibrary        "\c\<\(Sort List\|Should Not Contain Match\|Should Contain Match\|Set To Dictionary\|Set List Value\|Reverse List\|Remove Values From List\|Remove From List\|Remove From Dictionary\|Remove Duplicates\|Log List\|Log Dictionary\|Lists Should Be Equal\|List Should Not Contain Value\|List Should Not Contain Duplicates\|List Should Contain Value\|List Should Contain Sub List\|Keep In Dictionary\|Insert Into List\|Get Slice From List\|Get Matches\|Get Match Count\|Get Index From List\|Get From List\|Get From Dictionary\|Get Dictionary Values\|Get Dictionary Keys\|Get Dictionary Items\|Dictionary Should Not Contain Value\|Dictionary Should Not Contain Key\|Dictionary Should Contain Value\|Dictionary Should Contain Sub Dictionary\|Dictionary Should Contain Key\|Dictionary Should Contain Item\|Dictionaries Should Be Equal\|Create Dictionary\|Count Values In List\|Copy List\|Copy Dictionary\|Convert To List\|Combine Lists\|Append To List\)\>"
syn match dateTimeLibrary           "\c\<\(Subtract Time From Time\|Subtract Time From Date\|Subtract Date From Date\|Get Current Date\|Convert Time\|Convert Date\|Add Time To Time\|Add Time To Date\)\>"
syn match dialogLibrary             "\c\<\(Pause Execution\|Get Value From User\|Get Selection From User\|Execute Manual Step\)\>"
syn match operatingSystemLibrary    "\c\<\(Wait Until Removed\|Wait Until Created\|Touch\|Switch Process\|Stop Process\|Stop All Processes\|Start Process\|Split Path\|Split Extension\|Should Not Exist\|Should Exist\|Set Modified Time\|Set Environment Variable\|Run And Return Rc And Output\|Run And Return Rc\|Run\|Remove Files\|Remove File\|Remove Environment Variable\|Remove Directory\|Read Process Output\|Normalize Path\|Move Files\|Move File\|Move Directory\|Log File\|Log Environment Variables\|List Files In Directory\|List Directory\|List Directories In Directory\|Join Paths\|Join Path\|Grep File\|Get Modified Time\|Get File Size\|Get File\|Get Environment Variables\|Get Environment Variable\|Get Binary File\|File Should Not Exist\|File Should Not Be Empty\|File Should Exist\|File Should Be Empty\|Environment Variable Should Not Be Set\|Environment Variable Should Be Set\|Empty Directory\|Directory Should Not Exist\|Directory Should Not Be Empty\|Directory Should Exist\|Directory Should Be Empty\|Create File\|Create Directory\|Create Binary File\|Count Items In Directory\|Count Files In Directory\|Count Directories In Directory\|Copy Files\|Copy File\|Copy Directory\|Append To File\|Append To Environment Variable\)\>"
syn match processLibrary            "\c\<\(Wait For Process\|Terminate Process\|Terminate All Processes\|Switch Process\|Start Process\|Send Signal To Process\|Run Process\|Process Should Be Stopped\|Process Should Be Running\|Is Process Running\|Get Process Result\|Get Process Object\|Get Process Id\)\>"
syn match screenshotLibrary         "\c\<\(Take Screenshot Without Embedding\|Take Screenshot\|Set Screenshot Directory\)\>"
syn match stringLibrary             "\c\<\(Split To Lines\|Split String To Characters\|Split String From Right\|Split String\|Should Not Be String\|Should Be Uppercase\|Should Be Unicode String\|Should Be Titlecase\|Should Be String\|Should Be Lowercase\|Should Be Byte String\|Replace String Using Regexp\|Replace String\|Remove String Using Regexp\|Remove String\|Get Substring\|Get Lines Matching Regexp\|Get Lines Matching Pattern\|Get Lines Containing String\|Get Line Count\|Get Line\|Generate Random String\|Fetch From Right\|Fetch From Left\|Encode String To Bytes\|Decode Bytes To String\|Convert To Uppercase\|Convert To Lowercase\)\>"
syn match telnetLibrary             "\c\<\(Write Until Expected Output\|Write Control Character\|Write Bare\|Write\|Switch Connection\|Set Timeout\|Set Telnetlib Log Level\|Set Prompt\|Set Newline\|Set Encoding\|Set Default Log Level\|Read Until Regexp\|Read Until Prompt\|Read Until\|Read\|Open Connection\|Login\|Execute Command\|Close Connection\|Close All Connections\)\>"
syn match xmlLibrary                "\c\<\(Set Element Text\|Set Element Tag\|Set Elements Text\|Set Elements Tag\|Set Elements Attribute\|Set Element Attribute\|Save Xml\|Remove Elements Attributes\|Remove Elements Attribute\|Remove Elements\|Remove Element Attributes\|Remove Element Attribute\|Remove Element\|Parse Xml\|Log Element\|Get Element Text\|Get Elements Texts\|Get Elements\|Get Element Count\|Get Element Attributes\|Get Element Attribute\|Get Element\|Get Child Elements\|Evaluate Xpath\|Element To String\|Element Text Should Match\|Element Text Should Be\|Elements Should Match\|Elements Should Be Equal\|Element Should Not Have Attribute\|Element Should Not Exist\|Element Should Exist\|Element Attribute Should Match\|Element Attribute Should Be\|Copy Element\|Clear Element\|Add Element\)\>"

" Other libraries
" See and follow listing order as above.
syn match seleniumLibrary           "\c\<\(Xpath Should Match X Times\|Wait Until Page Does Not Contain Element\|Wait Until Page Does Not Contain\|Wait Until Page Contains Element\|Wait Until Page Contains\|Wait Until Element Is Visible\|Wait Until Element Is Not Visible\|Wait Until Element Is Enabled\|Wait Until Element Does Not Contain\|Wait Until Element Contains\|Wait For Condition\|Unselect From List By Value\|Unselect From List By Label\|Unselect From List By Index\|Unselect From List\|Unselect Frame\|Unselect Checkbox\|Title Should Be\|Textfield Value Should Be\|Textfield Should Contain\|Textarea Value Should Be\|Textarea Should Contain\|Table Should Contain\|Table Row Should Contain\|Table Header Should Contain\|Table Footer Should Contain\|Table Column Should Contain\|Table Cell Should Contain\|Switch Browser\|Submit Form\|Simulate\|Set Window Size\|Set Window Position\|Set Selenium Timeout\|Set Selenium Speed\|Set Selenium Implicit Wait\|Set Screenshot Directory\|Set Browser Implicit Wait\|Select Window\|Select Radio Button\|Select From List By Value\|Select From List By Label\|Select From List By Index\|Select From List\|Select Frame\|Select Checkbox\|Select All From List\|Remove Location Strategy\|Reload Page\|Register Keyword To Run On Failure\|Radio Button Should Not Be Selected\|Radio Button Should Be Set To\|Press Key\|Page Should Not Contain Textfield\|Page Should Not Contain Radio Button\|Page Should Not Contain List\|Page Should Not Contain Link\|Page Should Not Contain Image\|Page Should Not Contain Element\|Page Should Not Contain Checkbox\|Page Should Not Contain Button\|Page Should Not Contain\|Page Should Contain Textfield\|Page Should Contain Radio Button\|Page Should Contain List\|Page Should Contain Link\|Page Should Contain Image\|Page Should Contain Element\|Page Should Contain Checkbox\|Page Should Contain Button\|Page Should Contain\|Open Context Menu\|Open Browser\|Mouse Up\|Mouse Over\|Mouse Out\|Mouse Down On Link\|Mouse Down On Image\|Mouse Down\|Maximize Browser Window\|Log Title\|Log Source\|Log Location\|Locator Should Match X Times\|Location Should Contain\|Location Should Be\|List Windows\|List Should Have No Selections\|List Selection Should Be\|Input Text Into Prompt\|Input Text\|Input Password\|Go To\|Go Back\|Get Window Titles\|Get Window Size\|Get Window Position\|Get Window Names\|Get Window Identifiers\|Get Webelements\|Get Vertical Position\|Get Value\|Get Title\|Get Text\|Get Table Cell\|Get Source\|Get Selenium Timeout\|Get Selenium Speed\|Get Selenium Implicit Wait\|Get Selected List Values\|Get Selected List Value\|Get Selected List Labels\|Get Selected List Label\|Get Matching Xpath Count\|Get Location\|Get List Items\|Get Horizontal Position\|Get Element Attribute\|Get Cookie Value\|Get Cookies\|Get All Links\|Get Alert Message\|Frame Should Contain\|Focus\|Execute Javascript\|Execute Async Javascript\|Element Text Should Be\|Element Should Not Contain\|Element Should Not Be Visible\|Element Should Contain\|Element Should Be Visible\|Element Should Be Enabled\|Element Should Be Disabled\|Drag And Drop By Offset\|Drag And Drop\|Double Click Element\|Dismiss Alert\|Delete Cookie\|Delete All Cookies\|Current Frame Should Not Contain\|Current Frame Contains\|Create Webdriver\|Confirm Action\|Close Window\|Close Browser\|Close All Browsers\|Click Link\|Click Image\|Click Element At Coordinates\|Click Element\|Click Button\|Clear Element Text\|Choose Ok On Next Confirmation\|Choose File\|Choose Cancel On Next Confirmation\|Checkbox Should Not Be Selected\|Checkbox Should Be Selected\|Capture Page Screenshot\|Assign Id To Element\|Alert Should Be Present\|Add Location Strategy\|Add Cookie\)\>"
syn match sshLibrary                "\c\<\(Write Until Expected Output\|Write Bare\|Write\|Switch Connection\|Start Command\|Set Default Configuration\|Set Client Configuration\|Read Until Regexp\|Read Until Prompt\|Read Until\|Read Command Output\|Read\|Put File\|Put Directory\|Open Connection\|Login With Public Key\|Login\|List Files In Directory\|List Directory\|List Directories In Directory\|Get File\|Get Directory\|Get Connections\|Get Connection\|File Should Not Exist\|File Should Exist\|Execute Command\|Enable Ssh Logging\|Directory Should Not Exist\|Directory Should Exist\|Close Connection\|Close All Connections\)\>"

" The built-in standard library comes last to re-match the keywords already caught.
" See and follow listing order as above.
syn match builtInLibrary            "\c\<\(Wait Until Keyword Succeeds\|Variable Should Not Exist\|Variable Should Exist\|Sleep\|Should Start With\|Should Not Start With\|Should Not Match Regexp\|Should Not Match\|Should Not End With\|Should Not Contain\|Should Not Be True\|Should Not Be Equal As Strings\|Should Not Be Equal As Numbers\|Should Not Be Equal As Integers\|Should Not Be Equal\|Should Not Be Empty\|Should Match Regexp\|Should Match\|Should End With\|Should Contain X Times\|Should Contain\|Should Be True\|Should Be Equal As Strings\|Should Be Equal As Numbers\|Should Be Equal As Integers\|Should Be Equal\|Should Be Empty\|Set Variable If\|Set Variable\|Set Test Variable\|Set Test Message\|Set Test Documentation\|Set Tags\|Set Suite Variable\|Set Suite Metadata\|Set Suite Documentation\|Set Log Level\|Set Library Search Order\|Set Global Variable\|Run Keyword Unless\|Run Keywords\|Run Keyword If Timeout Occurred\|Run Keyword If Test Passed\|Run Keyword If Test Failed\|Run Keyword If Any Tests Failed\|Run Keyword If Any Critical Tests Failed\|Run Keyword If All Tests Passed\|Run Keyword If All Critical Tests Passed\|Run Keyword If\|Run Keyword And Return Status\|Run Keyword And Return If\|Run Keyword And Return\|Run Keyword And Ignore Error\|Run Keyword And Expect Error\|Run Keyword And Continue On Failure\|Run Keyword\|Return From Keyword If\|Return From Keyword\|Replace Variables\|Repeat Keyword\|Remove Tags\|Regexp Escape\|Pass Execution If\|Pass Execution\|No Operation\|Log Variables\|Log To Console\|Log Many\|Log\|Length Should Be\|Keyword Should Exist\|Import Variables\|Import Resource\|Import Library\|Get Variable Value\|Get Variables\|Get Time\|Get Library Instance\|Get Length\|Get Count\|Fatal Error\|Fail\|Exit For Loop If\|Exit For Loop\|Evaluate\|Create List\|Convert To String\|Convert To Octal\|Convert To Number\|Convert To Integer\|Convert To Hex\|Convert To Bytes\|Convert To Boolean\|Convert To Binary\|Continue For Loop If\|Continue For Loop\|Comment\|Catenate\|Call Method\)\>"

"------------------------------------------------------------------------
" Regions
"------------------------------------------------------------------------
" Single-line comments. Are there multi-line comments?
syn region robotComment     display start="^#" excludenl end="$"
syn region robotString      start="\"" excludenl end="\""

"------------------------------------------------------------------------
" Keywords
"------------------------------------------------------------------------

"------------------------------------------------------------------------
" Links
"------------------------------------------------------------------------
hi def link robotVariable           Type
hi def link robotSetup              Include
hi def link robotSettings           Include
hi def link robotTestCaseName       Function
hi def link robotComment            Comment
hi def link robotEllipsis           String
hi def link robotTable              Identifier
hi def link robotImport             Include
hi def link robotSpecial            Special
hi def link robotString             String
hi def link robotNumber             Number
hi def link robotPath               Constant
hi def link robotOperator           Operator
hi def link robotCommonSet          Keyword
hi def link robotKeywordSet         Keyword
hi def link robotTestcaseSet        Keyword
hi def link robotGherkin            Keyword

hi def link builtInLibrary          Comment
hi def link collectionsLibrary      Keyword
hi def link dateTimeLibrary         Keyword
hi def link dialogLibrary           Keyword
hi def link operatingSystemLibrary  Keyword
hi def link processLibrary          Keyword
hi def link screenshotLibrary       Keyword
hi def link stringLibrary           Keyword
hi def link telnetLibrary           Keyword
hi def link xmlLibrary              Keyword
hi def link seleniumLibrary         Keyword
hi def link sshLibrary              Keyword

let b:current_syntax = "robot"
"------------------------------------------------------------------------
let &cpo=s:cpo_save
" vim700: set fdm=marker:
