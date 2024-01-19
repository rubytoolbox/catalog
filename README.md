# Ruby Toolbox Catalog [![CI](https://github.com/rubytoolbox/catalog/actions/workflows/ci.yml/badge.svg)](https://github.com/rubytoolbox/catalog/actions/workflows/ci.yml)

Welcome to the [Ruby Toolbox][rubytoolbox] catalog!

This repository contains the mapping of category groups, categories and ruby
open source projects and is based on a database dump of [the old Ruby Toolbox
site][issue-1].

You can find the current exported catalog at https://rubytoolbox.github.io/catalog

## Catalog guidelines

* Our general policy about unmaintained libraries is to keep them in the catalog,
  even if a maintained fork exists. The rationale behind this is that even if a library
  may be unmaintained, it could still be functional or at least useful when researching
  options and maybe the original code can still provide some ideas for potential future maintainers
  or new approaches to the same problem.
* Categories should have at least 2 entries - if you cannot find an existing category
  for a library, that's fine, feel free to add one, but please find at least one other
  gem that tries to solve the same problem

## Contributing

**Help wanted!** Feel free to send pull requests against this repo to add or
moderate existing categories.

If you plan on bigger changes, please consider:

* splitting your changes into multiple separate PRs to avoid merge conflicts
* if your changes could need discussion, please create an
  [issue on the main repo][rubytoolbox] up-front for further discussion.

## Structure

You can find the catalog in [catalog](./catalog). The structure is validated at build time against the [JSON schema](./json-schema.yml).

The folder structure is as follows:

```
catalog/
  CATEGORY_GROUP_1_PERMALINK/
    _meta.yml # Allows to add metadata about category group
    category_1_permalink.yml # Definition of category and its projects
    ...
  ...
```

Each category group contains a `_meta.yml`, which currently only defines
the `name` key, which should be the human display name of that category.

Each `category.yml` currently contains:

* `name` (string, required): Human display name of the category name
* `description` (string, optional): A (markdown-formatted) category description
* `projects` (array of strings in case-insensitive alphabetical order, required): The list of projects to list in
  that category. For rubygems, this is the plain gem name, for github repos it's
  the full repo slug (`github_user/repo_name`). Projects can be listed in multiple
  categories.

---

[rubytoolbox]: https://www.github.com/rubytoolbox/rubytoolbox
[issue-1]: https://www.github.com/rubytoolbox/rubytoolbox/issues/1
