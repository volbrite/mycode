/* main.tf */

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    },
    http = {
      source = "hashicorp/http"
      version = "3.0.1"
    }
  }
}

provider "docker" {}

provider "http" {
  # Configuration options
}

resource "docker_image" "gosvr" {
  # the name of our go image
  name         = var.image_name
  keep_locally = true            // keep image after "destroy"
}

resource "docker_container" "gosvr" {
  image = docker_image.gosvr.image_id
  name = var.container_name
  ports {
    internal = 9876
    external = 2224
  }
}


# The following example shows how to issue an HTTP GET request supplying
# an optional request header.
data "http" "example" {
  url = "http://0.0.0.0:9876/spock"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

# produces an output value named "spocks_wisdom"
output "spocks_wisdom" {
  description = "response from /spock api"
  value       = data.http.example.response_body
}