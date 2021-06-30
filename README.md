# tls

TLS Certificate Utility

## getcert

Download public certificates

```
./getcert.sh www.google.com
./getcert.sh localhost 8443
```

## cipher

Check server enabled ciphers

```
./cipher.sh www.google.com 443
./cipher.sh localhost 8443
```

## sslyze

SSL scanner

```
./sslyze.sh www.google.com
./sslyze.sh localhost 8443
```

## mkcert

[mkcert](https://github.com/FiloSottile/mkcert) is a simple tool for making locally-trusted development certificates

__Installation__

```
# macOS
brew install mkcert
brew install nss # if you use Firefox

# Windows
choco install mkcert
```

__Usage__

```
mkcert example.com "*.example.com" example.test localhost 127.0.0.1 ::1
```