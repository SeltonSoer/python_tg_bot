import docker

def get_containers_docker():
    client = docker.DockerClient(base_url='unix://var/run/docker.sock')
    containers = client.containers.list(all=True)
    str_result = ''
    for c in containers:
        str_result += f'Имя контейнера: {c.name}; Статус контейнера: {c.status}\n'