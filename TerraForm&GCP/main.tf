#declaration our modules

module "myservers" {
  source = "modules/instance/"
  name   = "myserver-"
  count  = "2"
  image  = "${var.image}"
  zone   = "${var.zone}"
}

#configuration of loadbalancer
module "loadbalancer" {
  instances    = "${module.myservers.url}"
  source       = "modules/loadbalancer"
  name         = "lb"
  project      = "${var.project}"
  region       = "${var.region}"
  service_port = "${var.service_port}"
}

#declaration network configuration and ports
module "vpc" {
  source   = "modules/vpc"
  name     = "vpc"
  protocol = "tcp"
  ports    = [22, 80, 8080, 3306]
}

module "storage" {
  source        = "module/storage"
  name          = "petrokryvyi"
  location      = "EU"
  storage_class = "MULTI_REGIONAL"
}
