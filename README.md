# Ruby Toolbox Catalog

Welcome to [the Ruby Toolbox][rubytoolbox] catalog!

This repository contains the mapping of category groups, categories and ruby
open source projects and is based on a database dump of [the old Ruby Toolbox
site][issue-1].

## Contributing

**Help wanted!** Feel free to send pull requests against this repo to add or
moderate existing categories.

If you plan on bigger changes, please consider:

* splitting your changes into multiple separate PRs to avoid merge conflicts
* if your changes could need discussion, please create an
  [issue on the main repo][rubytoolbox] up-front for further discussion.

There will soon be a parser / CI integration to validate the repository contents
and build some JSON representation of the full catalog for static hosting, but this
is not in place yet.

## Structure

The folder structure is as follows:

```
catalog/
  CATEGORY_GROUP_1_PERMALINK/
    _meta.yml # Allows to add metadata about category group
    category_1_permalink.yml # Definition of category and it's projects
    ...
  ...
```

Each category group contains a `_meta.yml`, which currently only defines
the `name` key, which should be the human display name of that category.

Each `category.yml` currently contains:

* `name` (string, required): Human display name of the category name
* `description` (string, optional): A (markdown-formatted) category description
* `projects` (array of strings, required): The list of projects to list in
  that category. For rubygems, this is the plain gem name, for github repos it's
  the full repo slug (`github_user/repo_name`). Projects can be listed in multiple
  categories.

---

[rubytoolbox]: https://www.github.com/rubytoolbox/rubytoolbox
[issue-1]: https://www.github.com/rubytoolbox/rubytoolbox/issues/1

Trigger travis build...
