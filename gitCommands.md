
<!doctype html>
<html lang="en-US" prefix="og: https://ogp.me/ns#">

			
<h2 class="has-text-align-center has-text-color" id="branch" style="color:#d8c13a"><strong>Git Branch Commands</strong></h2>



<ul><li><kbd>git branch</kbd>&nbsp;&#8211;&nbsp;<a href="https://www.gitkraken.com/learn/git/problems/git-branch-list" class="rank-math-link">Display a list of the local branches</a>&nbsp;in your Git repository.</li><li><kbd>git branch -a</kbd>&nbsp;&#8211; Display a list of both local branches and remote branches in your Git repository.</li><li><kbd>git branch -c</kbd>&nbsp;&#8211; Copy a Git branch.</li><li><kbd>git branch -d &lt;branch-name&gt;</kbd>&nbsp;&#8211;&nbsp;<a href="https://www.gitkraken.com/learn/git/problems/delete-local-git-branch" class="rank-math-link">Delete a local Git branch</a>. This command will not work if the branch you are attempting to delete has unmerged changes.</li><li><kbd>git branch -D &lt;branch-name&gt;</kbd>&nbsp;&#8211; Delete a local Git branch with unmerged changes.</li><li><kbd>git branch -m &lt;branch-name&gt; &lt;new-branch-name&gt;</kbd>&nbsp;&#8211; <a href="https://www.gitkraken.com/learn/git/problems/rename-git-branch" target="_blank" rel="noreferrer noopener" class="rank-math-link">Rename a Git branch</a>.</li><li><kbd>git branch -r</kbd>&nbsp;&#8211; Display a list of the remote branches in your Git repository.</li><li><kbd>git push &lt;remote&gt; --delete &lt;remote-branch-name&gt;</kbd>&nbsp;&#8211;&nbsp;<a href="https://www.gitkraken.com/learn/git/problems/delete-remote-git-branch" class="rank-math-link">Delete a remote Git branch</a>.</li><li><kbd>git push --set-upstream &lt;remote&gt; &lt;branch&gt;</kbd>&nbsp;&#8211;&nbsp;<a href="https://www.gitkraken.com/learn/git/problems/git-set-upstream-branch" class="rank-math-link">Set an upstream branch</a>. Running this command will push your local branch to the new remote branch.</li></ul>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<hr class="wp-block-separator has-text-color has-background is-style-default" style="background-color:#262633;color:#262633"/>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<h2 class="has-text-align-center has-text-color" id="checkout" style="color:#d8c13a"><strong>Git Checkout Commands</strong></h2>



<ul><li><kbd>git checkout &lt;branch-name&gt;</kbd>&nbsp;&#8211;&nbsp;<a href="https://www.gitkraken.com/learn/git/problems/switch-git-branch" class="rank-math-link">Switch to a different Git branch</a>.</li><li><kbd>git checkout -b &lt;branch-name&gt;</kbd>&nbsp;&#8211;&nbsp;<a href="https://www.gitkraken.com/learn/git/problems/create-git-branch" class="rank-math-link">Create a new branch</a>&nbsp;and switch to it.</li><li><kbd>git checkout -b &lt;branch-name&gt;&lt;remote-name&gt;/&lt;branch-name&gt;</kbd>&nbsp;&#8211; Create a local branch from the remote Git branch and checkout that branch.</li><li><kbd>git checkout &lt;commit hash&gt;</kbd>&nbsp;&#8211;&nbsp;<a href="https://www.gitkraken.com/learn/git/problems/git-checkout-commit" class="rank-math-link">Checkout a previous Git commit</a>.</li><li><kbd>git checkout &lt;tag name&gt;</kbd>&nbsp;&#8211; Checkout a Git tag in a detached HEAD state.</li><li><kbd>git checkout -b &lt;branch-name&gt;&lt;tag-name&gt;</kbd>&nbsp;&#8211;&nbsp;<a href="https://www.gitkraken.com/learn/git/problems/git-checkout-tag" class="rank-math-link">Checkout a Git tag</a>&nbsp;as a branch.</li></ul>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<hr class="wp-block-separator is-style-default"/>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<h2 class="has-text-align-center has-text-color" id="cherry-pick" style="color:#d8c13a"><strong>Git Cherry Pick Commands</strong></h2>



<ul><li><kbd>git cherry-pick [insert commit reference]</kbd>&nbsp;&#8211;&nbsp;<a href="https://www.gitkraken.com/learn/git/cherry-pick#cherry-pick-example-cli" class="rank-math-link">Apply a commit’s changes</a>&nbsp;onto a different branch.</li></ul>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<hr class="wp-block-separator has-text-color has-background is-style-default" style="background-color:#262633;color:#262633"/>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<h2 class="has-text-align-center has-text-color" id="git-clone-commands" style="color:#d8c13a"><strong>Git Clone Commands</strong></h2>



