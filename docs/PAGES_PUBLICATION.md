# Publishing the original and experimental sites

The repository root holds the original site; `experimental/` holds the draft.
The draft source may be on `master` after a merge or on a separate reviewed
branch. The Pages workflow builds the original source from `master` at `/`
and the selected draft source at `/experimental/`, then uploads one static
artifact. Its only trigger is a manual `workflow_dispatch`; it does not
publish on push.

## Verify the artifact locally

From the branch containing the reviewed draft, build the original site from
a fresh `master` archive and the draft from the working tree:

```sh
review_dir=$(mktemp -d)
mkdir "$review_dir/master"
git archive master | tar -x -C "$review_dir/master"
./script/build-pages-site "$review_dir/site" "$review_dir/master"
python3 script/serve-local-composite.py --site "$review_dir/site" --port 4002
```

Open `http://127.0.0.1:4002/` and
`http://127.0.0.1:4002/experimental/`; stop the preview with `Ctrl-C`.
The destination must not exist before building. The command checks the custom-domain
`CNAME`, both homepages, the draft's prefixed links and `noindex` requests,
and internal HTML links. It removes generated copies of internal maintenance
files from the original site. Both source trees remain untouched.
The draft is built with `https://autodiallab.ca` as its site URL.

## Activate only after review and approval

1. Review the scientific content and all files in `experimental/`, including
   `_publication_review/`. Pushing a branch to a public repository makes its
   source files visible on GitHub, even when Jekyll excludes them from Pages.
2. Push reviewed changes only after authorization. If the draft remains on a
   separate branch, record its commit SHA for the manual workflow input.
3. Add `.github/workflows/pages-combined.yml` to the default branch. GitHub
   requires a manually dispatched workflow file to exist on that branch.
   This step does not itself trigger the workflow.
4. Confirm the repository's current Pages source and custom-domain settings.
   When authorized, change Pages **Source** to **GitHub Actions**, leaving
   `autodiallab.ca` and DNS unchanged. This replaces the branch-based
   publishing process; future site updates will need a workflow run.
5. Manually run **Publish original and experimental sites** from Actions and
   select `master` in the workflow branch dropdown. If the reviewed
   `experimental/` changes have already been merged into `master`, leave
   `draft_ref` blank. The workflow then builds the exact selected `master`
   commit. Otherwise, enter the reviewed draft branch or commit SHA.
   Check the **Record the draft commit** step to
   confirm which source the workflow actually built. The workflow checks out
   `master` separately for the original site and runs `make test` before
   uploading and deploying the combined artifact. The workflow branch
   dropdown only selects the workflow file; `draft_ref` selects the draft
   content. An older remote feature branch can produce an older draft even
   when `master` contains newer changes.
6. Check `https://autodiallab.ca/` and
   `https://autodiallab.ca/experimental/`, including News, Publications,
   Software, member interactions, images, and links. Keep the draft URL off
   the original site's navigation if access by direct link is intended.

The `noindex` request on draft pages is not access control. Once deployed,
the draft is publicly accessible to anyone with the URL. A future update
requires another reviewed commit and manual workflow run.

No remote repository, Pages setting, DNS record, or public site is changed
by the local scripts in this document.
