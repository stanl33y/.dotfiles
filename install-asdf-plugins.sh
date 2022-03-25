!#/bin/sh
cut -d' ' -f1 $HOME/.tool-versions | sort \
  | comm -23 - <(asdf plugin-list | sort) \
  | join -a1 - <(asdf plugin list all) \
  | xargs -t -L1 asdf plugin add
