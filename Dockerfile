FROM alpine

RUN set -x \
  && apk update \
  && apk upgrade \
  && apk add git
WORKDIR /usr/src/app
COPY ./profile.d /etc/profile.d
# git clone で資材をここで取得
# 開発環境資材とプロジェクトの資材は分ける
