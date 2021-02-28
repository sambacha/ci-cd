# CI/CD Configurations 

## Overview

GitHub Actions CI/CD `.yml` files

[@docs.github.com/en/actions/creating-actions](https://docs.github.com/en/actions/creating-actions/metadata-syntax-for-github-actions#runs-for-composite-run-steps-actions)

## Workflow templates

If you need to share workflows and other GitHub Actions features with your team, then consider collaborating within a GitHub organization. An organization allows you to centrally store and manage secrets, artifacts, and self-hosted runners. You can also create workflow templates in the .github repository and share them with other users in your organization.
Creating a workflow template

Workflow templates can be created by users with write access to the organization's .github repository. The templates can then be used by organization members who have permission to create workflows. Workflow templates can be used to create new workflows in an organizations' public repositories; to use templates to create workflows in private repositories, the organization must be part of an enterprise or GitHub One plan.

This procedure demonstrates how to create a workflow template and metadata file. The metadata file describes how the template is presented to users when they are creating a new workflow.

If it doesn't already exist, create a new public repository named .github in your organization.

Create a directory named workflow-templates.

Create your new workflow file inside the workflow-templates directory.

If you need to refer to a repository's default branch, you can use the $default-branch placeholder. When a workflow is created using your template, the placeholder will be automatically replaced with the name of the repository's default branch.

```yaml
    name: Octo Organization CI

    on:
      push:
        branches: [ $default-branch ]
      pull_request:
        branches: [ $default-branch ]

    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
          - uses: actions/checkout@v2

          - name: Run a one-line script
            run: echo Hello from Octo Organization
```

Create a metadata file inside the workflow-templates directory. The metadata file must have the same name as the workflow file, but instead of the .yml extension, it must be appended with .properties.json. For example, this file named octo-organization-ci.properties.json contains the metadata for a workflow file named octo-organization-ci.yml:

```json
    {
        "name": "Octo Organization Workflow",
        "description": "Octo Organization CI workflow template.",
        "iconName": "example-icon",
        "categories": [
            "Go"
        ],
        "filePatterns": [
            "package.json$",
            "^Dockerfile",
            ".*\\.md$"
        ]
    }
```

## License 

ISC/MIT/Apache-2.0 - You Pick
