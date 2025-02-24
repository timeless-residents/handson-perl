FROM perl:5.40.1

WORKDIR /app
COPY . .

RUN cpanm --installdeps .
RUN chmod +x startup.sh

CMD ["./startup.sh"]