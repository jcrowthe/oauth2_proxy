FROM drone/ca-certs

ENV GODEBUG=netdns=go

ADD bin/proxy /proxy

ENTRYPOINT ["/proxy"]
