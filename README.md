JIRA example with glowroot.

Step 1: build docker image

```
$ docker build -t jira-glowroot .
```

Step 2: run docker container

```
$ docker run --rm --publish 8080:8080 --publish 4000:4000 jira-glowroot
```

Access glowroot UI through port 4000 or JIRA UI at port 8080.