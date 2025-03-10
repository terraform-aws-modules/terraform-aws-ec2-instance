module "key-pair" {
  source  = "app.terraform.io/sccm/key-pair-creation/aws"
  version = "0.0.1"

  key_pair_name = var.key_name
}
