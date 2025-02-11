FROM golang:1.23-bookworm as build-image

RUN adduser \
  --disabled-password \
  --gecos "" \
  --home "/nonexistent" \
  --shell "/sbin/nologin" \
  --no-create-home \
  --uid 65532 \
  min-user

WORKDIR $GOPATH/universal-correlator/
COPY ./source/ ./

RUN go mod download
RUN go mod verify

RUN CGO_ENABLED=0 go build -o /uc .

FROM gcr.io/distroless/static-debian12:debug

COPY --from=build-image /etc/passwd /etc/passwd
COPY --from=build-image /etc/group /etc/group

COPY --from=build-image /uc /uc

USER min-user:min-user
CMD ["/uc"]
ENTRYPOINT [ "/uc" ]