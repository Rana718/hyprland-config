# Neovim Keybindings

> **Leader key** = `Space`  |  **C** = `Ctrl`  |  **A** = `Alt`  |  **S** = `Shift`

---

## General

| Key | Mode | Action |
|-----|------|--------|
| `Esc` | Normal | Clear search highlight |
| `Space h` | Normal | Clear search highlight |
| `U` | Normal | Redo |
| `J` | Normal | Join lines (keep cursor) |
| `Q` | Normal | Disabled (no Ex mode) |
| `Alt+q` | Normal | Force quit nvim |
| `Space q` | Normal | Quit |
| `Space qa` | Normal | Force quit all |
| `Space w` | Normal | Close buffer |
| `Space <leader>` | Normal | Source current file |

---

## Navigation

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+h` | Normal | Move to left window |
| `Ctrl+l` | Normal | Move to right window |
| `Ctrl+k` | Normal | Move to upper window |
| `Ctrl+j` | Normal | Next quickfix item |
| `Ctrl+d` | Normal | Scroll down (centered) |
| `Ctrl+u` | Normal | Scroll up (centered) |
| `n` / `N` | Normal | Next/prev search match (centered) |
| `Shift+l` | Normal | Next buffer |
| `Shift+h` | Normal | Previous buffer |
| `Ctrl+Up/Down` | Normal | Resize window height |
| `Ctrl+Left/Right` | Normal | Resize window width |

---

## File Tree (nvim-tree)

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+n` | Normal | Toggle file tree |
| `Space e` | Normal | Find current file in tree |
| `Space \` | Normal | Collapse all tree entries |
| `Ctrl+r` | Normal | Focus file tree |
| `Ctrl+r` | In tree | Go back to editor |
| `Ctrl+b` | Insert | Toggle tree |

---

## Buffers / Files

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+`` | Normal | Open file picker (cycle open files) |
| `Ctrl+w` | Normal | Close current buffer |
| `Shift+l` | Normal | Next buffer |
| `Shift+h` | Normal | Previous buffer |

---

## Terminal

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+\` | Normal | Toggle floating terminal |
| `Ctrl+Shift+\` | Normal/Terminal | New terminal |
| `Ctrl+`` | Terminal | Cycle between terminals |
| `Ctrl+w` | Terminal | Close current terminal |
| `Ctrl+Shift+V` | Terminal | Paste from clipboard |
| `Esc Esc` | Terminal | Exit terminal mode |
| `Space ft` | Normal | Toggle floating terminal |

---

## Telescope (Search)

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+p` / `Space ff` | Normal | Find files |
| `Ctrl+G` | Normal | Global search with custom prompt |
| `Ctrl+G` → `w` | Normal | Global search word under cursor |
| `Space fb` | Normal | Open buffers |
| `Space fo` | Normal | Recent files |
| `Alt+r` | Normal | Recent files |
| `Space fh` | Normal | Help tags |
| `Space fm` | Normal | Man pages |
| `Space fq` | Normal | Quickfix list |
| `Space fi` | Normal | Find nvim config files |
| `Space o` | Normal | Document outline/symbols |
| `Space p` | Normal | Command palette |
| **Inside Telescope** | | |
| `Ctrl+j` / `Ctrl+k` | Picker | Move up/down |
| `Ctrl+q` | Picker | Send to quickfix |
| `Enter` | Picker | Open selected |
| `Esc` | Picker | Close |

---

## Harpoon (Quick file marks)

| Key | Mode | Action |
|-----|------|--------|
| `Space a` | Normal | Add file to harpoon |
| `Ctrl+e` | Normal | Open harpoon menu |

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
| `dd` | Normal | Delete line (no copy) |
| `Space d` | Normal/Visual | Delete to void (no copy) |
| `Space p` | Visual | Paste without overwrite |
| `J` / `K` | Visual | Move selection down/up |
| `Space s` | Normal | Replace word under cursor (on line) |
| `Space x` | Normal | Make file executable |
| `Ctrl+[` | Normal | Fold |
| `Ctrl+]` | Normal | Unfold |
| `Ctrl+Alt+[` | Normal | Fold all |
| `Ctrl+Alt+]` | Normal | Unfold all |
| `gcc` | Normal | Toggle comment line |
| `gc` | Visual | Toggle comment selection |

---

## Macros

| Key | Mode | Action |
|-----|------|--------|
| `qa` | Normal | Start recording macro to register `a` |
| `q` | Normal | Stop recording |
| `@a` | Normal | Play macro `a` |
| `@@` | Normal | Repeat last macro |
| `5@a` | Normal | Play macro 5 times |

> Macro recording shows `● REC @a` in statusbar. Playing shows `▶ @a`.

---

## Quickfix

| Key | Mode | Action |
|-----|------|--------|
| `Space co` | Normal | Open quickfix |
| `Space cl` | Normal | Close quickfix |
| `Space cn` | Normal | Next quickfix item |
| `Space cp` | Normal | Prev quickfix item |

---

## Git (Fugitive)

| Command | Action |
|---------|--------|
| `:Git` | Git status |
| `:Git commit` | Commit |
| `:Git push` | Push |
| `:Git diff` | Diff |

---

## Undotree

| Key | Mode | Action |
|-----|------|--------|
| `Space u` | Normal | Toggle undotree |

---

## Insert Mode (Zed-style)

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+c` | Insert | Escape |
| `Ctrl+v` | Insert | Paste |
| `Ctrl+x` | Insert | Cut line |
| `Ctrl+y` | Insert | Redo |
| `Ctrl+a` | Insert | Select all |
| `Ctrl+p` | Insert | Find files |

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
