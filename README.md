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

Compile YCM (may need to change python version or install dependencies, check `:version` in vim)
```bash
python3 ~/.vim/bundle/YouCompleteMe/install.py --all
```

Make vimproc (for haskell)
```bash
cd bundle/vimproc.vim
make
```

## Add a plugin

From ~/.vim/

```bash
git submodule add plugin-git-repo ~/.vim/bundle/repo-name
```

## Remove a plugin

From ~/.vim/

```bash
git submodule deinit -f <path_to_submodule>
rm -rf .git/modules/<path_to_submodule>
git rm -f <path_to_submodule>
git commit -m "Removed submodule "
```
