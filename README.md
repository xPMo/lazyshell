# [@xPMo](https://github.com/xPMo)'s Lazyshell Fork TODO

In [cleanup]:

- [x] Remove recommendation to `export OPENAI_API_KEY`.

TODO:

- [ ] Avoid `_`-prefixed functions (Zsh parses them as completion functions)
- [ ] Move functions to seperate files in their own directory, `autoload` them
- [ ] Resolve Keyboard shortcut conflict(s) (Alt-G conflicts with [toggle-command-prefix] - `noglob` prefix toggle)
  - [ ] Check preferred keyboard shortcut from `zstyle` first
    - [ ] Support vicmd/viins -only 
- [ ] Configurable default prompt(s) via `zstyle`
- [ ] Optionally send previous command history as prompt/context
  - [ ] Load preferred context from `zstyle`.
- [ ] Open full prompt in `$VISUAL`/`$EDITOR` to tweak

Long-term:

- [ ] Configurable endpoint and json schema
- [ ] Use [mafredri/zsh-async]
  - [ ] This might allow token streaming?

[cleanup]: https://github.com/xPMo/lazyshell/tree/cleanup
[toggle-command-prefix]: https://github.com/xPMo/zsh-toggle-command-prefix
[mafredri/zsh-async]: https://github.com/mafredri/zsh-async
