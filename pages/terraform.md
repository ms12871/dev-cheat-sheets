---
title: Terraform Cheat Sheet
layout: doc
---

# Terraform Cheat Sheet

Quick reference for the Terraform CLI, plan review, state, and configuration hygiene.

## CLI command reference

| Command | Use |
| :--- | :--- |
| `terraform` | Show the commands available in the installed CLI version. |
| `terraform version` | Print the CLI version. |
| `terraform init` | Initialize the working directory and install providers and modules. |
| `terraform init -upgrade` | Upgrade provider and module selections allowed by configuration. Review the resulting lock-file changes. |
| `terraform fmt -recursive` | Format configuration files in this directory and its subdirectories. |
| `terraform fmt -check -recursive` | Check formatting without modifying files; useful in CI. |
| `terraform validate` | Check configuration syntax and internal consistency. It does not validate remote APIs or current state. |
| `terraform plan` | Preview proposed infrastructure changes without applying them. |
| `terraform plan -var-file="prod.tfvars"` | Plan with values from a variable file. Keep secret-bearing variable files out of source control. |
| `terraform plan -out=tfplan` | Save an executable plan for a reviewed, repeatable apply. Treat the file as sensitive. |
| `terraform apply` | Create a fresh plan, prompt for approval, then apply it. |
| `terraform apply tfplan` | Apply a saved plan. Passing the plan file is the approval; no second confirmation is prompted. |
| `terraform destroy` | Plan and prompt to destroy managed infrastructure. Review the target and plan carefully. |
| `terraform output` | Show root-module outputs; `terraform output <name>` selects one output. |
| `terraform show` | Display the current state or a saved plan in readable form. |
| `terraform console` | Evaluate Terraform expressions interactively. |
| `terraform providers` | Show provider requirements and their source modules. |
| `terraform state list` | List resource addresses recorded in state. |
| `terraform state show <address>` | Show one resource instance from state. |
| `terraform workspace list` | List workspaces for the current backend. |
| `terraform workspace select <name>` | Switch the currently selected workspace. |

## Typical review-and-apply loop

```sh
terraform init
terraform fmt -check -recursive
terraform validate
terraform plan -out=tfplan
terraform show tfplan
terraform apply tfplan
```

For an interactive run, `terraform apply` also creates and displays a fresh plan before asking for approval. A saved plan is useful for automation and review, but it contains the full configuration and planned values; do not publish it or commit it.

## Reading a plan

| Marker | Meaning |
| :--- | :--- |
| `+` | Create a resource. |
| `~` | Update a resource in place. |
| `-` | Destroy a resource. |
| `-/+` or `+/-` | Replace a resource; the order indicates destroy/create or create/destroy. |

Check the summary counts and every replacement or deletion before approving. A speculative `terraform plan` is only a preview; changes to remote infrastructure between plan and apply can change the final result.

## State and workspaces

- Use `terraform state` subcommands instead of editing a state file directly. State changes create backups, including when using a remote backend.
- State can contain passwords, private keys, and other sensitive values. Prefer protected remote state with locking and access controls for team use.
- CLI workspaces select separate state instances for one configuration. They are not access-control boundaries; use separate configurations or appropriately isolated HCP Terraform workspaces when environments need stronger separation.
- Use `terraform workspace new <name>` to create a workspace and `terraform workspace show` to identify the current one before applying changes.

## Configuration hygiene

- Run `terraform fmt` and `terraform validate` before committing.
- Use two spaces per nesting level; use descriptive resource names with underscores, such as `"web_api"`.
- Give variables a type and description; give outputs a description. Mark sensitive variables and outputs as `sensitive = true`, but remember this does not remove their values from state.
- Pin Terraform and provider versions as appropriate, and commit `.terraform.lock.hcl`.
- Keep `terraform.tfstate*`, `.terraform/`, secret-bearing `*.tfvars`, and saved plan files out of Git. Add them to `.gitignore`.
- Use `-target` only for exceptional recovery or workaround situations, not routine deployments.

## Official references

- [Terraform CLI commands](https://developer.hashicorp.com/terraform/cli/commands)
- [terraform plan](https://developer.hashicorp.com/terraform/cli/commands/plan)
- [terraform apply](https://developer.hashicorp.com/terraform/cli/commands/apply)
- [State commands](https://developer.hashicorp.com/terraform/cli/commands/state)
- [Terraform style and workflow guide](https://developer.hashicorp.com/terraform/language/syntax/style)