<ul id="block-48319c50-bf6e-43cc-890b-9a958a96a4a3"><li><kbd>git clone &lt;repository-url&gt;</kbd>&nbsp;&#8211; Clone a specified remote repository. See <a href="https://git-scm.com/docs/git-clone#_git_urls" target="_blank" rel="noreferrer noopener">Git-SCM’s best practices for remote URL format</a>.</li><li><kbd>git clone &lt;repository-url&gt; &lt;directory-name&gt;</kbd>&nbsp;&#8211; Clone a repository and name the local directory.</li><li><kbd>git clone &lt;repository-url&gt; --origin &lt;name&gt;</kbd>&nbsp;&#8211; <a href="https://www.gitkraken.com/learn/git/git-clone" target="_blank" rel="noreferrer noopener">Clone a repository</a> and name the remote (<code>&lt;name&gt;</code>). If you do not wish to name the remote, Git will provide the default name <code>origin</code>.</li><li><kbd>git clone &lt;repository-url&gt; --branch &lt;branch-name&gt;</kbd>&nbsp;&#8211; Clone a repository and checkout the specific branch.&nbsp;</li><li><kbd>git clone &lt;repository-url&gt; --depth &lt;depth&gt;</kbd>&nbsp;&#8211; Clone a repository with a specified number of commits (<code>&lt;depth&gt;</code>).&nbsp;</li><li><kbd>git clone &lt;repository-url&gt; --no-tags</kbd>&nbsp;&#8211; Clone a repository without copying the repo’s tags.</li></ul>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<hr class="wp-block-separator"/>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<h2 class="has-text-align-center has-text-color" id="commit" style="color:#d8c13a"><strong>Git Commit Commands</strong></h2>



<ul><li><kbd>git status</kbd>&nbsp;&#8211; Display a list of files in your staging directory with accompanying file status.</li><li><kbd>git add</kbd>&nbsp;&#8211; Stage file changes. Running this command with an associated file name will stage the file changes to your staging directory.</li><li><kbd>git commit</kbd>&nbsp;&#8211; Save changes to your Git repository. Running this command with an associated file name will save the file changes to your repo.</li><li><kbd>git commit -a</kbd>&nbsp;&#8211; Add all modified and deleted files in your working directory to the current commit.</li><li><kbd>git commit --amend</kbd>&nbsp;&#8211; <a href="https://www.gitkraken.com/learn/git/problems/git-commit-amend" target="_blank" rel="noreferrer noopener" class="rank-math-link">Amend a Git commit</a>. Edit a Git commit message by adding a message in quotation marks after the command.</li><li><kbd>git commit -m</kbd>&nbsp;&#8211; Add a Git commit message. Add your message in quotation marks following the command.</li></ul>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<hr class="wp-block-separator has-text-color has-background is-style-default" style="background-color:#262633;color:#262633"/>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<h2 class="has-text-align-center has-text-color" id="merge" style="color:#d8c13a"><strong>Git Merge Commands</strong></h2>



<ul><li><kbd>git merge</kbd>&nbsp;&#8211; Combine two or more development histories together. Used in combination with fetch, this will combine the fetched history from a remote branch into the currently checked out local branch.</li><li><kbd>git merge &lt;branch-name&gt;</kbd>&nbsp;&#8211;&nbsp;<a href="https://www.gitkraken.com/learn/git/problems/merge-git-branch" class="rank-math-link">Merge changes from one branch</a>&nbsp;into the branch you currently have checked out.</li><li><kbd>git merge --abort</kbd>&nbsp;&#8211; Aborts the merge process and restores the project’s state to before the merge was attempted. This works as a failsafe when a conflict occurs.</li><li><kbd>git merge --continue</kbd>&nbsp;&#8211; Attempt to complete a merge that was stopped due to file conflicts after <a href="https://www.gitkraken.com/learn/git/tutorials/how-to-resolve-merge-conflict-in-git" target="_blank" rel="noreferrer noopener" class="rank-math-link">resolving the merge conflict</a>.</li><li><kbd>git merge --squash</kbd>&nbsp;&#8211; Combine all changes from the branch being merged into a single commit rather than preserving them as individual commits.</li><li><kbd>git merge --no-commit</kbd>&nbsp;&#8211; Combine branch into the current branch, but do not make a new commit.</li><li><kbd>git merge --no-ff</kbd>&nbsp;&#8211; Creates a merge commit instead of attempting a fast-forward.</li></ul>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<hr class="wp-block-separator is-style-default"/>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<h2 class="has-text-align-center has-text-color" id="git-pull-commands" style="color:#d8c13a"><strong>Git Pull Commands</strong></h2>



<ul><li><kbd>git pull</kbd> &#8211; This will perform a <code>git fetch</code> followed by a <code>git merge FETCH_HEAD</code>, and will allow you to fetch from and integrate with another repository or a local branch.</li><li><kbd>git pull --quiet</kbd> &#8211; Suppress the output text after both <code>git fetch</code> and <code>git merge</code>.</li><li><kbd>git pull --verbose</kbd> &#8211; Expand the output text after both <code>git fetch</code> and <code>git merge</code>.</li></ul>



<div style="height:20px" aria-hidden="true" class="wp-block-spacer"></div>



<h4 class="has-text-align-center has-text-color" style="color:#d8c13a"><strong>Git Pull Commands Related to Merge</strong></h4>



