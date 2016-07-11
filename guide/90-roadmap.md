---
title: Roadmap
---

# Our roadmap

The Electric Book Workflow is fundamentally a chain of existing, open tools that can be run locally. This makes it fast, modular, and means each tool has a development community improving it. 

Right now, only an advanced users can run the tools, because they are tricky to set up and understand. For instance, using a Git client and managing Rubies. 

For beginner and non-technical users, we want to run the entire toolchain on a webserver, managed from a simple web interface. Beginner and advanced users can then collaborate on the same projects, using any of the web or advanced (local) tools interchangeably.

| Action | Lay description | Technical description | Beginner UI | Advanced UI
|---
| Log in | Logs into online book host | Authorises user on Git remote (e.g. GitHub, GitLab) | Web | Any Git client
| Set up | Form for creating a series and/or adding books | Select repo, copy EBW series template to it, name/add book folders, populate `meta.yml` | Web | Any file manager and code editor
| Edit | Create and edit markdown files in book folder. Edit series metadata. | Edit `.md` files in book folders; edit `meta.yml` | Web[^1] | Any code editor
| Version control | Submit changes to online version control | Git branch/commit/PR | Web | Any Git client
| Review | Review and approve contributor submissions | Project admins can review and merge pull requests | Web | Supported Git hosts' web UI or any Git client 
| Design | Form to select theme, define design features, and add custom CSS | In Sass masters (`print`, `web`, `epub`), set variables, enable selected fonts, define path to theme partials, add custom CSS | Web | Any code editor
| Output PDF | Generate PDF | Run `jekyll build` with default config and send `print-list` HTML to Prince | Web | Jekyll and PrinceXML
| Output epub[^2] | Generate epub-ready HTML | Run `jekyll build` with epub config and assemble epub container | Web | Jekyll and Sigil
| Output website[^3] | Generate and open website files | Run `jekyll build` with optional extra configs, copy HTML to a given location, and open in browser | Web | Jekyll

* Footnotes
{:footnotes}

[^1]: Editing: In early versions, users can copy-paste to a local editor if they want to work offline, and paste back into the web UI to submit changes. Later, we aim to build an offline editor with syntax highlighting and Git built-in, so users can edit and commit offline.

[^2]: Epub output: In early versions, epub must be assembled offline in Sigil from epub-ready HTML. Later, we aim to assemble epubs automatically. For instance, in a Ruby gem for easy integration as a workflow dependency.

[^3]: Website output: where repos and branches are set up accordingly, a Git host may publish a website version automatically, e.g. GitHub Pages or GitLab Pages. In later versions, we may let users set this up with one click.

## Translating Git to lay terms

This table lists terms we'll use on the web interface for the Git commands we run in the background.

| Lay term | Git term | Description
|---
| Edit | Create branch | Opens a file for editing. In the background, name the branch for the user and date.
| Save | Commit | Prompt user to describe what they're saving (this is the commit message).
| Get latest version | Pull | Web editor should always load latest version. Offline editor should prompt on repo open to get latest version.
| Submit changes | Push and pull request | User must leave a description of their changes (PR message).
