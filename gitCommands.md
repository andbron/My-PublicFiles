
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



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<hr class="wp-block-separator"/>



<div style="height:40px" aria-hidden="true" class="wp-block-spacer"></div>



<div class="callout">
<div class="callout">
<div class="callout-content">
<p>Download our free Git commands cheat sheet PDF to have the most common CLI commands and actions at your fingertips.<br></p>
<a href="/pdfs/git-basics-cheat-sheet" class="button button--basic">Get the Free Git Cheat Sheet</a>
</div>
</div>
		</div>
				</div>
					</div>
		</div>
							</div>
		</section>
				<section class="elementor-section elementor-top-section elementor-element elementor-element-10304563 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="10304563" data-element_type="section" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
						<div class="elementor-container elementor-column-gap-default">
					<div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-6c40f89a" data-id="6c40f89a" data-element_type="column">
			<div class="elementor-widget-wrap elementor-element-populated">
								<div class="elementor-element elementor-element-27d953cf elementor-widget elementor-widget-heading" data-id="27d953cf" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h3 class="elementor-heading-title elementor-size-default"><b>Make Git Easier, Safer &<br> More Powerful</b></h3>		</div>
				</div>
				<div class="elementor-element elementor-element-8419e8f elementor-widget elementor-widget-text-editor" data-id="8419e8f" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
								<p><span style="font-weight: 400;">with GitKraken</span></p>						</div>
				</div>
				<div class="elementor-element elementor-element-73645376 elementor-widget elementor-widget-global elementor-global-1725 elementor-widget-html" data-id="73645376" data-element_type="widget" data-widget_type="html.default">
				<div class="elementor-widget-container">
			<div class='btn-container dl-container mtz'>
    <noscript>
        <a href='/download' class='button os button--basic all'>
                    Download GitKraken
                    <span class='button__subtext'>Windows / Mac / Linux</span>
        </a>
    </noscript>
</div>  		</div>
				</div>
					</div>
		</div>
				<div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-34d0c778 elementor-hidden-tablet elementor-hidden-phone" data-id="34d0c778" data-element_type="column">
			<div class="elementor-widget-wrap">
									</div>
		</div>
				<div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-549733dc elementor-hidden-tablet elementor-hidden-phone" data-id="549733dc" data-element_type="column">
			<div class="elementor-widget-wrap elementor-element-populated">
								<div class="elementor-element elementor-element-2244781 elementor-hidden-tablet elementor-hidden-phone elementor-widget elementor-widget-image" data-id="2244781" data-element_type="widget" data-widget_type="image.default">
				<div class="elementor-widget-container">
															<picture class="attachment-large size-large">
