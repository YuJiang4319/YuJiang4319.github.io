@echo off

cd /d %~dp0

hexo clean && hexo g && hexo d

echo Done!
