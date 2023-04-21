# Create gitlab group
resource "gitlab_group" "test1" {
  name        = "Test Group 1"
  path        = "test"
  description = "This group was created for demo purposes"
}

# Create gitlab project
resource "gitlab_project" "test1" {
  name                   = "Test Project 1"
  description            = "This project was created for demo purposes"
  namespace_id           = gitlab_group.test1.id
  import_url          = "https://gitlab.com/gitlab-org/project-templates/express.git"
}

# Get gitlab active runners
data "http" "gitlab_runners" {
  url = "https://gitlab/api/v4/runners/all?status=online"
  insecure = true

  request_headers = {
    "PRIVATE-TOKEN" = "glpat-BtJoZTdzmZtzgz5m2fgs"
  }
}

# Register gitlab runner to project
resource "gitlab_project_runner_enablement" "gitlab_runner" {
  project   = gitlab_project.test1.id
  runner_id = jsondecode(data.http.gitlab_runners.response_body)[0]["id"]
}
