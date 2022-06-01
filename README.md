# Temportal API

学習用に作成する社内で使うようなポータルサイト(API)

Web: https://github.com/uyawer/temportal-web

## できること&やりたいこと

できたら面白そうなネタ募集中。

- [ ] 全ユーザーメニュー
    - [ ] お知らせ
    - [ ] スケジュール管理（ユーザー＆会議室）
    - [ ] 勤怠関連
        - [ ] 勤怠届
            - [ ] 申請
            - [ ] 承認(マネージャー, 管理者のみ)
        - [ ] 勤怠表
            - [ ] 申請
            - [ ] 承認(マネージャー, 管理者のみ)
    - [ ] スキルシート？経歴書？
        - [ ] 登録
        - [ ] 更新
        - [ ] PDF出力？
    - [ ] 社内資料
        - [ ] 登録(管理者のみ？)
        - [ ] 更新(管理者のみ？)
        - [ ] 削除(管理者のみ？)
        - [ ] 閲覧
- [ ] 管理者メニュー
    - [ ] お知らせ管理
        - [ ] 登録
        - [ ] 更新
        - [ ] 削除
    - [ ] 社員管理
        - [ ] 検索
        - [ ] 登録
        - [ ] 更新
        - [ ] 削除
    - [ ] プロジェクト管理
        - [ ] 検索
        - [ ] 登録
        - [ ] 更新
        - [ ] 削除

## 開発環境構築手順

### DB(PostgreSQL)

#### インストール

公式: [PostgreSQL](https://www.postgresql.org)

[chocolaty](https://github.com/chocolatey/choco)の場合は以下のコマンドでインストールできます。

```ps1
> choco install postgresql
```

#### パスワードリセット

PowerShellなどから`psql`コマンドでログインしますが、インストール直後の場合でも謎のパスワードが設定されているためリセットします。

インストールフォルダにあるPostgreSQLのプロパティファイルを編集します。  
(e.g.: `C:\Program Files\PostgreSQL\14\data\pg_hba.conf`)

```diff
  # IPv4 local connections:
- host    all             all             127.0.0.1/32            scram-sha-256
+ host    all             all             127.0.0.1/32            trust
  # IPv6 local connections:
- host    all             all             ::1/128                 scram-sha-256
+ host    all             all             ::1/128                 trust
```

PowerShellなどからPostgreSQLに管理者でログインし、パスワードを更新します。

```ps1
> psql -U postgres
postgres=# \password
Enter new password for user "postgres": (postgres)
もう一度入力してください: (postgres)
postgres=# \q
>
```

変更してログアウトしたら編集したプロパティファイルを元の状態に戻し、PostgreSQLのサービスを再起動します。

```ps1
# PostgreSQL14の場合
> sc stop postgresql-x64-14
> sc start postgresql-x64-14
```

`psql`コマンドで再度ログインを行うとPostgreSQLにログインします。

```ps1
> psql -U postgres
ユーザー postgres のパスワード: (postgres)
psql (14.2)
"help"でヘルプを表示します。

postgres=#
```

#### 初期設定

ユーザーを作成します。

```postgresql
CREATE USER temportaluser WITH
  LOGIN
  ENCRYPTED PASSWORD 'temportaluser0428'
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
;

GRANT temportaluser TO postgres;
```

DBを作成します。

```postgresql
CREATE DATABASE temportal
  WITH
  OWNER = temportaluser
  ENCODING = 'UTF8'
  LC_COLLATE = 'ja_JP.UTF-8'
  LC_CTYPE = 'ja_JP.UTF-8'
  CONNECTION LIMIT = -1
  TEMPLATE = template0
;
```

作成したDBにログインできることを確認します。

```ps1
> psql -U temportaluser temportal
ユーザー temportaluser のパスワード: (temportaluser0428)
psql (14.2)
"help"でヘルプを表示します。

temportal=>
```

#### DBマイグレーション

gradleから`flywayMigrate`を実行します。

```ps1
> gradle flywayMigrate
```

### 起動設定

VMオプションを設定して、`application-local.yml`から設定を取得するようにします。

```ps1
-Dspring.profiles.active=local
```
