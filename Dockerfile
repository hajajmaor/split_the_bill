FROM hajajmaor/flutter-image as builder
COPY . /app
WORKDIR /app
# USER user
RUN ["flutter","pub","get"]
RUN ["flutter","build","web"]


FROM python:slim-buster
COPY --from=builder /app/build/web /app
# COPY  /build/web /app
WORKDIR /app
EXPOSE 8000
RUN echo running in http://localhost:8000/
CMD ["python3","-m","http.server"]
