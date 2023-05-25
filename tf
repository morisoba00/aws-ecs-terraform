name: "Terraform"

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

env:
  OIDC_ARN: arn:aws:iam::xxxxxxxxxxxx:role/GitHubActionsOIDC
  # Change xxxxxxxxxxxx to your AWS account id

permissions:
  id-token: write
  contents: read
  pull-requests: write

jobs:
  terraform:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Setup tfcmt
        env:
          TFCMT_VERSION: v4.0.0
        run: |
          wget "https://github.com/suzuki-shunsuke/tfcmt/releases/download//tfcmt_linux_amd64.tar.gz" -O /tmp/tfcmt.tar.gz
          tar xzf /tmp/tfcmt.tar.gz -C /tmp
          mv /tmp/tfcmt /usr/local/bin
          tfcmt --version
