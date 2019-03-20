
# credit github.com/xvoland/Extract 
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;

            *.lzma)      unlzma ./"$n"      ;;

            *.bz2)       bunzip2 ./"$n"     ;;

            *.cbr|*.rar)       unrar x -ad ./"$n" ;;

            *.gz)        gunzip ./"$n"      ;;

            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;

            *.z)         uncompress ./"$n"  ;;

            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;

            *.xz)        unxz ./"$n"        ;;

            *.exe)       cabextract ./"$n"  ;;

            *.cpio)      cpio -id < ./"$n"  ;;

            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

weather() {
  curl -s wttr.in/$1
}

man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;38;5;74m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[46;30m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[04;38;5;146m' \
    man "$@"
}

