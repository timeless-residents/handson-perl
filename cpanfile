requires 'Mojolicious';
requires 'DBI';
requires 'Test::More';
requires 'DBD::SQLite';  # SQLiteを使用する場合
requires 'Plack';
requires 'Starman';
requires 'Server::Starter';

on 'test' => sub {
    requires 'Test::Deep';
    requires 'Test::Exception';
};

on 'develop' => sub {
    requires 'Perl::Critic';
    requires 'Test::Perl::Critic';
};