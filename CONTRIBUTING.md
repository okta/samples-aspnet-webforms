# Contributing to Okta Open Source Repos

## Style

### Git Commit Messages

We use a simplified form of [Atom's](https://github.com/atom/atom/blob/master/CONTRIBUTING.md#git-commit-messages) commit convention.

  * Use the present tense ("Adds feature" not "Added feature")
  * Limit the first line to 72 characters or less
  * Add one feature per commit. If you have multiple features, have multiple commits.

#### Template

    <emoji> Short Description of Commit
    <BLANKLINE>
    More detailed description of commit
    <BLANKLINE>
    Resolves: <Jira # or Issue #>

#### Emoji Categories
Our categories include:
  * :seedling: `:seedling:` when creating a new feature
  * :bug: `:bug:` when fixing a bug
  * :white_check_mark: `:white_check_mark:` when adding tests
  * :art: `:art:` when improving the format/structure of the code
  * :memo: `:memo:` when writing docs
  * :fire: `:fire:` when removing code or files
  * :package: `:package:` when pushing a new release
  * :arrow_up: `:arrow_up:` when upgrading dependencies, or generating files
  * :arrow_down: `:arrow_down:` when downgrading dependencies

If you do not see an exact emoji match, use the best matching emoji.

#### Example
    :memo: Updates CONTRIBUTING.md

    Updates Contributing.md with new emoji categories
    Updates Contributing.md with new template

    Resolves: OKTA-12345

## Running E2E Tests locally

### Prerequisites

Before running the tests, you'll need the following

* node.js and npm installed on your machine
* iisexpress installed and available on command lin
e
You will also need the following configured in your okta developer org:
* [A Web application](/okta-hosted-login#prerequisites)
* A test user account with a known username and password.  Note that the username should be of the form "username@email.com"

E2E Tests will be run against the Okta-Hosted Login and Self-Hosted Login servers

Before running the tests locally, install all the dependencies in the e2e-tests
```bash
cd e2e-tests
npm install
```
Once you have those resources setup, export their details as the following environment variables:

```bash
setx ISSUER https://{yourOktaDomain}/oauth2/default
setx CLIENT_ID {yourWebAppClientId}
setx CLIENT_SECRET {yourWebAppClientSecret}
setx USER_NAME {userName}
setx PASSWORD {password}
```

As an alternative you can provide the environment variables in a file named `testenv` in the root folder.

For example:

```
ISSUER=https://dev-12345.oktapreview.com/oauth2/default
CLIENT_ID=webclient123
CLIENT_SECRET=websecret123
USERNAME=myuser@example.com
PASSWORD=mypassword
```

Then run the E2E tests:

```bash
npm test
```

> **NOTE:** If you want to execute individual tests such as `npm run test:okta-hosted-login`, you will need to update the environment by running the following node script:

```bash
node scripts/update-webconfig.js
```
