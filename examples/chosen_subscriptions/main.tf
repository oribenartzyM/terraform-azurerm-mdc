locals {
  # list_of_subscriptions = [var.subscription_id, var.subscription_id2]
  list_of_subscriptions = ["d533b51a-489e-4113-a2d1-2fa3b6ecc02e"]
}

resource "local_file" "generate_main_terraform_file" {
  filename = "${path.module}/output/main.tf"
  content = templatefile("resolv.conf.tftpl", {
    list_of_subscriptions = local.list_of_subscriptions
    status                = var.status
    mdc_plans_list        = jsonencode(var.mdc_plans_list)
    subplans              = jsonencode(var.subplans)
  })
}
