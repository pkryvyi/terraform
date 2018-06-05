module "myservers" {
  source = "modules/instance/"
  name   = "myserver-"

  //  network = "${module.vpc.name}"
  count = "2"
  image = "${var.image}"
  zone  = "${var.zone}"
}

module "loadbalancer" {
  instances    = "${module.myservers.url}"
  source       = "modules/loadbalancer"
  name         = "lb"
  project      = "${var.project}"
  region       = "${var.region}"
  service_port = "${var.service_port}"
}

