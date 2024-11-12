# shell profile

```bash
cd ~
PROFILE_FILE="$HOME/me/.profile.sh"
echo '[ -f "$PROFILE_FILE" ] && source "$PROFILE_FILE"' >> ~/.bashrc
git clone https://github.com/kevinfiol/shell.git me
```
