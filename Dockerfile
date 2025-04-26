FROM node:22-alpine

# 開発ツールのインストール
RUN set -x \
  && apk update \
  && apk upgrade \
  && apk add git curl vim \
  && npm install -g typescript ts-node @types/node
  
# プロファイル設定のコピー
COPY ./profile.d /etc/profile.d

# 作業ディレクトリの設定
WORKDIR /usr/src/app

# 開発ユーザーの作成
RUN adduser -D -h /home/dev dev \
  && chown -R dev:dev /usr/src/app

# 開発ユーザーに切り替え
USER dev
