terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

/*
Remarking this block as I want to use an existing image
#resource "docker_image" "nginx" {
#  name         = "nginx:1.19.6"
#  keep_locally = true       // keep image after "destroy"
#}
*/

// Here I am using the image ID instead of creating the resource above and using its outputted ID
resource "docker_container" "nginx" {
  image = "298ec0e28760"
  name  = "tutorial"
  ports {
    internal = 80
    external = 2224
  }
}

