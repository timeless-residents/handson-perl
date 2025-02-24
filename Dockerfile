FROM perl:5.40.1

WORKDIR /app
COPY . .

# 基本的な依存関係をインストール
RUN cpanm App::cpanminus
RUN cpanm Carton
RUN cpanm Plack Starman

# プロジェクトの依存関係をインストール
RUN carton install

# スタートアップスクリプトの準備
COPY startup.sh .
RUN chmod +x startup.sh

CMD ["./startup.sh"]