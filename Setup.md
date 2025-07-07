# Welcome to the Neovim attempt of a tiny reusassable config setup.

This repository isn’t just dotfiles—it’s a personalized *Neovim learning dojo*, a configuration cauldron bubbling with plugin magic, clipboard sorcery, and just enough Git chaos to keep things interesting.

This guide walks you through setting it up properly so you can avoid the pitfalls--I went through all the valleys and peaks for you, making me think you don't have to experience that--and start customising with joy rather than rebasing nightmares.

---

## ⚙️ Prerequisites

Before cloning this repo, make sure you’ve got:

- **Neovim v0.9 or higher**  
- **Git** (configured for rebasing, not merging)
- **[Lazy.nvim](https://github.com/folke/lazy.nvim)** (used as the plugin manager—don’t worry, it installs itself!)
- (Optional but delightful): [**Beyond Compare**](https://www.scootersoftware.com/) for visual merge conflict resolution

---

## 📦 Cloning This Repo

```bash
git clone https://github.com/your-name/your-repo.git ~/.config/nvim
cd ~/.config/nvim
nvim
```

If `lazy-lock.json` is missing, open Neovim and run:

```vim
:Lazy sync
```

It will regenerate the file from your plugin spec.

---

## 🛡️ About `lazy-lock.json`

This repo tracks `lazy-lock.json` in Git to ensure all plugin versions are consistent across machines and timelines.

**But beware**: it is *notoriously conflict-prone* during rebases and merges. To prevent hair loss and keysmashes, we’ve embedded rules to tame it.

---

## 🧙 Git Config: Peace with the Lockfile

We use `.gitattributes` and a custom Git merge driver to always favor **your current branch’s version** of `lazy-lock.json`.

To enable this:

```bash
git config --global merge.ours.driver true
```

The `.gitattributes` file at the repo root contains:

```gitattributes
lazy-lock.json merge=ours
```

Together, these ensure `lazy-lock.json` won't block your Git flow again.

---

## 🔁 Handy Git Alias (Lockfile Conflict Fixer)

Add this to your `~/.gitconfig` under `[alias]`:

```ini
lockfix = !git checkout --ours lazy-lock.json && nvim --headless '+Lazy sync' '+qa' && git add lazy-lock.json
```

Then, when `lazy-lock.json` start acting like a drunk teenager--and believe me it will-- you simply do this :

```bash
git lockfix && git rebase --continue
```

---

## ✨ Optional Quality-of-Life Git Aliases

```ini
st = status
co = checkout
br = branch
cm = commit
lg = log --oneline --graph --decorate
```

---

## 🧪 First-Time Setup Steps (for Contributors)

1. Clone the repo  
2. Run `:Lazy sync` in Neovim  
3. Set the Git merge driver  
4. Start editing and committing your plugins like the dotfile bard you are 🎻

---

## 🦄 Final Notes

- This setup values reproducibility, readability, and a slight preference for visual elegance over raw minimalism.
- Merge conflicts are expected—but never without tools to beat them.
- You’re not just installing a Neovim config—you’re *joining a painfully earned legacy*.
