# docker-postfix
postfix with debian-slim linux as docker-image

With the development of this repo, we will add tls / sasl / stdout-log in the end.

## docker-compose.yaml
`docker-compose.yaml` is an example for docker-compose deployment.

Steps to deploy docker-compose:

1. `docker-compose --env-file docker_compose.env -f docker-compose.yaml up -d`


## k8s.yaml

`k8s.yaml` is an example for k8s deployment.

Differences with the default settings:

1. log to stdout.
2. with submission (587) and submissions (smtps, 465).
3. smtpd_relay_restrictions with only permit_mynetworks.
4. postfix is expected to run in foreground.

Steps to deploy to k8s:

1. `kubectl create namespace postfix`
2. `kubectl create secret tls postfix-tls --key [key-file] --cert [cert-file] --namespace postfix`
3. modify the followings in `k8s.yaml`
    * MYNETWORKS
    * MYHOSTNAME
4. `kubectl apply -f k8s.yaml`
