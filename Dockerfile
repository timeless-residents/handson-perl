FROM perl:5.40.1

WORKDIR /app
COPY . .

RUN cpanm --installdeps .
CMD ["carton", "exec", "--", "plackup", "-E", "production", "-s", "Starman", "--workers=4", "script/app.psgi"]
