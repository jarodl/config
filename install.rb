# taken from http://github.com/defunkt/emacs/blob/master/install.rb
require 'fileutils'

alias :V :lambda

Joiner = V do |base|
  V do |*others|
    File.join(base, *others)
  end
end

Home = Joiner[ File.expand_path( '~' ) ]
Cwd  = Joiner[ File.expand_path(File.dirname(__FILE__)) ]

Link = V do |target, new|
  FileUtils.ln_s Cwd[ target ], Home[ new ] rescue puts("~/#{new} exists.")
end

Link[ 'vimrc', '.vimrc' ]
Link[ 'gvimrc', '.gvimrc' ]
Link[ 'vim', '.vim' ]
Link[ 'zshrc', '.zshrc' ]

Git = V do |command, dir|
  Dir.chdir(dir) do
    `git #{command}`
  end
end

`git submodule update --init`
