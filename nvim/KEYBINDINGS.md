# Neovim Keybindings

> **Leader key** = `Space`  |  **Ctrl** = `Ctrl`  |  **Alt** = `Alt`  |  **Shift** = `Shift`

---

## General

| Key | Mode | Action |
|-----|------|--------|
| `Esc` | Normal | Clear search highlight |
| `U` | Normal | Redo |
| `J` | Normal | Join lines (keep cursor) |
| `Q` | Normal | Disabled (no Ex mode) |
| `Alt+Q` | Normal | Force quit nvim |
| `Space q` | Normal | Quit |
| `Space qa` | Normal | Force quit all |
| `Space w` | Normal | Close buffer |
| `Space Space` | Normal | Source current file |
| `Ctrl+.` | Any | Search all keybindings |

---

## Navigation

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+H` | Normal | Move to left window |
| `Ctrl+L` | Normal | Move to right window |
| `Ctrl+K` | Normal | Move to upper window |
| `Ctrl+J` | Normal | Next quickfix item |
| `Ctrl+D` | Normal | Scroll down (centered) |
| `Ctrl+U` | Normal | Scroll up (centered) |
| `n` / `N` | Normal | Next/prev search match (centered) |
| `Shift+L` | Normal | Next buffer |
| `Shift+H` | Normal | Previous buffer |
| `Ctrl+Up/Down` | Normal | Resize window height |
| `Ctrl+Left/Right` | Normal | Resize window width |

---

## File Tree (nvim-tree)

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+N` | Normal | Toggle file tree |
| `Space e` | Normal | Find current file in tree |
| `Space \` | Normal | Collapse all tree entries |
| `Ctrl+R` | Normal | Focus file tree |
| `Ctrl+B` | Insert | Toggle tree |

---

## Buffers / Files

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+`` | Normal | Buffer picker / hide terminal |
| `Ctrl+W` | Normal | Close current buffer |
| `Shift+L` | Normal | Next buffer |
| `Shift+H` | Normal | Previous buffer |

---

## Terminal

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+\` | Normal/Terminal | Toggle floating terminal |
| `Ctrl+Shift+\` | Normal/Terminal | New terminal |
| `Ctrl+`` | Terminal | Cycle between terminals |
| `Ctrl+W` | Terminal | Close current terminal |
| `Ctrl+Shift+V` | Terminal | Paste from clipboard |
| `Esc Esc` | Terminal | Exit terminal mode |
| `Ctrl+Enter` | Terminal | Jump to file:line under cursor |
| `gf` | Normal (in terminal) | Jump to file:line under cursor |
| `Space ft` | Normal | Toggle floating terminal |

---

## Telescope (Search)

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+P` | Normal/Insert | Find files |
| `Ctrl+G` | Normal | Global search with prompt |
| `Ctrl+G Ctrl+W` | Normal | Search word under cursor |
| `Space ff` | Normal | Find files |
| `Space fb` | Normal | Open buffers |
| `Space fo` | Normal | Recent files |
| `Space fh` | Normal | Help tags |
| `Space fm` | Normal | Man pages |
| `Space fq` | Normal | Quickfix list |
| `Space fi` | Normal | Nvim config files |
| `Space o` | Normal | Document outline/symbols |
| `Space p` | Normal | Command palette |
| `Alt+R` | Normal | Recent files |
| **Inside Telescope** | | |
| `Ctrl+J` / `Ctrl+K` | Picker | Move down/up |
| `Ctrl+Q` | Picker | Send to quickfix |
| `Enter` | Picker | Open selected |
| `Esc` | Picker | Close |

---

## Harpoon (Quick file marks)

| Key | Mode | Action |
|-----|------|--------|
| `Space a` | Normal | Add file to harpoon |
| `Ctrl+E` | Normal | Open harpoon menu |

---

## Git (gitsigns + fugitive)

| Key | Mode | Action |
|-----|------|--------|
| `]c` | Normal | Next git hunk |
| `[c` | Normal | Previous git hunk |
| `Space gs` | Normal/Visual | Stage hunk |
| `Space gr` | Normal/Visual | Reset hunk |
| `Space gS` | Normal | Stage entire buffer |
| `Space gu` | Normal | Undo stage hunk |
| `Space gR` | Normal | Reset entire buffer |
| `Space gp` | Normal | Preview hunk inline |
| `Space gb` | Normal | Blame current line |
| `Space gd` | Normal | Diff this file |
| `Space gD` | Normal | Diff against last commit |
| `Space td` | Normal | Toggle show deleted lines |
| `:Git` | Command | Git status |
| `:Git commit` | Command | Commit |
| `:Git push` | Command | Push |
| `:Git diff` | Command | Diff |

---

## LSP

| Key | Mode | Action |
|-----|------|--------|
| `K` | Normal | Hover documentation |
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gi` | Normal | Go to implementation |
| `go` | Normal | Go to type definition |
| `gr` | Normal | References |
| `gs` | Normal | Signature help |
| `gl` | Normal | Diagnostic float |
| `F2` | Normal | Rename symbol |
| `F3` | Normal/Visual | Format |
| `F4` | Normal | Code action |
| `Space f` | Normal | Format file |
| `Space i` | Normal | Organize imports |
| `Space j` | Normal | Next diagnostic |
| `Space '` | Normal | Previous diagnostic |
| `Space li` | Normal | LSP health check |

---

## Editing

| Key | Mode | Action |
|-----|------|--------|
| `dd` | Normal | Delete line (no yank) |
| `Space d` | Normal/Visual | Delete to void register |
| `Space p` | Visual | Paste without overwrite |
| `J` / `K` | Visual | Move selection down/up |
| `Space s` | Normal | Replace word under cursor |
| `Space x` | Normal | Make file executable |
| `Ctrl+[` | Normal | Fold block |
| `Ctrl+]` | Normal | Unfold block |
| `Ctrl+Alt+[` | Normal | Fold all |
| `Ctrl+Alt+]` | Normal | Unfold all |
| `gcc` | Normal | Toggle comment line |
| `gc` | Visual | Toggle comment selection |

---

## Quickfix

| Key | Mode | Action |
|-----|------|--------|
| `Space co` | Normal | Open quickfix |
| `Space cl` | Normal | Close quickfix |
| `Space cn` | Normal | Next quickfix item |
| `Space cp` | Normal | Previous quickfix item |

---

## Undotree

| Key | Mode | Action |
|-----|------|--------|
| `Space u` | Normal | Toggle undo tree |

---

## Insert Mode

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+C` | Insert | Escape |
| `Ctrl+V` | Insert | Paste from clipboard |
| `Ctrl+X` | Insert | Cut line |
| `Ctrl+Y` | Insert | Redo |
| `Ctrl+A` | Insert | Select all |
| `Ctrl+P` | Insert | Find files |

---

## Dashboard (start screen)

| Key | Action |
|-----|--------|
| `f` | Find files |
| `r` | Recent files |
| `g` | Live grep |
| `e` | File tree |
| `c` | Nvim config |
| `l` | Lazy plugins |
| `q` | Quit |

---

## Macros

| Key | Mode | Action |
|-----|------|--------|
| `qa` | Normal | Start recording macro to register `a` |
| `q` | Normal | Stop recording |
| `@a` | Normal | Play macro `a` |
| `@@` | Normal | Repeat last macro |
| `5@a` | Normal | Play macro 5 times |
