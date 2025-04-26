FROM node:22-slim

# 開発ツールのインストール
RUN set -x \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y \
    git \
    curl \
    vim \
    make \
    g++ \
    python3 \
    openssh-client \
    ca-certificates \
    tzdata \
    zsh \
  && npm install -g \
    typescript \
    ts-node \
    @types/node \
    eslint \
    prettier \
    @typescript-eslint/parser \
    @typescript-eslint/eslint-plugin \
    jest \
    ts-jest \
    @types/jest \
    nodemon \
    rimraf \
    cross-env \
    husky \
    lint-staged
  
# プロファイル設定のコピー
COPY ./profile.d /etc/profile.d

# 作業ディレクトリの設定
WORKDIR /usr/src/app

# 開発ユーザーの作成
RUN useradd -m -s /bin/bash dev \
  && chown -R dev:dev /usr/src/app

# 開発ユーザーに切り替え
USER dev
