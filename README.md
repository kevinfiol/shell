# shell profile

```bash
cd ~
echo '[ -f "$HOME/me/.profile.sh" ] && source "$HOME/me/.profile.sh"' >> ~/.bashrc
git clone https://github.com/kevinfiol/shell.git "$HOME/me"
touch "$HOME/me/.env.sh" && touch "$HOME/me/.profile-work.sh"
```
