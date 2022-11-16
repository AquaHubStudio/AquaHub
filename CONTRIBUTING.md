# Contributing

We ❤️ contributions to AquaHub to help make it better!
All contributions are welcome, including updates, issues, documentation and blog posts as well.

- [🛠️ Setup Development Environment](#setup-development-environment)
- [⚙️ Configure Backend](#configure-backend)
- [📥 Pull Request Policy](#📥-pull-request-policy)
- [📂 File Structure](#file-structure)
- [✅ Tests](#tests)
- [💪 Other Ways to Help](#other-ways-to-help)

## 📥 Pull Request Policy

Branch naming convention is as follows

`TYPE/ISSUE_ID-DESCRIPTION`

Example:

```
feature/12-create-user-page
```

`TYPE` can be:

- **feature** - is a new feature
- **docs** - documentation only changes
- **bug** - a bug fix
- **refactor** - code change that neither fixes a bug nor adds a feature

**All PRs must include a commit message with the description of the changes made!**

For the initial start, fork the project and use git clone command to download the repository to your computer. A standard procedure for working on an issue would be to:

1. `git pull`, before creating a new branch, pull the changes from upstream. Your master needs to be up to date.

```
$ git pull
```

2. Create new branch from `master` like: `feature/12-create-user-page`<br/>

```
$ git checkout -b [name_of_your_new_branch]
```

3. Work - commit - repeat ( be sure to be in your branch )

4. Format your code via this command in your root directory

```bash
yarn run format
```

5. Now, in addition, run the linter and get a list of found errors or warnings. Fix all errors and as many warnings as you can.

```bash
yarn run lint
```

6. Push changes to GitHub

```
$ git push origin [name_of_your_new_branch]
```

7. Submit your changes for review
   If you go to your repository on GitHub, you'll see a `Compare & pull request` button. Click on that button.
8. Start a Pull Request
   Now submit the pull request and click on `Create pull request`.
9. Get a `code review approval/reject` and after everything's fine merge the branch
10. _GitHub will automatically delete the branch after the merge is done. (they can still be restored)._

## 📂 File Structure

```bash
.
├── .devcontainer # Docker files and devcontainer config
├── src # Source folder
│   ├── lib
│       ├── components # UI components (also in ../routes if only on one page needed)
│       ├── guards # Guards to protect from accessing different pages
│       ├── helpers # Functions for additional functionality
│   ├── routes # Svelte routes
├── static # Statically served files
│   ├── assets # Necessary assets
├── tests # UI tests
```

## ✅ Tests

_Coming soon_

## 💪 Other Ways to Help

### Sending Feedbacks & Reporting Bugs

If you had any issues, bugs, or want to share about your experience, feel free to do so on our GitHub issues page or at our [Discord](https://discord.gg/GjJNf7zhgy).

### Submitting New Ideas

If you think AquaHub could use a new feature, please open an issue on our GitHub repository, stating as much information as you can think about your new idea and it's implications. We would also use this issue to gather more information, get more feedback from the community, and have a proper discussion about the new feature.

### Improving Documentation

Submitting documentation updates, enhancements, designs, or bug fixes. Spelling or grammar fixes will be very much appreciated.
