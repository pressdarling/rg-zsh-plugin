# rg

This plugin provides completions for [ripgrep](https://github.com/BurntSushi/ripgrep), the ridiculously fast file and text search binary.

It's a fancy way of doing `eval $(rg --generate complete-zsh)`, which might be slightly slower. You can do that or just copy/paste https://github.com/BurntSushi/ripgrep/blob/master/crates/core/flags/complete/rg.zsh if you prefer.

To use it, add `rg` to the plugins array in your zshrc file.

```
plugins=(... rg)
```

**Author:** [@pressdarling](https://github.com/pressdarling)
