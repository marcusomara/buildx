# Using buildx

Auto-deploy via script
```bash
./deploy.sh <version>
```
If no input is supplied, will default to latest.


login to docker
```bash
sudo docker login -u <username> -p <password>
```

Check current builders
```bash
sudo docker buildx ls
```

If an instance does not exist with the required build architecture, create a new builder that can build in multiple architectures: 
```bash
sudo docker buildx create --name multibuilder
```

Change to new builder from default

```bash
sudo docker buildx use multibuilder
```

Specify amd64 and arm64 architectures 

```bash
sudo docker buildx build . --platform linux/amd64,linux/arm64
```

build docker image:version and push to elastic container registry
```bash
sudo docker buildx build --platform linux/amd64,linux/arm64 -t marcusomara/johnson-and-johnson:latest --push .
```