FROM node:22-alpine

# 開発ツールのインストール
RUN set -x \
  && apk update \
  && apk upgrade \
  && apk add git curl vim

# 作業ディレクトリの設定
WORKDIR /usr/src/app

# プロファイル設定のコピー
COPY ./profile.d /etc/profile.d

# TypeScript開発環境のセットアップ
RUN npm install -g typescript ts-node @types/node

# 開発環境の初期化
RUN npm init -y

# 必要なパッケージのインストール
RUN npm install express @types/express
RUN npm install --save-dev nodemon
