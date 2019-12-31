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

## Add A plugin / library

from ~/.vim/

```bash
git submodule add plugin-git-repo ~/.vim/bundle/repo-name
```
