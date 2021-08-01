provider "github" {}

resource "github_repository" "new-repo" {
  name        = "new-repo-from-terraform"
  description = "New repo creation from terraform via github provider"
}

output "repo_full-name" {
  value = github_repository.new-repo.full_name
}
