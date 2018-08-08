FROM alpine:3.8

# When this Dockerfile was last refreshed (year/month/day)
ENV REFRESHED_AT 2018-08-07
ENV OAUTH2_PROXY_VERSION 2.2

# Checkout bitly's latest google-auth-proxy code from Github
ADD bin/oauth2_proxy-2.2.1-alpha.linux-amd64 /bin


# Install CA certificates
RUN apk add --no-cache --virtual=build-dependencies ca-certificates

# Expose the ports we need and setup the ENTRYPOINT w/ the default argument
# to be pass in.
EXPOSE 8080 4180
ENTRYPOINT [ "./bin/oauth2_proxy-2.2.1-alpha.linux-amd64" ]
CMD [ "--upstream=http://0.0.0.0:8080/", "--http-address=0.0.0.0:4180" ]
