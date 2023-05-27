locals {
  name    = replace(basename(path.cwd), "_", "-")
  region  = "ap-northeast-1"
  app     = "go-simple-server"
  url     = "d-wiki.com"
  stg_url = "stg.${local.url}"
}
