# AGENTS.md

## Pull requests

- Every PR to this repository must carry exactly one of the labels `major`,
  `minor`, or `patch`. The `Check for semantic version label` CI job
  (`.github/workflows/pr-commit-run-checks.yaml`) fails a PR without one.
- The label drives the chart version bump on merge
  (`.github/workflows/post-merge-build-and-upload.yaml`): use `patch` for
  fixes, `minor` for features, `major` for breaking changes. Chart versions in
  `charts/*/Chart.yaml` are bumped by a GitHub action — never bump them in a PR.
- The label check only runs on opened/synchronize/reopened, so adding a label
  does not re-run a failed job. Label the PR, then re-run the check:
  `gh run rerun <run-id> --failed` or the "Re-run failed jobs" button.
