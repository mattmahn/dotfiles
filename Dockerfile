# mattmahn/dotfiles test container
FROM ubuntu
MAINTAINER Matthew Mahnke <mmahnke18@gmail.com>

RUN apt-get update && apt-get install -y \
  curl \
  git \
  python \
  software-properties-common \
  vim \
  wget \
  zsh

COPY . /root/.dotfiles

RUN cd /root/.dotfiles && \
  rm -f ./git/gitconfig.symlink && \
  sed \
    -e "s/AUTHORNAME/dotfiles-demo/g" \
    -e "s/AUTHOREMAIL/dotfiles-demo/g" \
    -e "s/GIT_CREDENTIAL_HELPER/cache/g" \
    ./git/gitconfig.symlink.example > ./git/gitconfig.symlink && \
  git remote rm origin && \
  ./script/bootstrap && \
  zsh -c "source ~/.zshrc" || true

ENTRYPOINT zsh
