local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-ditto') {
  settings+: {
    description: "",
    members_can_change_project_visibility: false,
    name: "Eclipse Ditto™",
    packages_containers_internal: false,
    packages_containers_public: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/ditto/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('ditto') {
      allow_merge_commit: true,
      allow_rebase_merge: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Ditto™: Digital Twin framework of Eclipse IoT - main repository",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      has_wiki: false,
      homepage: "https://eclipse.dev/ditto/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "akka",
        "digital-shadow",
        "digital-twin",
        "digital-twins",
        "ditto",
        "eclipse-ditto",
        "eclipseiot",
        "hacktoberfest",
        "internet-of-things",
        "iot",
        "java",
        "javascript",
        "mongodb",
        "w3c",
        "web-of-things",
        "wot"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('DOCKER_HUB_TOKEN') {
          value: "********",
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('ditto-clients') {
      allow_merge_commit: true,
      allow_rebase_merge: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Ditto™: Digital Twin framework - Client SDKs for Java and JavaScript",
      has_wiki: false,
      homepage: "https://eclipse.org/ditto",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "client-sdks",
        "ditto-clients",
        "eclipse-ditto",
        "hacktoberfest",
        "java",
        "typescript"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('ditto-clients-golang') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Eclipse Ditto™: Digital Twin framework - Client SDK for Golang",
      homepage: "https://eclipse.org/ditto/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "client-sdk",
        "eclipse-ditto",
        "golang",
        "golang-library"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('ditto-clients-python') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Eclipse Ditto™: Digital Twin framework - Client SDK for Python",
      homepage: "https://eclipse.org/ditto/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "client-sdk",
        "eclipse-ditto",
        "python",
        "python-library"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('ditto-examples') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Ditto™: Digital Twin framework - Examples",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "master",
      gh_pages_source_path: "/",
      has_projects: false,
      has_wiki: false,
      homepage: "https://eclipse.org/ditto",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "eclipse-ditto",
        "examples",
        "hacktoberfest",
        "java"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('ditto-testing') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      description: "Eclipse Ditto™: Digital Twin framework - Testing repository",
      has_wiki: false,
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('ditto-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Eclipse Ditto™: Digital Twin framework - Static website",
      homepage: "https://eclipse.org/ditto/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
  ],
}
