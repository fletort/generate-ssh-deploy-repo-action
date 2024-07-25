# generate-ssh-deploy-repo-action
Generate a new ssh key pair to permit to a repo to deploy to another repo.

[![Continuous Testing](https://github.com/fletort/generate-ssh-deploy-repo-action/actions/workflows/test.yml/badge.svg)](https://github.com/fletort/generate-ssh-deploy-repo-action/actions/workflows/test.yml)

## Behaviour

- A new ssh key pair is created. Its encryption is defined by `key_encryption` and its size by `key_size`
- The private key is saved as a secret (which name is defined by `secret_name`) in the `client_repo`
- The public key is added as a publish key in the `deploy_repo`

For all these action the given `token` is used. It must can:

- Checkout the `client_repo`
- Save a secret on the `client_repo`
- Add a publish key to the `deploy_repo`

We recommend using a service account with the least permissions necessary. Also
when generating a new PAT, select the least scopes necessary.
[Learn more about creating and using encrypted secrets](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets)

## Usage

<!-- start usage -->

```yaml
- uses: fletort/generate-ssh-deploy-repo-action@v1
  with:
  # Repo on which we want to make deployement
  # Required
  deploy_repo: owner/repo_name_published

  # Token used to save the private key on the client_repo secret and to save the public key on the publish key of the deploy_repo
  # Required
  token: ''
  
  # Repo that will publish to the deploy_repo
  # Default: ${{ github.repository }}
  client_repo: ''

  # Key Encryption Type (dsa, ecdsa, ed25519, rsa)
  # Default: 'rsa'
  key_encryption: ''
  
  # Key Size (in bits)
  # Default: 4096
  key_size:
    description: 'Key Size (in bits)'
    default: '4096'
  
  # Name of the secret storing the private key on the client repo side
  # Default: 'PUBLISHING_KEY'
  secret_name: ''
    
```
<!-- end usage -->

## Code Quality

All unit/functional test executed on each branch/PR are listed/described on
[testspace](https://fletort.testspace.com/projects/68169/spaces).

## License

The scripts and documentation in this project are released under the
[MIT License](LICENSE)

