terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "simplegoservice" {
  name         = "registry.gitlab.com/alta3/simplegoservice"
  keep_locally = true    // keep image after "destroy"
}

resource "docker_container" "simplegoservice" {
  image = docker_image.simplegoservice.image_id
  # here we removed the name "tutorial" for the container
  # and replace it with a call to a variable
  # name  = "tutorial"
  name = var.container_name
  ports {
    internal = var.internal_port  #80
    external = var.external_port  #2224
  }
}
