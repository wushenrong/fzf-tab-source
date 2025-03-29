# :fzf-tab:complete:(\\|*/|)batcat:argument-rest
case $group in
subcommand)
  batcat cache --help
  ;;
*)
  [[ -f ${realpath#--*=} ]] && batcat ${realpath#--*=} || less ${realpath#--*=}
  ;;
esac
