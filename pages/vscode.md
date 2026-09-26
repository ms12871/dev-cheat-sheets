---
title: VS Code Shortcut Cheat Sheet
layout: doc
---

# VS Code Shortcut Cheat Sheet

Shortcuts below use Windows/Linux and macOS key names. On macOS, `Cmd` is Command and `Option` is Alt. Keybindings can change with keyboard layout, extensions, and user settings.

## Common productivity shortcuts

| Action | Windows / Linux | macOS |
| :--- | :--- | :--- |
| Show Command Palette | `Ctrl+Shift+P` | `Cmd+Shift+P` |
| Quick Open / Go to File | `Ctrl+P` | `Cmd+P` |
| Toggle Integrated Terminal | `` Ctrl+` `` | `` Ctrl+` `` |
| Toggle Primary Side Bar | `Ctrl+B` | `Cmd+B` |
| Open Settings | `Ctrl+,` | `Cmd+,` |
| Open Keyboard Shortcuts editor | `Ctrl+K Ctrl+S` | `Cmd+K Cmd+S` |
| Find in Files | `Ctrl+Shift+F` | `Cmd+Shift+F` |
| Save | `Ctrl+S` | `Cmd+S` |

## Editing and navigation

| Action | Windows / Linux | macOS |
| :--- | :--- | :--- |
| Move Line Up / Down | `Alt+Up` / `Alt+Down` | `Option+Up` / `Option+Down` |
| Copy Line Down | `Shift+Alt+Down` | `Shift+Option+Down` |
| Delete Line | `Ctrl+Shift+K` | `Cmd+Shift+K` |
| Format Document | `Shift+Alt+F` | `Shift+Option+F` |
| Quick Fix / Code Action | `Ctrl+.` | `Cmd+.` |
| Rename Symbol | `F2` | `F2` |
| Go to Definition | `F12` | `F12` |
| Select Next Occurrence | `Ctrl+D` | `Cmd+D` |
| Add Cursor Above / Below | `Ctrl+Alt+Up` / `Ctrl+Alt+Down` | `Cmd+Option+Up` / `Cmd+Option+Down` |
| Add Cursor at Clicked Position | `Alt+Click` | `Option+Click` |
| Start / Continue Debugging | `F5` | `F5` |
| Stop Debugging | `Shift+F5` | `Shift+F5` |

## Useful settings

Add settings through the Settings editor or `settings.json`. These examples enable format-on-save and trim trailing whitespace:

```json
{
	"editor.formatOnSave": true,
	"files.trimTrailingWhitespace": true
}
```

## Find or troubleshoot a shortcut

1. Open Keyboard Shortcuts with `Ctrl+K Ctrl+S` or `Cmd+K Cmd+S`.
2. Search by command name or key combination. Right-click a command to configure or remove its binding.
3. If a key is intercepted or behaves unexpectedly, run **Developer: Toggle Keyboard Shortcuts Troubleshooting** from the Command Palette and inspect the Output panel.

## Official references

- [VS Code keyboard shortcuts and customization](https://code.visualstudio.com/docs/configure/keybindings)
- [Default keyboard shortcuts reference](https://code.visualstudio.com/docs/reference/default-keybindings)