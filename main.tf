terraform {
  required_version = ">= 1.4.0"
}

variable "site_title" {
  description = "Title of this cheat-sheet site."
  type        = string
  default     = "Developer & Infrastructure Cheat Sheets"
}

variable "cheat_sheet_topics" {
  description = "Topics published in the reference library."
  type        = set(string)
  default = [
    "Terraform",
    "VS Code",
    "Git & GitHub",
    "Okta integrations",
  ]
}

locals {
  site_catalog = {
    title  = var.site_title
    topics = sort(tolist(var.cheat_sheet_topics))
    files = [
      "pages/terraform.md",
      "pages/vscode.md",
      "pages/github.md",
      "pages/okta-integration.md",
    ]
  }
}

resource "terraform_data" "site_catalog" {
  input = local.site_catalog
}

output "site_catalog" {
  description = "Metadata catalog for this static cheat-sheet site."
  value       = terraform_data.site_catalog.output
}