### reference

Followed Josean Youtube

- [Youtube Link](https://www.youtube.com/watch?v=6pAG3BHurdM&t=837s)
- [Source Link](https://www.josean.com/posts/how-to-setup-neovim-2024)

### Folder path

`~/.config/nvim`

### Tips

Handle Cmd-k issue in Iterm2

- Configure Iterm2
  - Preferences -> Keys -> + (add new global shortcut)
  - Keyboard shortcut: ⌘+k
  - Action: Send text
  - value:
    - clear\n

### Others

1. vimium : a useful extension for clicking browser elements without mouse
   ```
   # unmap close tab -> the tab closed by this keymap cannot be restored with cmd+shift+t in arc browser.
   unmap x
   ```
2. font-hack-nerd-font
   - make sure to set it in the Iterm2
   - `brew install font-hack-nerd-font`
3. karabiner
   - every time after using Korean or other languages, it is required to change back to English to use vim. -> it is super troublesome!
   - below keymap is only working on terminal programs like Iterm2.
   - This makes the ESC to change the keylayout to English.
   - path: `~/.config/karabiner/assets/complex_modifications`
   - file name: `escape_to_en.json`

```sh
cd ~/.config/karabiner/assets/complex_modifications
nvim escape_to_en.json
```

```json
{
  "title": "Convert to en when ESC",
  "rules": [
    {
      "description": "Convert to en when ESC",
      "manipulators": [
        {
          "type": "basic",
          "from": {
            "key_code": "escape",
            "modifiers": {
              "optional": ["any"]
            }
          },
          "to": [
            {
              "key_code": "escape"
            }
          ],
          "to_after_key_up": [
            {
              "select_input_source": {
                "language": "en"
              }
            }
          ],
          "conditions": [
            {
              "type": "frontmost_application_if",
              "bundle_identifiers": [
                "^com\\.apple\\.Terminal$",
                "^com\\.googlecode\\.iterm2$",
                "^co\\.zeit\\.hyperterm$",
                "^co\\.zeit\\.hyper$",
                "^io\\.alacritty$",
                "^net\\.kovidgoyal\\.kitty$",
                "^com\\.jetbrains\\.goland$",
                "^com\\.jetbrains\\.intellij$",
                "^com\\.jetbrains\\.intellij\\.ce$",
                "^com\\.jetbrains\\.webstorm$",
                "^com\\.jetbrains\\.pycharm$"
              ]
            }
          ]
        }
      ]
    }
  ]
}
```
