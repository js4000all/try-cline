FROM node:22-alpine

# 開発ツールのインストール
RUN set -x \
  && apk update --no-cache \
  && apk upgrade --no-cache \
  && apk add --no-cache \
    git \
    curl \
    vim \
    bash \
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
RUN adduser -D -h /home/dev dev \
  && chown -R dev:dev /usr/src/app

# 開発ユーザーに切り替え
USER dev
