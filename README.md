vimStuff
========

Resource files associated with the vim editor

Installation:
========

  git clone get://github.com/Coolwater357/vimDotFiles.git ~/.vim

  Create slinks:

    ln -s ~/.vim/vimrc ~/.vimrc;

    ln -s ~/.vim/gvimrc ~/.gvimrc;

Creation:
========

  mv ~/.vimrc ~/.vim/vimrc
  mv ~/.gvimrc ~/.vim/gvimrc
  mv ~/.vim/.netrwhist ~/.netrwhist
  cd ~/.vim
  git init
  vim README.md
  git config --global user.email "KenSchumack@gmail.com"
  git config --global user.name "Coolwater357"

  git add .
  git commit -m "Initial commit"
  git tag v1.0
    created vimDotFiles at github.com
  git remote add origin https://github.com/Coolwater357/vimDotFiles.git
  git push -u origin master

  git add .
  git commit -m "updated ..."
  git push


