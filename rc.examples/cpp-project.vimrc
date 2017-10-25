" To use this file you have to use ale linging plugin installed already!
"1. Install vim plugin https://github.com/krisajenkins/vim-projectlocal
"2. Rename this file to .vimrc and drop it to c++ project's root folder
" Whithout this file clang++ linter will generate a log of errors about header files 

let currentDir = getcwd()
let g:ale_cpp_clang_options = '-std=c++14 -Wall -DQT3_SUPPORT  
  \-I/usr/include/qt4 
  \-I/usr/include/qt4/Qt 
  \-I/usr/include/qt4/Qt3Support 
  \-I/usr/include/qt4/QtAssistant 
  \-I/usr/include/qt4/QtCore 
  \-I/usr/include/qt4/QtDBus 
  \-I/usr/include/qt4/QtDeclarative 
  \-I/usr/include/qt4/QtDesigner 
  \-I/usr/include/qt4/QtGui 
  \-I/usr/include/qt4/QtHelp 
  \-I/usr/include/qt4/QtNetwork 
  \-I/usr/include/qt4/QtOpenGL 
  \-I/usr/include/qt4/QtScript 
  \-I/usr/include/qt4/QtScriptTools 
  \-I/usr/include/qt4/QtSql 
  \-I/usr/include/qt4/QtSvg 
  \-I/usr/include/qt4/QtTest 
  \-I/usr/include/qt4/QtUiTools 
  \-I/usr/include/qt4/QtXml 
  \-I/usr/include/qt4/QtXmlPatterns 
  \-I'.currentDir.'/src/lib 
  \-I'.currentDir.'/src/lib/metadata 
  \-I'.currentDir.'/src/plugins 
  \-I'.currentDir.'/src/ananas 
  \-I'.currentDir.'/src/designer/formdesigner 
  \'
