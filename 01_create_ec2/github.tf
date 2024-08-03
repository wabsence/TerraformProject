# terraform {
#   required_providers {
#     github = {
#       source  = "integrations/github"
#       version = "~> 5.0"
#     }
#   }
# }

# # Configure the Github provider
# provider "github" {
#   token = "" # or `GITHUB_TOKEN`

# }

#  resource "github_repository" "example" {
#   name        = "terraform-repo"
#   description = "My awesome web page"

#    visibility = "public"

# }
