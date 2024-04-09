data "aws_route53_zone" "primary" {
  name = "${var.domain}"
}

resource "aws_route53_record" "primary" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = ""
  type    = "A"
  ttl     = "300"
  records = ["${var.public_ip}"]
}

resource "aws_route53_record" "jenkins" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "jenkins"
  type    = "CNAME"
  ttl     = "300"
  records = ["${var.domain}"]
}

resource "aws_route53_record" "mvn" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "mvn"
  type    = "CNAME"
  ttl     = "300"
  records = ["${var.domain}"]
}

# Domain for public docker registry (GET methods only)
resource "aws_route53_record" "registry" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "registry"
  type    = "CNAME"
  ttl     = "300"
  records = ["${var.domain}"]
}

# Domain for private docker registry for publishing
resource "aws_route53_record" "registry-publish" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "registry-publish"
  type    = "CNAME"
  ttl     = "300"
  records = ["${var.domain}"]
}

