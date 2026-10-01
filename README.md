# 🛠️ Script Arsenal

<p align="center">
  <strong>A battle-ready collection of useful scripts for developers, power users & everyday automation</strong><br>
  کالکشن خفن اسکریپت‌های آماده برای دولوپرها و کارهای روزمره
</p>

<p align="center">
  <a href="https://github.com/sinajr2011-prog/script-arsenal/stargazers">
    <img src="https://img.shields.io/github/stars/sinajr2011-prog/script-arsenal?style=for-the-badge&logo=github&color=yellow" alt="Stars">
  </a>
  <a href="https://github.com/sinajr2011-prog/script-arsenal/network/members">
    <img src="https://img.shields.io/github/forks/sinajr2011-prog/script-arsenal?style=for-the-badge&logo=github&color=blue" alt="Forks">
  </a>
  <a href="LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License">
  </a>
  <a href="CONTRIBUTING.md">
    <img src="https://img.shields.io/badge/PRs-Welcome-brightgreen?style=for-the-badge" alt="PRs Welcome">
  </a>
</p>

---

## ✨ Why Script Arsenal?

Stop googling the same commands every single day.  
This repo is your **personal toolbox** — clean, tested, well-commented scripts that just work.

- ✅ Ready to use (copy & run)
- ✅ Clear comments + usage examples
- ✅ Organized by category
- ✅ Bash + Python
- ✅ MIT License — use freely

---

## 🚀 Quick Start

```bash
# Clone the arsenal
git clone https://github.com/sinajr2011-prog/script-arsenal.git
cd script-arsenal

# Make all bash scripts executable
find bash -name "*.sh" -exec chmod +x {} \;

# Optional: add to PATH (so you can run them from anywhere)
# echo 'export PATH="$PATH:/path/to/script-arsenal/bash/git"' >> ~/.bashrc
```

---

## 📂 Categories & Scripts

### 🔧 Git Helpers (`bash/git/`)

| Script | Description | Usage |
|--------|-------------|-------|
| `git-cleanup.sh` | Delete merged local branches + prune remotes | `./git-cleanup.sh` |
| `git-sync.sh` | Pull + optional commit + push in one go | `./git-sync.sh "my message"` |
| `git-undo.sh` | Soft (or hard) undo the last commit | `./git-undo.sh` or `./git-undo.sh --hard` |
| `git-whoami.sh` | Show your git identity + recent commits | `./git-whoami.sh` |

### 💻 System Utils (`bash/system/`)

| Script | Description | Usage |
|--------|-------------|-------|
| `disk-usage.sh` | Pretty disk usage of a folder | `./disk-usage.sh [path]` |
| `cleanup-temp.sh` | Safe cleanup of caches & temp files | `./cleanup-temp.sh [--dry-run]` |
| `find-large-files.sh` | Find the biggest files | `./find-large-files.sh [path] [count]` |
| `system-info.sh` | Quick system overview (CPU, RAM, Disk...) | `./system-info.sh` |
| `port-check.sh` | Check if a port is open / who's listening | `./port-check.sh 3000` or `./port-check.sh 3000 --listen` |

### 🚀 Productivity (`bash/productivity/`)

| Script | Description | Usage |
|--------|-------------|-------|
| `daily-standup.sh` | Generate standup notes from your git activity | `./daily-standup.sh [days]` |
| `weather.sh` | Beautiful weather report (no API key) | `./weather.sh` or `./weather.sh Tehran` |
| `timer.sh` | Countdown timer with notification | `./timer.sh 25m` or `./timer.sh 1h30m` |

### 🌐 Web & Dev (`bash/web/`)

| Script | Description | Usage |
|--------|-------------|-------|
| `serve.sh` | Instantly serve current folder over HTTP | `./serve.sh [port]` |
| `json-pretty.sh` | Pretty-print JSON (file or pipe) | `./json-pretty.sh data.json` or `curl ... \| ./json-pretty.sh` |

### 🐍 Python Tools (`python/`)

| Script | Description | Usage |
|--------|-------------|-------|
| `quick-rename.py` | Bulk rename files | `python quick-rename.py --dir . --from ".jpeg" --to ".jpg"` |
| `password-gen.py` | Generate strong random passwords | `python password-gen.py -l 20 -c 5` |
| `file-organizer.py` | Auto-organize files by type into folders | `python file-organizer.py --dir ~/Downloads` |

---

## 💡 Pro Tips

- Always prefer `--dry-run` when available (especially cleanup & organizer scripts)
- Most bash scripts work on Linux & macOS (some may need small tweaks on Windows via Git Bash/WSL)
- Feel free to alias your favorites in `~/.bashrc` or `~/.zshrc`

---

## 🤝 Contributing

Got a script that saves you time? **We want it!**

1. Fork the repo
2. Add your script in the right folder
3. Keep it clean, commented, and with a usage example
4. Open a Pull Request

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details.

---

## 📜 License

MIT © [SinaJr](https://github.com/sinajr2011-prog)

---

<p align="center">
  <strong>If this arsenal saved you even 5 minutes...</strong><br>
  Give it a ⭐ — it really helps!
</p>

<p align="center">
  Made with ❤️ + ☕ by <a href="https://github.com/sinajr2011-prog">SinaJr</a>
</p>
