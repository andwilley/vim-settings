# Drew's Vim Settings

## Importing

```bash
git clone --recrusive https://github.com/andwilley/vim-settings.git ~/.vim && \
cp ~/.vim/.vimrc ~/.vimrc
```

If you forget to run --recursive:
```bash
git submodule update --init --recursive
```

Then in vim
```
:PluginInstall
```

## Add a plugin

Add to vimrc
```
Plugin 'github/endpoint'
```

## Remove a plugin

Remove the `Plugin...` line from vimrc, then
```
:PluginClean
```

## Minimum Requirements (mostly YCM vimspector)

* Clang 7
* gcc 8
* Python 3.6 compiled with --enable-shared and the above gcc + clang versions
* Vim 8.2 [built](https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source) with the above python
* gdb 8

## Building Vim

The config args can be found in vim-config-options.txt

Make sure the python arguments match the path the executables that will be used
by YCM.
