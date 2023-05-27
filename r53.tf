resource "aws_route53_zone" "d-wiki_zone" {
  name = "d-wiki.com"
}

resource "aws_route53_record" "record" {
  zone_id = aws_route53_zone.d-wiki_zone.zone_id
  name    = "d-wiki.com"
  type    = "A"

  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}