<ul><li><kbd>git pull --squash</kbd> &#8211; Combine all changes from the branch being merged into a single commit, rather than preserving the individual commits.</li><li><kbd>git pull --no-commit</kbd> &#8211; Combine the currently checked out branch with the remote upstream branch.</li><li><kbd>git pull --no-ff</kbd> &#8211;&nbsp; Create a merge commit in all cases, even when the merge could instead be resolved as a fast-forward.</li></ul>



<div style="height:20px" aria-hidden="true" class="wp-block-spacer"></div>



<h4 class="has-text-align-center has-text-color" style="color:#d8c13a"><strong>Git Pull Commands Related to Fetch</strong></h4>



<ul><li><kbd>git pull --all</kbd>&nbsp; &#8211; Fetch all remotes.&nbsp;</li><li><kbd>git pull --depth=&lt;depth&gt;</kbd> &#8211; Fetch a limited number of commits.&nbsp;</li><li><kbd>git pull --dry-run</kbd> &#8211; Show the action that would be completed without actually making changes to your repo.</li><li><kbd>git pull --prune</kbd> &#8211; Remove all remote references that no longer exist on the remote.</li><li><kbd>git pull --no-tags</kbd> &#8211; Do not fetch tags.</li></ul>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<hr class="wp-block-separator"/>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<h2 class="has-text-align-center has-text-color" id="git-push-commands" style="color:#d8c13a"><strong>Git Push Commands</strong></h2>



<ul id="block-a175d058-3a09-4884-b8f8-8dc4b7e71907"><li><kbd>git push</kbd>&nbsp; &#8211; Push the current checked out branch to the default remote <code>origin</code>.&nbsp;</li><li><kbd>git push &lt;remote&gt;&lt;branch&gt;</kbd> &#8211; Push the specified branch along with all of its necessary commits to your destination remote repository.&nbsp;</li><li><kbd>git push &lt;remote&gt; --force</kbd> &#8211; Force a Git push in a non-fast-forward merge. This option forces the update of a remote ref even when that is not the ancestor of the local ref. This can cause the remote repository to loose commits, so use with care.</li><li><kbd>git push &lt;remote&gt; --all</kbd> &#8211; Push all local branches to a specified remote.</li><li><kbd>git push &lt;remote&gt; --tags</kbd> &#8211; Push all local tags to a specified remote. Tags are not automatically sent when using <code>--all</code>.</li></ul>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<hr class="wp-block-separator"/>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<h2 class="has-text-align-center has-text-color" id="rebase" style="color:#d8c13a"><strong>Git Rebase Commands</strong></h2>



<ul><li><kbd>git rebase &lt;target branch name&gt;</kbd>&nbsp;&#8211; Rebase your currently checked out branch onto a target branch. This rewrites a commit(s) from the source branch and applies it on the top of the target branch.</li><li><kbd>git rebase --continue</kbd>&nbsp;&#8211; Proceed with a <a href="https://www.gitkraken.com/learn/git/git-rebase" target="_blank" rel="noreferrer noopener" class="rank-math-link">Git rebase</a> after you have resolved a conflict between files.</li><li><kbd>git rebase --skip</kbd>&nbsp;&#8211; Skip an action that results in a conflict to proceed with a Git rebase.</li><li><kbd>git rebase --abort</kbd>&nbsp;&#8211; Cancel a Git rebase. Your branch will be back in the state it was before you started the rebase.</li><li><kbd>git rebase &lt;target branch name&gt; -i</kbd>&nbsp;&#8211; Initiate&nbsp;<a href="https://www.gitkraken.com/learn/git/problems/git-interactive-rebase" class="rank-math-link">interactive rebase</a>&nbsp;from your currently checked out branch onto a target branch.</li></ul>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<hr class="wp-block-separator has-text-color has-background is-style-default" style="background-color:#262633;color:#262633"/>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<h2 class="has-text-align-center has-text-color" id="stash" style="color:#d8c13a"><strong>Git Stash Commands</strong></h2>



<ul><li><kbd>git stash</kbd>&nbsp;&#8211; Create a stash with local modifications and revert back to the head commit.</li><li><kbd>git stash list</kbd>&nbsp;&#8211; Display a list of all stashes in your repository.</li><li><kbd>git stash show</kbd>&nbsp;&#8211; View the content of your most recent stash. This will show your stashed changes as a diff between the stashed content and the commit from back when the stash was created.</li><li><kbd>git stash drop &lt;stash&gt;</kbd>&nbsp;&#8211; Remove a stash from the list of stashes in your repository.</li><li><kbd>git stash pop &lt;stash&gt;</kbd>&nbsp;&#8211; Apply a stash to the top of the current working tree and remove it from your list of stashes.</li><li><kbd>git stash apply &lt;stash&gt;</kbd>&nbsp;&#8211; Apply a stash on top of the current working tree. The stash will not be removed from your list of stashes.</li><li><kbd>git stash clear</kbd>&nbsp;&#8211; Remove all stashes from your repository.</li></ul>

</body>
</html>

<!-- This website is like a Rocket, isn't it? Performance optimized by WP Rocket. Learn more: https://wp-rocket.me -->
