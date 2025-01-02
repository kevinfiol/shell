mkdir -p $HOME/me/apps
curl https://download.sublimetext.com/sublime_text_3_build_3211_x64.tar.bz2 --output $HOME/me/apps/sublime.tar.bz2

cd $HOME/me/apps
tar --overwrite -xvf sublime.tar.bz2
rm sublime.tar.bz2
chmod +x $HOME/me/apps/sublime_text_3/sublime_text