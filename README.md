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
