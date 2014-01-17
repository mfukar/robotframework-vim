Vim plugins for development with Robot framework

FUNCTIONALITY
------------------------------------------
 * {rtp}/after/syntax/robot.vim - Robot syntax plugin for text, space-delimited files.
 * {rtp}/ftdetect/robot.vim     - Robot filetype recognition plugin for text, space-delimited files.

INSTALLATION
------------------------------------------
Quickly install by:

 * git clone git://github.com/mfukar/robotframework-vim.git
 * cd robotframework-vim && cp -R * ~/.vim/

USAGE
------------------------------------------
 * To enable syntax highlighting in vim, you may add this line at the beginning
   of a Robot Framework file(s):

    `# -*- coding: robot -*-`

 * Alternatively, set the `g:robot_syntax_for_txt` global variable to treat .txt
   files as Robot files.

 * Or to enable the syntax highlighting for just a specific file you can issue the following command from vim:

    `:setf robot`
