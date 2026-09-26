---
title: Git & GitHub Workflow Cheat Sheet
layout: doc
---

# Git & GitHub Workflow Cheat Sheet

## Daily command reference

| Command | Description |
| :--- | :--- |
| `git init` | Initialize a local Git repository. |
| `git clone <url>` | Clone an existing remote repository. |
| `git status` | View the current branch and staged, modified, or untracked files. |
| `git diff` | Inspect unstaged changes. |
| `git diff --staged` | Inspect changes staged for commit. |
| `git add <path>` | Stage a file or directory. |
| `git add -p` | Interactively stage selected change hunks. |
| `git add -A` | Stage all additions, modifications, and deletions. |
| `git commit -m "message"` | Commit staged changes with a descriptive message. |
| `git log --oneline --graph --decorate --all` | View compact history across branches. |
| `git branch` | List local branches; `git branch -d <name>` deletes a merged branch. |
| `git switch -c <branch-name>` | Create and switch to a new branch. |
| `git switch <branch-name>` | Switch to an existing branch. |
| `git fetch origin` | Download remote updates without integrating them. |
| `git pull --ff-only` | Fetch and update the current branch only when it can fast-forward. |
| `git push -u origin <branch>` | Push a branch and set its upstream tracking branch. |
| `git merge <branch>` | Merge another branch into the current branch. |
| `git stash push -m "message"` | Save tracked working changes temporarily; add `-u` to include untracked files. |
| `git stash list` / `git stash pop` | List saved stashes / apply and remove the newest stash. |
| `git restore --staged <path>` | Unstage a path without discarding its working-tree edits. |
| `git restore <path>` | Discard unstaged edits to a tracked path. This is destructive. |
| `git revert <commit>` | Create a new commit that reverses an earlier commit. Often preferable for shared history. |

## Feature branch loop

```sh
git switch -c docs/add-reference
git status
git diff
git add -p
git diff --staged
git commit -m "docs: add reference guide"
git push -u origin docs/add-reference
```

Use `git status` and `git diff --staged` before every commit. Keep each commit focused and use a message that describes the change.

## GitHub Flow

1. Create a short-lived branch from the default branch.
2. Make changes and commit them on that branch.
3. Push the branch and open a pull request with a clear summary and context.
4. Review feedback and update the branch; automated checks can catch problems before merge.
5. Merge the approved pull request.
6. Delete the merged branch.

## Resolve a merge conflict

1. Run `git status` to identify conflicted paths.
2. Edit each file, remove conflict markers, and keep the intended result.
3. Stage resolved files with `git add <path>`.
4. Complete the merge with `git commit` when Git requests it. To abandon an in-progress merge, use `git merge --abort`.

## Recovery notes

- `git restore --staged <path>` is the usual way to unstage without losing edits.
- `git restore <path>` overwrites unstaged work with the index version. Check `git diff` first.
- `git revert <commit>` preserves shared history by adding a reversing commit. Avoid rewriting commits that teammates may already have fetched.
- A stash is temporary local storage, not a backup. Inspect with `git stash list` and `git stash show -p` before applying or dropping entries.

## Official references

- [Git command reference](https://git-scm.com/docs)
- [git restore](https://git-scm.com/docs/git-restore)
- [git stash](https://git-scm.com/docs/git-stash)
- [git revert](https://git-scm.com/docs/git-revert)
- [GitHub Flow](https://docs.github.com/en/get-started/using-github/github-flow)
- [GitHub Pages publishing sources](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)

Review `git status` before committing, and inspect changes with `git diff --staged` before pushing.