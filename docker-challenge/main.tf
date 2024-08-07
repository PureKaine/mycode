terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}


#Remarking this block as I want to use an existing image
resource "docker_image" "simplegoservice" {
  name         = "registry.gitlab.com/alta3/simplegoservice"
#  keep_locally = true       // keep image after "destroy"
}


resource "docker_container" "simplegoservice" {
  image = docker_image.simplegoservice.image_id
  name  = var.container_name
  ports {
    internal = var.i_port
    external = var.e_port
  }
}
