locals {
  url     = "d-wiki.com"
  stg_url = "stg.${local.url}"
}
resource "aws_route53_zone" "zone" {
  name = local.url
}

resource "aws_route53_record" "record" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = local.url
  type    = "A"

  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}
