terraform {
    required_providers {
        yandex = {
            source = "yandex-cloud/yandex"
            version = "0.61.0"
        }
    }
}

variable "TOKEN" {
    type = string
    description = "Token for provider user"
}

provider "yandex" {
    token = var.TOKEN
    cloud_id = "b1g3jddf4nv5e9okle7p"
    folder_id = "b1ggoah947u3kc4j9m7i"
    zone = "ru-central1-a"
}

resource "yandex_compute_instance" "vm-1" {
    name = "chapter5-lesson2-mgumerov"

    resources {
        cores  = 2
        memory = 2
    }

    boot_disk {
        initialize_params {
            image_id = "fd80qm01ah03dkqb14lc"
        }
    }

    network_interface {
        subnet_id = "e9bq7u62i4q21jq25n5j"
        nat = false
    }

    metadata = {
        user-data = "${file("./meta/meta.txt")}"
    }
}

output "ip_address" {
    value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}