<source type="image/webp" data-lazy-srcset="https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2-1024x624.png.webp 1024w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2-300x183.png.webp 300w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2-768x468.png.webp 768w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2.png.webp 1441w" srcset="data:image/svg+xml,%3Csvg%20xmlns=&#039;http://www.w3.org/2000/svg&#039;%20viewBox=&#039;0%200%20800%20488&#039;%3E%3C/svg%3E" data-lazy-sizes="(max-width: 800px) 100vw, 800px"/>
<img width="800" height="488" src="data:image/svg+xml,%3Csvg%20xmlns=&#039;http://www.w3.org/2000/svg&#039;%20viewBox=&#039;0%200%20800%20488&#039;%3E%3C/svg%3E" alt="" data-lazy-srcset="https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2-1024x624.png 1024w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2-300x183.png 300w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2-768x468.png 768w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2.png 1441w" data-lazy-sizes="(max-width: 800px) 100vw, 800px" data-lazy-src="https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2-1024x624.png"/>
</picture>
<noscript><picture class="attachment-large size-large">
<source type="image/webp" srcset="https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2-1024x624.png.webp 1024w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2-300x183.png.webp 300w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2-768x468.png.webp 768w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2.png.webp 1441w" sizes="(max-width: 800px) 100vw, 800px"/>
<img width="800" height="488" src="https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2-1024x624.png" alt="" srcset="https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2-1024x624.png 1024w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2-300x183.png 300w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2-768x468.png 768w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/gk-product-2.png 1441w" sizes="(max-width: 800px) 100vw, 800px"/>
</picture>
</noscript>															</div>
				</div>
					</div>
		</div>
							</div>
		</section>
				</div>
		</div>
				<div data-elementor-type="footer" data-elementor-id="5898" class="elementor elementor-5898 elementor-location-footer" data-elementor-settings="[]">
		<div class="elementor-section-wrap">
					<section class="elementor-section elementor-top-section elementor-element elementor-element-8751f3e embed-hidden elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="8751f3e" data-element_type="section" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
						<div class="elementor-container elementor-column-gap-default">
					<div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-56c5f88" data-id="56c5f88" data-element_type="column">
			<div class="elementor-widget-wrap elementor-element-populated">
								<div class="elementor-element elementor-element-29046e0 elementor-widget elementor-widget-image" data-id="29046e0" data-element_type="widget" data-widget_type="image.default">
				<div class="elementor-widget-container">
															<img width="150" height="150" src="data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20150%20150'%3E%3C/svg%3E" class="attachment-thumbnail size-thumbnail" alt="" data-lazy-srcset="https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads//2021/06/gitkraken-keif-mono-teal-sq.svg 150w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads//2021/06/gitkraken-keif-mono-teal-sq.svg 300w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads//2021/06/gitkraken-keif-mono-teal-sq.svg 1024w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads//2021/06/gitkraken-keif-mono-teal-sq.svg 1536w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads//2021/06/gitkraken-keif-mono-teal-sq.svg 2048w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads//2021/06/gitkraken-keif-mono-teal-sq.svg 700w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads//2021/06/gitkraken-keif-mono-teal-sq.svg 225w" data-lazy-sizes="(max-width: 150px) 100vw, 150px" height="225" width="225" data-lazy-src="https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/06/gitkraken-keif-mono-teal-sq.svg" /><noscript><img width="150" height="150" src="https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/2021/06/gitkraken-keif-mono-teal-sq.svg" class="attachment-thumbnail size-thumbnail" alt="" srcset="https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads//2021/06/gitkraken-keif-mono-teal-sq.svg 150w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads//2021/06/gitkraken-keif-mono-teal-sq.svg 300w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads//2021/06/gitkraken-keif-mono-teal-sq.svg 1024w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads//2021/06/gitkraken-keif-mono-teal-sq.svg 1536w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads//2021/06/gitkraken-keif-mono-teal-sq.svg 2048w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads//2021/06/gitkraken-keif-mono-teal-sq.svg 700w, https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads//2021/06/gitkraken-keif-mono-teal-sq.svg 225w" sizes="(max-width: 150px) 100vw, 150px" height="225" width="225" /></noscript>															</div>
				</div>
				<section class="elementor-section elementor-inner-section elementor-element elementor-element-fca6d85 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="fca6d85" data-element_type="section">
						<div class="elementor-container elementor-column-gap-default">
					<div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-6b976b8" data-id="6b976b8" data-element_type="column">
			<div class="elementor-widget-wrap elementor-element-populated">
								<div class="elementor-element elementor-element-9315339 elementor-widget elementor-widget-text-editor" data-id="9315339" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
								<strong>Products</strong> 						</div>
				</div>
				<div class="elementor-element elementor-element-f6c3d25 elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="f6c3d25" data-element_type="widget" data-widget_type="divider.default">
				<div class="elementor-widget-container">
					<div class="elementor-divider">
			<span class="elementor-divider-separator">
						</span>
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-a2d6ad8 elementor-widget elementor-widget-text-editor" data-id="a2d6ad8" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
								<a href="/pricing" style="color: #fff"><strong>Pricing</strong></a> 						</div>
				</div>
				<div class="elementor-element elementor-element-1873b37 elementor-widget elementor-widget-text-editor" data-id="1873b37" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
								<strong>GitKraken Client</strong>						</div>
				</div>
				<div class="elementor-element elementor-element-5215597 elementor-widget elementor-widget-text-editor" data-id="5215597" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
								<ul style="list-style-type: none; margin-left: -25px;"><li><a style="color: #8499a0;" href="https://app.gitkraken.com/login" target="_blank" rel="noopener">Login</a></li><li><a style="color: #8499a0;" href="/git-client/support" target="_blank" rel="noopener">Support</a></li><li><a style="color: #8499a0;" href="https://support.gitkraken.com/release-notes/current/" target="_blank" rel="noopener">Release Notes</a></li><li><a style="color: #8499a0;" href="/git-client/roadmap">Roadmap</a></li><li><a style="color: #8499a0;" href="https://www.gitkraken.com/pdfs/gitkraken-git-gui-cheat-sheet">Cheat Sheet</a></li></ul>						</div>
				</div>
				<div class="elementor-element elementor-element-6df869b elementor-widget elementor-widget-text-editor" data-id="6df869b" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
								<strong>GitLens</strong>						</div>
				</div>
				<div class="elementor-element elementor-element-a0564ad elementor-widget elementor-widget-text-editor" data-id="a0564ad" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
								<ul style="list-style-type: none; margin-left: -25px;">
 	<li><a href="https://support.gitkraken.com/gitlens" target="_blank" style="color: #8499a0;rel="noopener">Support</a></li>
 	<li><a style="color: #8499a0;" href="/gitlens/resources">Resources</a></li>
