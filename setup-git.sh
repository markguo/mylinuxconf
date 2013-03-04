#!/bin/bash

git config --global user.name 'Guo Shiwei'
git config --global user.email 'guoshiwei@gmail.com'
git config --global color.ui true
git config --global i18n.commitencoding gbk
git config --global i18n.logoutputencoding gbk
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
