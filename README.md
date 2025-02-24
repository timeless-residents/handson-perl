# Perl ハンズオンプロジェクト

## 概要

このリポジトリは、MacOS環境でのPerlアプリケーション開発のための基本的なテンプレートです。Mojoliciousフレームワークを使用したWebアプリケーション開発と、Plack/PSGIによる本番環境デプロイの基盤を提供します。

## 環境要件

- macOS
- Homebrew
- Perl 5.40.1以上（plenvでの管理を推奨）

## セットアップ手順

### 1. 環境構築

#### Homebrewのインストール

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### plenvとPerlのインストール

```bash
# plenvをインストール
brew install plenv
brew install perl-build

# shellの設定を追加
echo 'eval "$(plenv init -)"' >> ~/.zshrc
source ~/.zshrc

# 最新の安定版Perlをインストール
plenv install 5.40.1
plenv global 5.40.1
plenv rehash
```

#### 基本モジュールのインストール

```bash
# cpanmのインストール
curl -L https://cpanmin.us | perl - App::cpanminus
plenv rehash

# 必要なモジュールのインストール
cpanm Module::Install
cpanm Carton
cpanm Plack
cpanm Starman
```

### 2. プロジェクトのセットアップ

```bash
# リポジトリのクローン
git clone https://github.com/timeless-residents/handson-perl.git
cd handson-perl

# 依存モジュールのインストール
carton install
```

## プロジェクト構造

```
handson-perl/
├── lib/                   # アプリケーションコード
│   └── MyApp/
│       └── Controller.pm  # コントローラークラス
├── script/                # 実行スクリプト
│   ├── app.pl            # 開発用サーバースクリプト
│   └── app.psgi          # 本番用PSGIアプリケーション
├── t/                     # テストディレクトリ
│   └── basic.t           # 基本的なテスト
├── local/                 # Cartonが管理する依存モジュール (gitignore)
├── cpanfile               # 依存モジュールの定義
├── .gitignore             # Gitで無視するファイルの定義
└── README.md              # このファイル
```

## 使用方法

### 開発サーバーの起動

```bash
# 開発モードでアプリケーションを実行
carton exec -- perl script/app.pl daemon
```

### テストの実行

```bash
# テストスイートの実行
carton exec -- prove -l t
```

### 本番環境での実行

```bash
# Starmanを使用して本番モードで実行
carton exec -- plackup -E production -s Starman --workers=4 script/app.psgi
```

## 機能の拡張

このテンプレートを基に、以下のような機能を追加できます：

- HTMLテンプレートの使用
- データベース接続の実装
- ルーティングの追加
- RESTful APIの構築
- テストケースの拡充

## トラブルシューティング

### よくある問題と解決方法

- **モジュールのインストールエラー**: `cpanm --force Module::Name`を試す
- **パーミッション問題**: `sudo chown -R $USER:$USER ~/.cpanm/`
- **plenvコマンドが見つからない**: PATHの設定を確認
- **ビルドエラー**: Xcodeコマンドラインツールのインストールを確認

## 参考リソース

- [Perl公式ドキュメント](https://perldoc.perl.org/)
- [Mojoliciousドキュメント](https://mojolicious.org/)
- [Plack/PSGIの解説](https://metacpan.org/pod/Plack)
- [plenvの使い方](https://github.com/tokuhirom/plenv)

## ライセンス

このプロジェクトはMITライセンスの下で提供されています。詳細については[LICENSE](LICENSE)ファイルを参照してください。

## コントリビューション

1. このリポジトリをフォーク
2. 機能ブランチを作成 (`git checkout -b feature/amazing-feature`)
3. 変更をコミット (`git commit -m 'Add some amazing feature'`)
4. ブランチをプッシュ (`git push origin feature/amazing-feature`)
5. プルリクエストをオープン

## 連絡先

プロジェクトに関する質問や問題がある場合は、Issueを開いてください。