# define some functions to avoid any error that these programs don't exist
# treat bat -lXXX as cat
(($+commands[bat])) || bat() {command cat}
# pygmentize -lXXX
# bat -lXXX
(($+commands[pygmentize])) || pygmentize() {bat $@}
(($+commands[mdcat])) || mdcat() {bat -lmarkdown}
# https://github.com/Freed-Wu/fzf-tab-source/issues/6
(($+commands[less])) && [ -x ~/.lessfilter ] &&
  less() {~/.lessfilter $@ || command less $@} || (($+commands[less])) ||
    less() {command ls -l $@}
(($+commands[finger])) || (($+commands[pinky])) &&
  finger() {command pinky $@} || finger() {command whoami}
(($+commands[pandoc])) || pandoc() {command cat ${@[-1]}}
(($+commands[grc])) || grc() {eval ${@[2,-1]}}

(($+commands[git])) && git() {
    command git $@ | eval $(command git config --global pager.$1 || echo cat)
  }

# dictionary $ZINIT cannot be passed
PLUGINS_DIR=${ZINIT[PLUGINS_DIR]}

. $src
