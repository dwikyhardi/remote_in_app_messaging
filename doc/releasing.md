# Automated releases

The release flow for this Flutter package:

1. `CI` runs on pull requests and pushes to `main`, using FVM and `.fvmrc`.
   It analyzes the package and example, runs tests, and validates a publish dry run.
2. After a successful push CI run on `main`, `Auto Tag Release` checks the
   `pubspec.yaml` version on pub.dev. Already published versions are skipped.
3. For an unpublished version, it validates another dry run and pushes
   `remote_in_app_messaging-v<version>` at the tested commit.
4. The tag starts `Publish`, which verifies the version and `main` ancestry,
   repeats analysis/tests, and publishes to pub.dev with GitHub OIDC.

No version is changed automatically. All Flutter/Dart commands use FVM;
the shared setup action installs FVM with its official installer.

## One-time setup

- Add the repository Actions secret `RELEASE_PAT`: a GitHub personal access
  token restricted to `dwikyhardi/remote_in_app_messaging` with **Contents:
  read and write**. An automatically created `GITHUB_TOKEN` cannot trigger
  another workflow by pushing a tag, so it cannot replace this credential.
- In the package's [pub.dev administration settings](https://pub.dev/packages/remote_in_app_messaging/admin),
  enable automated publishing from GitHub Actions for repository
  `dwikyhardi/remote_in_app_messaging`, with tag pattern
  `remote_in_app_messaging-v{{version}}`. The publishing workflow is
  `.github/workflows/publish.yml`. No pub.dev token belongs in GitHub secrets.
- Merge the workflows into `main`. Local workflow files do not activate Actions.

## Releasing a version

Update `pubspec.yaml` and `CHANGELOG.md`, then merge the change into `main`.
Successful CI starts the tag/publish flow. Versions already on pub.dev are
skipped. Version bumps remain an explicit maintainer decision.

If publishing fails after the tag was pushed, fix the external setup and re-run
that tag's failed `Publish` run in GitHub Actions. Tags pointing at a different
commit are rejected; the workflows never move existing tags.
