# Instructions
This demo shows how to monitor a process without installing any OverOps software directly inside the container running the JVM.  It leverages the volume mount capabilities of docker and the remote collector concept to spin up a very light weight container.  It also takes advantage of a number of OverOps and JVM environment variables to eliminate the need for any command line arguments.  This can be very useful if you do not have access to a `Dockerfile` for a service (eg. pre-built image) or you are deploying to an environment like Kubernetes. 

To begin, you must first update the value for `SECRET_KEY` in `.env` then run the following commands.  In addition you will need to modify the following line in the `docker-compose.xml`.

```
volumes:
  - /Users/timveil/dev/takipi/t4c-agent:/opt/takipi
```

Here `/Users/timveil/dev/takipi/t4c-agent` is the path on my local machine where I have unzipped the OverOps for Containers agent (T4C).  You need to update download, unzip and correct this path for your machine.

Build the images
```
docker-compose build --no-cache
```

Start the images
```
docker-compose up
```

Stop and destroy the images
```
docker-compose down
```