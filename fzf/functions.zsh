#!/bin/sh

fkill() {
  local pid
  if [ "$UID" != "0" ]; then
    pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
  else
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  fi

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

if command -v asdf >/dev/null 2>&1; then
  # Install one or more versions of specified language
  # e.g. `vmi rust` # => fzf multimode, tab to mark, enter to install
  # if no plugin is supplied (e.g. `vmi<CR>`), fzf will list them for you
  # Mnemonic [V]ersion [M]anager [I]nstall
  vmi() {
    local lang=${1}

    if [[ ! $lang ]]; then
      lang=$(asdf plugin-list | fzf)
    fi

    if [[ $lang ]]; then
      local versions=$(asdf list-all $lang | fzf -m)
      if [[ $versions ]]; then
        for version in $(echo $versions);
        do; asdf install $lang $version; done;
      fi
    fi
  }

  # Remove one or more versions of specified language
  # e.g. `vmi rust` # => fzf multimode, tab to mark, enter to remove
  # if no plugin is supplied (e.g. `vmi<CR>`), fzf will list them for you
  # Mnemonic [V]ersion [M]anager [C]lean
  vmc() {
    local lang=${1}

    if [[ ! $lang ]]; then
      lang=$(asdf plugin-list | fzf)
    fi

    if [[ $lang ]]; then
      local versions=$(asdf list $lang | fzf -m)
      if [[ $versions ]]; then
        for version in $(echo $versions);
        do; asdf uninstall $lang $version; done;
      fi
    fi
  }
fi


# Login to an existing AWS SSO profile
fawssso() {
  local profile="$(env -u AWS_PROFILE aws configure list-profiles | fzf --query "$1")"
  [[ -z "$profile" ]] && return 0
  export AWS_PROFILE="$profile"
  if ! aws sts get-caller-identity --profile "$profile" &>/dev/null; then
    aws sso login --profile "$profile"
  fi
}
