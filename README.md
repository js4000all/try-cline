# coolcline 開発環境

## プロジェクト概要

coolclineは、TypeScriptベースのAPIサーバー開発を支援するCLIツールどす。主にバックエンドAPIの開発に特化しておりますえ。

## Dev Containerの外側での作業

### APIキーの設定
1. プロジェクトルートに`.env`ファイルを作成します：
```bash
touch .env
```

2. `.env`ファイルに以下のようにAPIキーを設定します：
```
GEMINI_API_KEY=your_api_key_here
```

3. 環境変数を読み込むために、Docker環境を再起動します：
```bash
docker compose down
docker compose up -d
```

### 開発環境の起動
1. Docker環境を起動します：
```bash
docker compose up -d
```

2. VSCodeでこのプロジェクトを開き、Dev Containerで開きます

## 注意事項

- エラーが発生した場合は、ログを確認してください
- コンテナを終了する場合は、`docker compose down`を実行してください 