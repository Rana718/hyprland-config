# ─── Fish Shell Config ───────────────────────────────────────────────────────
# Split into conf.d/ files:
#   01-env.fish      - Locale, PATH, Android SDK
#   02-aliases.fish  - All aliases (eza, common, apps)
#   03-tools.fish    - Tool integrations (bat, zoxide)
#   04-functions.fish - Functions (greeting, history, yazi, emulator)

# ─── .profile support ────────────────────────────────────────────────────────
if test -f ~/.fish_profile
    source ~/.fish_profile
end
