# GPG TTY
export GPG_TTY=$(tty)
# allow unfree nix
export NIXPKGS_ALLOW_UNFREE=1
# configure git config location
export GIT_CONFIG_GLOBAL="$HOME/me/.gitconfig"

# convenience aliases
alias m='micro'
alias cmus:update="cmus-remote -C clear && cmus-remote -C \"add $HOME/me/pidrive/public/Music\" && cmus-remote -C \"update-cache -f\""
alias where='type'
alias docker-compose='docker compose'
alias compose:update='docker compose pull && docker image prune'
alias serve='sfz --cors --render-index'
alias ld='lazydocker'
alias prof="micro $HOME/me/.profile.sh"
alias myenv="micro $HOME/me/.env.sh"
alias conf="micro $HOME/.config/home-manager/home.nix"
alias nl="home-manager packages"
alias switch="nix-channel --update && home-manager switch && nix-collect-garbage"
alias apt:update="sudo apt update && sudo apt autoclean && sudo apt clean && sudo apt autoremove"
alias rmm='rm -rf'
alias hosts='cat $HOME/.ssh/config'
alias pw="pwgen -c -n -y -s -B 16 1 | tr -d '\n' | tee >(wl-copy) && echo"

## git aliases
alias push='git push origin $(git branch --show-current)'
alias pull='git pull origin $(git branch --show-current)'
alias hard='git reset --hard HEAD'
alias fetch='git fetch'
alias add='git add -A'
alias commit='git commit -m '
alias delete='git push origin --delete'
alias tags:refresh='git tag -d $(git tag -l) && git fetch --tag'
alias gpg:generate='gpg --full-gen-key'
alias gpg:list='gpg --list-secret-keys --keyid-format SHORT'
alias gpg:edit='gpg --edit-key'
alias gpg:export='gpg --armor --export'

## pg.sh aliases
alias pgs="ssh -i $HOME/.ssh/pgs_sh pgs.sh"
alias pgs:help="pgs help"

## server stuff
alias caddy:start="sudo systemctl start caddy"
alias caddy:stop="sudo systemctl stop caddy"
alias caddy:reload="sudo systemctl reload caddy"
alias caddy:edit="sudo micro /etc/caddy/Caddyfile"
alias caddy:logs="sudo journalctl -u caddy"

# set PATH so it includes user's private bin if it exists
BIN_LOCATION="$HOME/.local/bin"
[ -d "$BIN_LOCATION" ] && PATH="$BIN_LOCATION:$PATH"

WORK_PROFILE="$HOME/me/.profile-work.sh"
[ -f "$WORK_PROFILE" ] && source "$WORK_PROFILE"

ENV_FILE="$HOME/me/.env.sh"
[ -f "$ENV_FILE" ] && source "$ENV_FILE"

GIT_PROMPT="$HOME/me/.profile-git-prompt.sh"
[ -f "$GIT_PROMPT" ] && source "$GIT_PROMPT"

# fzf setup
if which fzf >/dev/null 2>&1; then
    export FZF_DEFAULT_OPTS='--reverse'

    FZF_COMPLETION="$HOME/me/.profile-fzf-completion.sh"
    [ -f "$FZF_COMPLETION" ] && source "$FZF_COMPLETION"

    FZF_KEY_BINDINGS="$HOME/me/.profile-fzf-key-bindings.sh"
    [ -f "$FZF_KEY_BINDINGS" ] && source "$FZF_KEY_BINDINGS"
fi

# deno setup
export PATH="$HOME/.deno/bin:$PATH"

# node/fnm setup
if which fnm >/dev/null 2>&1; then
    eval "`fnm env`"
    eval "$(fnm env --use-on-cd)"
fi

# mise shims
if which mise >/dev/null 2>&1; then
	eval "$(mise activate bash --shims)"
fi

# ruby-install/chruby setup
CHRUBY_SCRIPT="/usr/local/share/chruby/chruby.sh"
[ -f "$CHRUBY_SCRIPT" ] && source "$CHRUBY_SCRIPT"
CHRUBY_AUTO_SCRIPT="/usr/local/share/chruby/auto.sh"
[ -f "$CHRUBY_AUTO_SCRIPT" ] && source "$CHRUBY_AUTO_SCRIPT"

# hashlink setup
HASHLINK_LOCATION="$HOME/.local/bin/hashlink"
[ -d "$HASHLINK_LOCATION" ] && PATH="$HASHLINK_LOCATION:$PATH"

# functions
kill_on_port() {
    if [ -z "$1" ]; then
        echo "Usage: kill_on_port <port>"
        return 1
    fi
    kill -9 $(lsof -t -i :"$1") 2>/dev/null || echo "No process found on port $1"
}
