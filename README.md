# ttene.zsh

実行ステータスを見て喋らせたらウザいかな？

## 依存関係

- mplayer or afplay
- magicalstick(https://github.com/himanoa/magicalstick)

## インストール(zplug)

```zshrc.zsh
zplug "atnanasi/ttene.zsh", defer:2, \
  hook-build:'magicalstick | grep -E "てねっ[0-9]+" | xargs -P4 -In1 wget n1 -P $ZPLUG_HOME/repos/atnanasi/ttene.zsh/voices/'
```

注意点として

- zplugの初期化より先にmagicalstickにPATHが通っている(anyenvとか使ってる場合は要注意)
- defer:2にしないと^Mがaccept-lineに上書きされる(原因は知らん)

## Porting

- Vim [h1manoa/ttene.vim](https://github.com/himanoa/ttene.nvim)
- Emacs [shibafu528/ttene-mode](https://github.com/shibafu528/ttene-mode)