</ul>						</div>
				</div>
				<div class="elementor-element elementor-element-8ff2a65 elementor-widget elementor-widget-text-editor" data-id="8ff2a65" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
								<strong>Git Integration for Jira</strong>						</div>
				</div>
				<div class="elementor-element elementor-element-3dbf499 elementor-widget elementor-widget-text-editor" data-id="3dbf499" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
								<ul style="list-style-type: none; margin-left: -25px;"><li><a style="color: #8499a0;" href="/git-integration-for-jira/support">Support</a></li><li><a style="color: #8499a0;" href="/git-integration-for-jira/resources">Resources</a></li></ul>						</div>
				</div>
					</div>
		</div>
				<div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-d97af8b" data-id="d97af8b" data-element_type="column">
			<div class="elementor-widget-wrap elementor-element-populated">
								<div class="elementor-element elementor-element-6d79b1c elementor-widget elementor-widget-text-editor" data-id="6d79b1c" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
								<strong>Community</strong>						</div>
				</div>
				<div class="elementor-element elementor-element-8bd2867 elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="8bd2867" data-element_type="widget" data-widget_type="divider.default">
				<div class="elementor-widget-container">
					<div class="elementor-divider">
			<span class="elementor-divider-separator">
						</span>
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-6534ff0 elementor-widget elementor-widget-text-editor" data-id="6534ff0" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
								<p><a href="/blog">Git Blog</a><br /><a href="/gitkon">Git Conference</a><br /><strong><a href="/sample-customers">Customers</a><br /><a href="/newsletter">Newsletter</a><br /><a href="https://slack.gitkraken.com/" target="_blank" rel="noopener">Slack Community</a><br /><a href="/student-resources">GitKraken for Students</a><br /><a href="/github-campus-program">GitKraken for Schools</a><br /><a href="/store">Store</a><br /><a href="/keif-gallery">Keif Gallery</a><br /><a href="/referrals">Referrals</a></strong></p>						</div>
				</div>
					</div>
		</div>
				<div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-a8f3df8" data-id="a8f3df8" data-element_type="column">
			<div class="elementor-widget-wrap elementor-element-populated">
								<div class="elementor-element elementor-element-62b1870 elementor-widget elementor-widget-text-editor" data-id="62b1870" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
								<strong>Company</strong>						</div>
				</div>
				<div class="elementor-element elementor-element-9180dab elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="9180dab" data-element_type="widget" data-widget_type="divider.default">
				<div class="elementor-widget-container">
					<div class="elementor-divider">
			<span class="elementor-divider-separator">
						</span>
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-45d4576 elementor-widget elementor-widget-text-editor" data-id="45d4576" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
								<p><strong><a href="/contact">Contact</a><br /><a href="/about">About Us</a><br /><a href="/careers">Careers</a><br /><a href="/media">Media</a><br /><a href="/media/news">News</a><br /></strong><strong><a href="/media/awards">Awards</a><br /><a href="/media/events">Events</a><br /><a href="/media/press">Press Releases</a><br /><a href="/privacy">Privacy</a></strong></p>						</div>
				</div>
					</div>
		</div>
							</div>
		</section>
				<div class="elementor-element elementor-element-57d1818 elementor-shape-rounded elementor-grid-0 e-grid-align-center elementor-widget elementor-widget-social-icons" data-id="57d1818" data-element_type="widget" data-widget_type="social-icons.default">
				<div class="elementor-widget-container">
					<div class="elementor-social-icons-wrapper elementor-grid">
							<div class="elementor-grid-item">
					<a class="elementor-icon elementor-social-icon elementor-social-icon-twitter elementor-repeater-item-c59119b" href="https://twitter.com/gitkraken" target="_blank">
						<span class="elementor-screen-only">Twitter</span>
						<i class="fab fa-twitter"></i>					</a>
				</div>
							<div class="elementor-grid-item">
					<a class="elementor-icon elementor-social-icon elementor-social-icon-slack elementor-repeater-item-60edbf6" href="https://slack.gitkraken.com/" target="_blank">
						<span class="elementor-screen-only">Slack</span>
						<i class="fab fa-slack"></i>					</a>
				</div>
							<div class="elementor-grid-item">
					<a class="elementor-icon elementor-social-icon elementor-social-icon-youtube elementor-repeater-item-9b26fe2" href="https://www.youtube.com/gitkraken" target="_blank">
						<span class="elementor-screen-only">Youtube</span>
						<i class="fab fa-youtube"></i>					</a>
				</div>
							<div class="elementor-grid-item">
					<a class="elementor-icon elementor-social-icon elementor-social-icon-linkedin elementor-repeater-item-10ecf56" href="https://www.linkedin.com/company/gitkraken" target="_blank">
						<span class="elementor-screen-only">Linkedin</span>
						<i class="fab fa-linkedin"></i>					</a>
				</div>
							<div class="elementor-grid-item">
					<a class="elementor-icon elementor-social-icon elementor-social-icon-facebook elementor-repeater-item-4f72abd" href="https://facebook.com/gitkraken" target="_blank">
						<span class="elementor-screen-only">Facebook</span>
						<i class="fab fa-facebook"></i>					</a>
				</div>
					</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-04245d2 elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="04245d2" data-element_type="widget" data-widget_type="divider.default">
				<div class="elementor-widget-container">
					<div class="elementor-divider">
			<span class="elementor-divider-separator">
						</span>
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-60ae5ff elementor-widget elementor-widget-text-editor" data-id="60ae5ff" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
								<p><strong>© 2022 Axosoft, LLC DBA GitKraken</strong></p>						</div>
				</div>
					</div>
		</div>
							</div>
		</section>
				</div>
		</div>
		
