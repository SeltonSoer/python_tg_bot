import docker

def get_containers_docker():
    client = docker.DockerClient(base_url='unix://var/run/docker.sock')
    containers = client.containers.list(all=True)
    for c in containers:
        print(c.name, c.status)