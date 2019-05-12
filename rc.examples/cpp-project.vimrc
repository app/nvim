" To use this file you have to use ale linging plugin installed already!
"1. Install vim plugin https://github.com/krisajenkins/vim-projectlocal
"2. Rename this file to .vimrc and drop it to c++ project's root folder
" Whithout this file clang++ linter will generate a log of errors about header files 

let currentDir = getcwd()
let g:ale_cpp_clang_options = '-std=c++14 -Wall -DQT3_SUPPORT -Wno-overloaded-virtual 
  \-I/usr/include/qt4 
  \-I/usr/include/qt4/qdataschema 
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
  \-I'.currentDir.'/src/designer/.ui 
  \-I'.currentDir.'/src/admin/.ui 
  \-I'.currentDir.'/src/editor 
  \-I'.currentDir.'/src/lib 
  \-I'.currentDir.'/src/lib/.ui 
  \-I'.currentDir.'/src/lib/report 
  \-I'.currentDir.'/src/lib/widgets 
  \-I'.currentDir.'/src/lib/objects 
  \-I'.currentDir.'/src/lib/dialogs 
  \-I'.currentDir.'/src/lib/sys 
  \-I'.currentDir.'/src/lib/metadata 
  \-I'.currentDir.'/src/plugins 
  \-I'.currentDir.'/src/plugins/dbfield 
  \-I'.currentDir.'/src/plugins/actionbutton 
  \-I'.currentDir.'/src/plugins/catalogue 
  \-I'.currentDir.'/src/plugins/combobox 
  \-I'.currentDir.'/src/plugins/dbtable 
  \-I'.currentDir.'/src/plugins/document 
  \-I'.currentDir.'/src/plugins/grouptree 
  \-I'.currentDir.'/src/plugins/journal 
  \-I'.currentDir.'/src/plugins/report 
  \-I'.currentDir.'/src/plugins/table 
  \-I'.currentDir.'/src/plugins/.ui 
  \-I'.currentDir.'/src/plugins/field 
  \-I'.currentDir.'/src/ananas 
  \-I'.currentDir.'/src/designer/formdesigner 
  \'
