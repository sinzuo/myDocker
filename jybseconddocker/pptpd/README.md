## whuwxl/pptpd

A simple docker container running pptp vpn server.

### Installation

    docker pull whuwxl/pptpd

### Simple Usage

Demonstration ONLY!

Username: username

Password: password

    docker run --name pptpd --privileged -d -p 1723:1723 whuwxl/pptpd

### Custom Users and Passwords

Write custom username and password to a plain file and mount to container. You can replace 'myname' with your username and replace 'mypass' with your password.

    echo "myname * mypass *" >> /chap-secrets
    docker run --name pptpd --privileged -d -p 1723:1723 -v /chap-secrets:/etc/ppp/chap-secrets:ro whuwxl/pptpd

### Custom Dockerfile

As above, this can be accomplished more cleanly using a simple `Dockerfile`:

    FROM whuwxl/pptpd
    COPY chap-secrets /etc/ppp/chap-secrets

Then build with `docker build -t one-custom-pptpd .` and run:

    docker run --name one-pptpd --privileged -d -p 1723:1723 one-custom-pptpd