<script>window.addEventListener('DOMContentLoaded', function() {
	jQuery(function($) {
		var CURRENCY_SYMBOL_KEY = 'currencySymbol';
		
		function updateCurrencySymbols(symbol) {
			$('.currency-symbol').text(symbol);
			window.sessionStorage.setItem(CURRENCY_SYMBOL_KEY, symbol);
		}
		
		$(document).ready(function() {
			if ($('.currency-symbol').length === 0) {
				return;
			}
			
			var cachedSymbol = window.sessionStorage.getItem(CURRENCY_SYMBOL_KEY);
			
			if (cachedSymbol) {
				updateCurrencySymbols(cachedSymbol);
			} else {
				$.get('https://api.gitkraken.com/currency')
					.then(
						function(data) {
							updateCurrencySymbols(data.currency.symbol || '$');
						},
						function () {
							// Something went wrong, fallback to USD
							updateCurrencySymbols('$');
						}
					);
			}
		});

	

		function getQueryString() {
			var fullString = document.URL.split('#')[0].split('?')[1];
			if( fullString != undefined ) {
			var stringObj = {};
			if( fullString.indexOf('&') !== -1 ){
				var querySplit = fullString.split('&');
					for( var qspi = 0; qspi < querySplit.length; qspi++ ) {
						var subSplit = querySplit[qspi].split('=');
						stringObj[subSplit[0]] = subSplit[1];
					}
				} else {
					var subSplit = fullString.split('=');
					stringObj[subSplit[0]] = subSplit[1];
				}
					return stringObj;
				}
			return false;
		}

		function detectOS() {
			var clientStrings = [
				{s:'Windows32',r:[
					'Windows',
					'Win32'
				]},
				{s:'Windows64',r:[
					'WOW64',
					'Win64'
				]},
				{s:'MacOS', r:[
					'MacPPC',
					'MacIntel',
					'Mac_PowerPC',
					'Macintosh'
				]},
				{s:'Linux', r:[
					'X11',
					'Linux'
				]}
			];

			var userAgent = navigator.userAgent;

			var currentOS = 'none';
			for(var id in clientStrings) {
				var cs = clientStrings[id];
				for( var strId in cs.r ) {
					var currentString = cs.r[strId];
					if( userAgent.indexOf(currentString) != -1 ) {
						currentOS = cs.s;
						break;
					}
				}
			}

			var qs = getQueryString();
			if(qs.os) {
				return qs.os;
			}

			return currentOS;
		}

		var dlLink = '/download';
		var dlContainer = $('.dl-container');
		var dlContainerCli = $('.dl-container-cli');
		var mainBtn = $('.dl-container .button.all a');


		function doButtons(version){

			var currentOS = detectOS();
			var showDLsLink = false;
			var btnClass = 'all';
			var btnSub, faClass, href;
			if( currentOS ) {

				switch(currentOS){
					case 'Windows32':
						btnSub = 'GitKraken v8.4 - For (32-bit) Windows 8+';
						faClass = 'windows';
						href = '/download/windows';
						showDLsLink = true;
					break;

					case 'Windows64':
						btnSub = 'GitKraken v8.4 - For (64-bit) Windows 8+';
						faClass = 'windows';
						href = '/download/windows64';
						showDLsLink = true;
					break;

					case 'MacOS':
						btnSub = 'GitKraken v8.4 - For Mac OS 10.10+';
						faClass = 'apple';
						href = '/download/mac';
						showDLsLink = true;
					break;

					case 'Linux':
						btnSub = 'GitKraken v8.4 - For Ubuntu LTS 16.04+, Debian 9+';
						faClass = 'linux';
						showDLsLink = true;
					break;

					default:
						btnSub = 'GitKraken v8.4 - Windows / Mac / Linux';
						href = '/download';
				}

				$(dlContainerCli).prepend("<a class='button os button--basic'><span class='maintext'><span class='os-icon'></span>Download GitKraken Client Free</span></a><div class='secondary-cta'><a class='all-downloads' href='/download'>See All Platforms</a></div>");

				$(dlContainer).prepend("<a class='button os button--basic'><span class='maintext'><span class='os-icon'></span>Download GitKraken Client Free</span></a><div class='secondary-cta'><a class='all-downloads' href='/download'>Other Platforms</a></div>");

				// <a class="button os button--basic"><span class="maintext">Free Download</span><span class="button__subtext"></span></a><div class="secondary-cta"><a class="all-downloads" href="/download">Current version & all platforms</a></div>
				var mainBtn = $('.button.os');
				var mainBtnClasses = $(mainBtn).attr('class');

				if( currentOS == 'Linux' ){

					$(mainBtn).addClass('multi-trigger');
					$(mainBtn).attr('href', null);
					$(mainBtn).on('click', function(){
						revealLinuxPackages();
					});

				} else if ( currentOS == 'MacOS' ){

					$(mainBtn).addClass('multi-trigger');
					$(mainBtn).attr('href', null);
					$(mainBtn).on('click', function(){
						revealMacPackages();
					});

				} else {
					$(mainBtn).attr('href', href);
					$(mainBtn).addClass('direct-dl-link').attr('data-os', currentOS);
				}

				var mainBtnIcon = $('.button.os .os-icon');
				// var mainBtnMain = $('.button.os .maintext');
				// var oldMainContent = $(mainBtnMain).html();
				if(faClass == undefined) {
					$(mainBtnIcon).html('');
				} else {
					$(mainBtnIcon).html('<i class="fa mrs os fa-' + faClass + '"></i>' );
				}
				// $(mainBtnSub).html(btnSub);
			}


			if(showDLsLink === false) {
				$('.all-downloads').remove();
			} else {
				$(dlContainer).addClass('os-context');
			}

		}

		function revealLinuxPackages(callback) {
			var hrefDeb = '/download/linux-deb';
			var hrefGzip = '/download/linux-gzip';
			var hrefSnap = 'https://snapcraft.io/gitkraken';
			var hrefRpm = '/download/linux-rpm';
			var btn1 = document.createElement('a');
			var btn2 = document.createElement('a');
			var btn3 = document.createElement('a');
			var btn4 = document.createElement('a');
			$(btn1).attr('class', 'button--basic button multi direct-dl-link mls mrs mts button--linux');
			$(btn2).attr('class', 'button--basic button multi direct-dl-link mls mrs mts  button--linux');
			$(btn3).attr('class', 'button--basic button multi direct-dl-link mls mrs mts snap-download button--linux');
			$(btn4).attr('class', 'button--basic button multi direct-dl-link mls mrs mts  button--linux');
			$(btn1).attr('href', hrefDeb);
			$(btn2).attr('href', hrefGzip);
			$(btn3).attr('href', hrefSnap);
			$(btn3).attr('target', '_blank');
			$(btn4).attr('href', hrefRpm);
			$(btn1).attr('data-os', 'Linux Deb').html('<span class="maintext">Ubuntu 16.04+ LTS (.deb)</span>');
			$(btn2).attr('data-os', 'Linux .tar.gz').html('<span class="maintext">Ubuntu 16.04+ LTS (tar.gz)</span>');
			$(btn3).attr('data-os', 'Linux Snap').html('<span class="maintext">Snap Store</span>');
			$(btn4).attr('data-os', 'Linux RPM').html('<span class="maintext">RHEL 7+, CentOS 7+, Fedora 31+ (.rpm)</span>');
			$(dlContainer).prepend(btn3).prepend(btn4).prepend(btn2).prepend(btn1);
			$('.button.os').remove();
			if(callback) {
				callback();
			}


		}

		function revealMacPackages(callback) {
			var hrefIntel = '/download/mac';
			var hrefAppleSilicon = '/download/mac-apple-silicon';
			var btn1 = document.createElement('a');
			var btn2 = document.createElement('a');
			$(btn1).attr('class', 'button--basic button multi direct-dl-link mls mrs mts button--mac');
			$(btn2).attr('class', 'button--basic button multi direct-dl-link mls mrs mts  button--mac');
			$(btn1).attr('href', hrefIntel);
			$(btn2).attr('href', hrefAppleSilicon);
			$(btn1).attr('data-os', 'Mac Intel').html('<i class="fa mrs os fa-apple"></i><span class="maintext"> Mac (Intel)</span>');
			$(btn2).attr('data-os', 'Mac Apple Silicon').html('<i class="fa mrs os fa-apple"></i><span class="maintext"> Mac (Apple Silicon)</span>');
			$(dlContainer).prepend(btn2).prepend(btn1);
			$('.button.os').remove();
			if(callback) {
				callback();
			}


		}

		function getLatestVersion(callback) {
			var version = {
				date: 'Tuesday, April 12, 2022',
				name: '8.4.0'
			}
			if(callback){
				callback(version);
			}
		}

		getLatestVersion(doButtons);
	});
});</script><link rel='stylesheet' id='elementor-icons-fa-solid-css'  href='https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/plugins/elementor/assets/lib/font-awesome/css/solid.min.css?ver=5.15.1' type='text/css' media='all' />
<script type='text/javascript' id='1a8577bb0-js-extra'>
/* <![CDATA[ */
var localize = {"ajaxurl":"https:\/\/www.gitkraken.com\/wp-admin\/admin-ajax.php","nonce":"ef4096c1e3","i18n":{"added":"Added ","compare":"Compare","loading":"Loading..."},"page_permalink":"https:\/\/www.gitkraken.com\/learn\/git\/commands"};
/* ]]> */
</script>
<script type='text/javascript' src='https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/uploads/essential-addons-elementor/1a8577bb0.min.js?ver=1653876988' id='1a8577bb0-js' defer></script>
<script type='text/javascript' id='rocket-browser-checker-js-after'>
"use strict";var _createClass=function(){function defineProperties(target,props){for(var i=0;i<props.length;i++){var descriptor=props[i];descriptor.enumerable=descriptor.enumerable||!1,descriptor.configurable=!0,"value"in descriptor&&(descriptor.writable=!0),Object.defineProperty(target,descriptor.key,descriptor)}}return function(Constructor,protoProps,staticProps){return protoProps&&defineProperties(Constructor.prototype,protoProps),staticProps&&defineProperties(Constructor,staticProps),Constructor}}();function _classCallCheck(instance,Constructor){if(!(instance instanceof Constructor))throw new TypeError("Cannot call a class as a function")}var RocketBrowserCompatibilityChecker=function(){function RocketBrowserCompatibilityChecker(options){_classCallCheck(this,RocketBrowserCompatibilityChecker),this.passiveSupported=!1,this._checkPassiveOption(this),this.options=!!this.passiveSupported&&options}return _createClass(RocketBrowserCompatibilityChecker,[{key:"_checkPassiveOption",value:function(self){try{var options={get passive(){return!(self.passiveSupported=!0)}};window.addEventListener("test",null,options),window.removeEventListener("test",null,options)}catch(err){self.passiveSupported=!1}}},{key:"initRequestIdleCallback",value:function(){!1 in window&&(window.requestIdleCallback=function(cb){var start=Date.now();return setTimeout(function(){cb({didTimeout:!1,timeRemaining:function(){return Math.max(0,50-(Date.now()-start))}})},1)}),!1 in window&&(window.cancelIdleCallback=function(id){return clearTimeout(id)})}},{key:"isDataSaverModeOn",value:function(){return"connection"in navigator&&!0===navigator.connection.saveData}},{key:"supportsLinkPrefetch",value:function(){var elem=document.createElement("link");return elem.relList&&elem.relList.supports&&elem.relList.supports("prefetch")&&window.IntersectionObserver&&"isIntersecting"in IntersectionObserverEntry.prototype}},{key:"isSlowConnection",value:function(){return"connection"in navigator&&"effectiveType"in navigator.connection&&("2g"===navigator.connection.effectiveType||"slow-2g"===navigator.connection.effectiveType)}}]),RocketBrowserCompatibilityChecker}();
</script>
<script type='text/javascript' id='rocket-delay-js-js-after'>
(function() {
"use strict";var e=function(){function n(e,t){for(var r=0;r<t.length;r++){var n=t[r];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(e,n.key,n)}}return function(e,t,r){return t&&n(e.prototype,t),r&&n(e,r),e}}();function n(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}var t=function(){function r(e,t){n(this,r),this.attrName="data-rocketlazyloadscript",this.browser=t,this.options=this.browser.options,this.triggerEvents=e,this.userEventListener=this.triggerListener.bind(this)}return e(r,[{key:"init",value:function(){this._addEventListener(this)}},{key:"reset",value:function(){this._removeEventListener(this)}},{key:"_addEventListener",value:function(t){this.triggerEvents.forEach(function(e){return window.addEventListener(e,t.userEventListener,t.options)})}},{key:"_removeEventListener",value:function(t){this.triggerEvents.forEach(function(e){return window.removeEventListener(e,t.userEventListener,t.options)})}},{key:"_loadScriptSrc",value:function(){var r=this,e=document.querySelectorAll("script["+this.attrName+"]");0!==e.length&&Array.prototype.slice.call(e).forEach(function(e){var t=e.getAttribute(r.attrName);e.setAttribute("src",t),e.removeAttribute(r.attrName)}),this.reset()}},{key:"triggerListener",value:function(){this._loadScriptSrc(),this._removeEventListener(this)}}],[{key:"run",value:function(){RocketBrowserCompatibilityChecker&&new r(["keydown","mouseover","touchmove","touchstart","wheel"],new RocketBrowserCompatibilityChecker({passive:!0})).init()}}]),r}();t.run();
}());
</script>
<script type='text/javascript' id='rocket-preload-links-js-extra'>
/* <![CDATA[ */
var RocketPreloadLinksConfig = {"excludeUris":"\/pdfs\/gitkraken-vs-cli|\/cli-vs-kraken|\/(.+\/)?feed\/?.+\/?|\/(?:.+\/)?embed\/|\/(index\\.php\/)?wp\\-json(\/.*|$)|\/wp-admin|\/logout|\/get-crackin\/","usesTrailingSlash":"","imageExt":"jpg|jpeg|gif|png|tiff|bmp|webp|avif","fileExt":"jpg|jpeg|gif|png|tiff|bmp|webp|avif|php|pdf|html|htm","siteUrl":"https:\/\/www.gitkraken.com","onHoverDelay":"100","rateThrottle":"3"};
/* ]]> */
</script>
<script type='text/javascript' id='rocket-preload-links-js-after'>
(function() {
"use strict";var r="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(e){return typeof e}:function(e){return e&&"function"==typeof Symbol&&e.constructor===Symbol&&e!==Symbol.prototype?"symbol":typeof e},e=function(){function i(e,t){for(var n=0;n<t.length;n++){var i=t[n];i.enumerable=i.enumerable||!1,i.configurable=!0,"value"in i&&(i.writable=!0),Object.defineProperty(e,i.key,i)}}return function(e,t,n){return t&&i(e.prototype,t),n&&i(e,n),e}}();function i(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}var t=function(){function n(e,t){i(this,n),this.browser=e,this.config=t,this.options=this.browser.options,this.prefetched=new Set,this.eventTime=null,this.threshold=1111,this.numOnHover=0}return e(n,[{key:"init",value:function(){!this.browser.supportsLinkPrefetch()||this.browser.isDataSaverModeOn()||this.browser.isSlowConnection()||(this.regex={excludeUris:RegExp(this.config.excludeUris,"i"),images:RegExp(".("+this.config.imageExt+")$","i"),fileExt:RegExp(".("+this.config.fileExt+")$","i")},this._initListeners(this))}},{key:"_initListeners",value:function(e){-1<this.config.onHoverDelay&&document.addEventListener("mouseover",e.listener.bind(e),e.listenerOptions),document.addEventListener("mousedown",e.listener.bind(e),e.listenerOptions),document.addEventListener("touchstart",e.listener.bind(e),e.listenerOptions)}},{key:"listener",value:function(e){var t=e.target.closest("a"),n=this._prepareUrl(t);if(null!==n)switch(e.type){case"mousedown":case"touchstart":this._addPrefetchLink(n);break;case"mouseover":this._earlyPrefetch(t,n,"mouseout")}}},{key:"_earlyPrefetch",value:function(t,e,n){var i=this,r=setTimeout(function(){if(r=null,0===i.numOnHover)setTimeout(function(){return i.numOnHover=0},1e3);else if(i.numOnHover>i.config.rateThrottle)return;i.numOnHover++,i._addPrefetchLink(e)},this.config.onHoverDelay);t.addEventListener(n,function e(){t.removeEventListener(n,e,{passive:!0}),null!==r&&(clearTimeout(r),r=null)},{passive:!0})}},{key:"_addPrefetchLink",value:function(i){return this.prefetched.add(i.href),new Promise(function(e,t){var n=document.createElement("link");n.rel="prefetch",n.href=i.href,n.onload=e,n.onerror=t,document.head.appendChild(n)}).catch(function(){})}},{key:"_prepareUrl",value:function(e){if(null===e||"object"!==(void 0===e?"undefined":r(e))||!1 in e||-1===["http:","https:"].indexOf(e.protocol))return null;var t=e.href.substring(0,this.config.siteUrl.length),n=this._getPathname(e.href,t),i={original:e.href,protocol:e.protocol,origin:t,pathname:n,href:t+n};return this._isLinkOk(i)?i:null}},{key:"_getPathname",value:function(e,t){var n=t?e.substring(this.config.siteUrl.length):e;return n.startsWith("/")||(n="/"+n),this._shouldAddTrailingSlash(n)?n+"/":n}},{key:"_shouldAddTrailingSlash",value:function(e){return this.config.usesTrailingSlash&&!e.endsWith("/")&&!this.regex.fileExt.test(e)}},{key:"_isLinkOk",value:function(e){return null!==e&&"object"===(void 0===e?"undefined":r(e))&&(!this.prefetched.has(e.href)&&e.origin===this.config.siteUrl&&-1===e.href.indexOf("?")&&-1===e.href.indexOf("#")&&!this.regex.excludeUris.test(e.href)&&!this.regex.images.test(e.href))}}],[{key:"run",value:function(){"undefined"!=typeof RocketPreloadLinksConfig&&new n(new RocketBrowserCompatibilityChecker({capture:!0,passive:!0}),RocketPreloadLinksConfig).init()}}]),n}();t.run();
}());
</script>
<script type='text/javascript' src='https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/plugins/elementor-pro/assets/lib/smartmenus/jquery.smartmenus.min.js?ver=1.0.1' id='smartmenus-js' defer></script>
<script type='text/javascript' src='https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/plugins/elementor-pro/assets/js/webpack-pro.runtime.min.js?ver=3.2.2' id='elementor-pro-webpack-runtime-js' defer></script>
<script type='text/javascript' src='https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/plugins/elementor/assets/js/webpack.runtime.min.js?ver=3.2.4' id='elementor-webpack-runtime-js' defer></script>
<script type='text/javascript' src='https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/plugins/elementor/assets/js/frontend-modules.min.js?ver=3.2.4' id='elementor-frontend-modules-js' defer></script>
<script type='text/javascript' src='https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/plugins/elementor-pro/assets/lib/sticky/jquery.sticky.min.js?ver=3.2.2' id='elementor-sticky-js' defer></script>
<script type='text/javascript' id='elementor-pro-frontend-js-before'>
var ElementorProFrontendConfig = {"ajaxurl":"https:\/\/www.gitkraken.com\/wp-admin\/admin-ajax.php","nonce":"d5c44ebd7f","urls":{"assets":"https:\/\/www.gitkraken.com\/wp-content\/plugins\/elementor-pro\/assets\/"},"i18n":{"toc_no_headings_found":"No headings were found on this page."},"shareButtonsNetworks":{"facebook":{"title":"Facebook","has_counter":true},"twitter":{"title":"Twitter"},"google":{"title":"Google+","has_counter":true},"linkedin":{"title":"LinkedIn","has_counter":true},"pinterest":{"title":"Pinterest","has_counter":true},"reddit":{"title":"Reddit","has_counter":true},"vk":{"title":"VK","has_counter":true},"odnoklassniki":{"title":"OK","has_counter":true},"tumblr":{"title":"Tumblr"},"digg":{"title":"Digg"},"skype":{"title":"Skype"},"stumbleupon":{"title":"StumbleUpon","has_counter":true},"mix":{"title":"Mix"},"telegram":{"title":"Telegram"},"pocket":{"title":"Pocket","has_counter":true},"xing":{"title":"XING","has_counter":true},"whatsapp":{"title":"WhatsApp"},"email":{"title":"Email"},"print":{"title":"Print"}},"facebook_sdk":{"lang":"en_US","app_id":""},"lottie":{"defaultAnimationUrl":"https:\/\/www.gitkraken.com\/wp-content\/plugins\/elementor-pro\/modules\/lottie\/assets\/animations\/default.json"}};
</script>
<script type='text/javascript' src='https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/plugins/elementor-pro/assets/js/frontend.min.js?ver=3.2.2' id='elementor-pro-frontend-js' defer></script>
<script type='text/javascript' src='https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/plugins/elementor/assets/lib/waypoints/waypoints.min.js?ver=4.0.2' id='elementor-waypoints-js' defer></script>
<script type='text/javascript' src='https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-includes/js/jquery/ui/core.min.js?ver=1.13.1' id='jquery-ui-core-js' defer></script>
<script type='text/javascript' id='elementor-frontend-js-before'>
var elementorFrontendConfig = {"environmentMode":{"edit":false,"wpPreview":false,"isScriptDebug":false},"i18n":{"shareOnFacebook":"Share on Facebook","shareOnTwitter":"Share on Twitter","pinIt":"Pin it","download":"Download","downloadImage":"Download image","fullscreen":"Fullscreen","zoom":"Zoom","share":"Share","playVideo":"Play Video","previous":"Previous","next":"Next","close":"Close"},"is_rtl":false,"breakpoints":{"xs":0,"sm":480,"md":768,"lg":1025,"xl":1440,"xxl":1600},"responsive":{"breakpoints":{"mobile":{"label":"Mobile","value":767,"direction":"max","is_enabled":true},"mobile_extra":{"label":"Mobile Extra","value":880,"direction":"max","is_enabled":false},"tablet":{"label":"Tablet","value":1024,"direction":"max","is_enabled":true},"tablet_extra":{"label":"Tablet Extra","value":1365,"direction":"max","is_enabled":false},"laptop":{"label":"Laptop","value":1620,"direction":"max","is_enabled":false},"widescreen":{"label":"Widescreen","value":2400,"direction":"min","is_enabled":false}}},"version":"3.2.4","is_static":false,"experimentalFeatures":{"e_dom_optimization":true,"e_optimized_assets_loading":true,"a11y_improvements":true,"landing-pages":true},"urls":{"assets":"https:\/\/www.gitkraken.com\/wp-content\/plugins\/elementor\/assets\/"},"settings":{"page":[],"editorPreferences":[]},"kit":{"body_background_background":"classic","active_breakpoints":["viewport_mobile","viewport_tablet"],"global_image_lightbox":"yes","lightbox_enable_counter":"yes","lightbox_enable_fullscreen":"yes","lightbox_enable_zoom":"yes","lightbox_enable_share":"yes","lightbox_title_src":"title","lightbox_description_src":"description"},"post":{"id":1816,"title":"Git%20Commands%20Cheat%20Sheet%20%7C%20Learn%20Git","excerpt":"","featuredImage":"https:\/\/www.gitkraken.com\/wp-content\/uploads\/2021\/03\/og-git-commands-1024x537.png"}};
</script>
<script type='text/javascript' src='https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/plugins/elementor/assets/js/frontend.min.js?ver=3.2.4' id='elementor-frontend-js' defer></script>
<script type='text/javascript' src='https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/plugins/elementor-pro/assets/js/elements-handlers.min.js?ver=3.2.2' id='pro-elements-handlers-js' defer></script>
<script>window.lazyLoadOptions={elements_selector:"img[data-lazy-src],.rocket-lazyload",data_src:"lazy-src",data_srcset:"lazy-srcset",data_sizes:"lazy-sizes",class_loading:"lazyloading",class_loaded:"lazyloaded",threshold:300,callback_loaded:function(element){if(element.tagName==="IFRAME"&&element.dataset.rocketLazyload=="fitvidscompatible"){if(element.classList.contains("lazyloaded")){if(typeof window.jQuery!="undefined"){if(jQuery.fn.fitVids){jQuery(element).parent().fitVids()}}}}}};window.addEventListener('LazyLoad::Initialized',function(e){var lazyLoadInstance=e.detail.instance;if(window.MutationObserver){var observer=new MutationObserver(function(mutations){var image_count=0;var iframe_count=0;var rocketlazy_count=0;mutations.forEach(function(mutation){for(i=0;i<mutation.addedNodes.length;i++){if(typeof mutation.addedNodes[i].getElementsByTagName!=='function'){continue}
if(typeof mutation.addedNodes[i].getElementsByClassName!=='function'){continue}
images=mutation.addedNodes[i].getElementsByTagName('img');is_image=mutation.addedNodes[i].tagName=="IMG";iframes=mutation.addedNodes[i].getElementsByTagName('iframe');is_iframe=mutation.addedNodes[i].tagName=="IFRAME";rocket_lazy=mutation.addedNodes[i].getElementsByClassName('rocket-lazyload');image_count+=images.length;iframe_count+=iframes.length;rocketlazy_count+=rocket_lazy.length;if(is_image){image_count+=1}
if(is_iframe){iframe_count+=1}}});if(image_count>0||iframe_count>0||rocketlazy_count>0){lazyLoadInstance.update()}});var b=document.getElementsByTagName("body")[0];var config={childList:!0,subtree:!0};observer.observe(b,config)}},!1)</script><script data-no-minify="1" async src="https://1v5ymx3zt3y73fq5gy23rtnc-wpengine.netdna-ssl.com/wp-content/plugins/wp-rocket/assets/js/lazyload/16.1/lazyload.min.js"></script>
</body>
</html>

<!-- This website is like a Rocket, isn't it? Performance optimized by WP Rocket. Learn more: https://wp-rocket.me -->
