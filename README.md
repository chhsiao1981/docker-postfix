docker-postfix
==========
postfix with alpine-linux as docker-image

With the evolution of this repo, we will add tls / sasl / stdout-log in the end.

example.yaml
-----

example.yaml is an example for k8s deployment.

Difference with the default settings:

1. log to stdout
2. with smtps
3. smtpd_relay_restrictions with only permit_mynetworks
4. smtpd_banner = $myhostname ESMTP $mail_name ($mail_version)
5. postfix is expected to run in foreground.

Steps to deploy to k8s:

1. kubectl create namespace postfix
2. kubectl create secret tls postfix-tls --key [key-file] --cert [cert-file] --namespace postfix
3. modify the followings in example.yaml
    * mynetworks
    * myhostname
    * mydomain
4. kubectl apply -f example.yaml
