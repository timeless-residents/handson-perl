#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Mojolicious::Lite;
use Plack::Builder;
use MyApp::Controller;

my $controller = MyApp::Controller->new();

# Mojoliciousアプリケーションの設定
get '/' => sub {
    my $c = shift;
    $c->render(text => $controller->hello());
};

# PSGIアプリケーションのビルド
builder {
    enable 'AccessLog';  # アクセスログを有効化
    enable 'Runtime';    # 実行時間のヘッダーを追加
    
    app->start('psgi');
};