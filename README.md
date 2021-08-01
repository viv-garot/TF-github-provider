# tf-github-provider

## Description
Repo for learning github provider in Terraform (create a new repo from terraform via the github provider)

## Pre-requirements

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) 
* [GitHub account](https://docs.github.com/en/get-started/signing-up-for-github/signing-up-for-a-new-github-account)
* [Terraform cli](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## How to use this repo

- Clone
- Github authentication
- Run
- Cleanup

---

### Clone the repo

```
git clone https://github.com/viv-garot/tf-github-provider
```

### Change directory

```
cd tf-github-provider
```

### GitHub authentication

* Create a new Personal Access Token in GitHub :

* Profile > Settings

![image](https://user-images.githubusercontent.com/85481359/127781755-2d71a406-f18d-4011-9f1a-00e87def6eee.png)

* Developper settings 

![image](https://user-images.githubusercontent.com/85481359/127781804-4c618b93-ac9e-4e61-9809-d2cb4815cb27.png)

* Personal Access Token

![image](https://user-images.githubusercontent.com/85481359/127781836-6652672f-5fb8-44a0-844d-ef4019d392b2.png)


* Generate new token

![image](https://user-images.githubusercontent.com/85481359/127781870-2f5f67db-d5d0-4463-8103-5db5ea948a99.png)


* Select __repo__ and __delete_repo__ scopes

 ![image](https://user-images.githubusercontent.com/85481359/127781909-7b606229-0213-4771-808c-1afb13a27be7.png)
 ![image](https://user-images.githubusercontent.com/85481359/127782252-06cf6706-32bb-4634-9d75-770d18916706.png)



* Copy the generated token

![image](https://user-images.githubusercontent.com/85481359/127782323-62005d4b-3d44-4f75-90a7-738d2a134956.png)

* Export in your shell the newly created token to a GITHUB_TOKEN variable

```
export GITHUB_TOKEN="YOUR-CREATED-TOKEN"
```


### Run

* Init:

```
terraform init
```

_sample_:

```
terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/github...
- Installing hashicorp/github v4.13.0...
- Installed hashicorp/github v4.13.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

╷
│ Warning: Additional provider information from registry
│
│ The remote registry returned warnings for registry.terraform.io/hashicorp/github:
│ - For users on Terraform 0.13 or greater, this provider has moved to integrations/github. Please update your source in required_providers.
╵

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

* Apply:

```
terraform apply
```

_sample_:

```
terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # github_repository.new-repo will be created
  + resource "github_repository" "new-repo" {
      + allow_merge_commit     = true
      + allow_rebase_merge     = true
      + allow_squash_merge     = true
      + archived               = false
      + default_branch         = (known after apply)
      + delete_branch_on_merge = false
      + description            = "New repo creation from terraform via github provider"
      + etag                   = (known after apply)
      + full_name              = (known after apply)
      + git_clone_url          = (known after apply)
      + html_url               = (known after apply)
      + http_clone_url         = (known after apply)
      + id                     = (known after apply)
      + name                   = "new-repo-from-terraform"
      + node_id                = (known after apply)
      + private                = (known after apply)
      + repo_id                = (known after apply)
      + ssh_clone_url          = (known after apply)
      + svn_url                = (known after apply)
      + visibility             = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + repo_full-name = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

github_repository.new-repo: Creating...
github_repository.new-repo: Creation complete after 3s [id=new-repo-from-terraform]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

repo_full-name = "viv-garot/new-repo-from-terraform"
```

* Confirm the new repo has been created

```
curl https://api.github.com/repos/$(terraform output -raw repo_full-name)
```

_sample_:

```
curl https://api.github.com/repos/$(terraform output -raw repo_full-name)
{
  "id": 391711145,
  "node_id": "MDEwOlJlcG9zaXRvcnkzOTE3MTExNDU=",
  "name": "new-repo-from-terraform",
  "full_name": "viv-garot/new-repo-from-terraform",
  "private": false,
  "owner": {
    "login": "viv-garot",
    "id": 85481359,
    "node_id": "MDQ6VXNlcjg1NDgxMzU5",
    "avatar_url": "https://avatars.githubusercontent.com/u/85481359?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/viv-garot",
    "html_url": "https://github.com/viv-garot",
    "followers_url": "https://api.github.com/users/viv-garot/followers",
    "following_url": "https://api.github.com/users/viv-garot/following{/other_user}",
    "gists_url": "https://api.github.com/users/viv-garot/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/viv-garot/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/viv-garot/subscriptions",
    "organizations_url": "https://api.github.com/users/viv-garot/orgs",
    "repos_url": "https://api.github.com/users/viv-garot/repos",
    "events_url": "https://api.github.com/users/viv-garot/events{/privacy}",
    "received_events_url": "https://api.github.com/users/viv-garot/received_events",
    "type": "User",
    "site_admin": false
  },
  "html_url": "https://github.com/viv-garot/new-repo-from-terraform",
  "description": "New repo creation from terraform via github provider",
  "fork": false,
  "url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform",
  "forks_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/forks",
  "keys_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/keys{/key_id}",
  "collaborators_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/collaborators{/collaborator}",
  "teams_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/teams",
  "hooks_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/hooks",
  "issue_events_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/issues/events{/number}",
  "events_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/events",
  "assignees_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/assignees{/user}",
  "branches_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/branches{/branch}",
  "tags_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/tags",
  "blobs_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/git/blobs{/sha}",
  "git_tags_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/git/tags{/sha}",
  "git_refs_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/git/refs{/sha}",
  "trees_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/git/trees{/sha}",
  "statuses_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/statuses/{sha}",
  "languages_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/languages",
  "stargazers_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/stargazers",
  "contributors_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/contributors",
  "subscribers_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/subscribers",
  "subscription_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/subscription",
  "commits_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/commits{/sha}",
  "git_commits_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/git/commits{/sha}",
  "comments_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/comments{/number}",
  "issue_comment_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/issues/comments{/number}",
  "contents_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/contents/{+path}",
  "compare_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/compare/{base}...{head}",
  "merges_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/merges",
  "archive_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/{archive_format}{/ref}",
  "downloads_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/downloads",
  "issues_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/issues{/number}",
  "pulls_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/pulls{/number}",
  "milestones_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/milestones{/number}",
  "notifications_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/notifications{?since,all,participating}",
  "labels_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/labels{/name}",
  "releases_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/releases{/id}",
  "deployments_url": "https://api.github.com/repos/viv-garot/new-repo-from-terraform/deployments",
  "created_at": "2021-08-01T18:48:56Z",
  "updated_at": "2021-08-01T18:48:58Z",
  "pushed_at": "2021-08-01T18:48:57Z",
  "git_url": "git://github.com/viv-garot/new-repo-from-terraform.git",
  "ssh_url": "git@github.com:viv-garot/new-repo-from-terraform.git",
  "clone_url": "https://github.com/viv-garot/new-repo-from-terraform.git",
  "svn_url": "https://github.com/viv-garot/new-repo-from-terraform",
  "homepage": "",
  "size": 0,
  "stargazers_count": 0,
  "watchers_count": 0,
  "language": null,
  "has_issues": false,
  "has_projects": false,
  "has_downloads": false,
  "has_wiki": false,
  "has_pages": false,
  "forks_count": 0,
  "mirror_url": null,
  "archived": false,
  "disabled": false,
  "open_issues_count": 0,
  "license": null,
  "forks": 0,
  "open_issues": 0,
  "watchers": 0,
  "default_branch": "main",
  "temp_clone_token": null,
  "network_count": 0,
  "subscribers_count": 1
}
```

### Cleanup

```
terraform destroy
```

_sample_:

```
terraform destroy
github_repository.new-repo: Refreshing state... [id=new-repo-from-terraform]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # github_repository.new-repo will be destroyed
  - resource "github_repository" "new-repo" {
      - allow_merge_commit     = true -> null
      - allow_rebase_merge     = true -> null
      - allow_squash_merge     = true -> null
      - archived               = false -> null
      - default_branch         = "main" -> null
      - delete_branch_on_merge = false -> null
      - description            = "New repo creation from terraform via github provider" -> null
      - etag                   = "W/\"f19bc855793f65805735173300fa3783046d29b378e60317a21261f37b3f1589\"" -> null
      - full_name              = "viv-garot/new-repo-from-terraform" -> null
      - git_clone_url          = "git://github.com/viv-garot/new-repo-from-terraform.git" -> null
      - has_downloads          = false -> null
      - has_issues             = false -> null
      - has_projects           = false -> null
      - has_wiki               = false -> null
      - html_url               = "https://github.com/viv-garot/new-repo-from-terraform" -> null
      - http_clone_url         = "https://github.com/viv-garot/new-repo-from-terraform.git" -> null
      - id                     = "new-repo-from-terraform" -> null
      - is_template            = false -> null
      - name                   = "new-repo-from-terraform" -> null
      - node_id                = "MDEwOlJlcG9zaXRvcnkzOTE3MTExNDU=" -> null
      - private                = false -> null
      - repo_id                = 391711145 -> null
      - ssh_clone_url          = "git@github.com:viv-garot/new-repo-from-terraform.git" -> null
      - svn_url                = "https://github.com/viv-garot/new-repo-from-terraform" -> null
      - visibility             = "public" -> null
      - vulnerability_alerts   = false -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  - repo_full-name = "viv-garot/new-repo-from-terraform" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

github_repository.new-repo: Destroying... [id=new-repo-from-terraform]
github_repository.new-repo: Destruction complete after 0s

Destroy complete! Resources: 1 destroyed.
```
