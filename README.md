# AutoDIAL Website

This repository contains the Jekyll website for the Autonomous Discovery of
Alloys (AutoDIAL) research group.

## Requirements

- Ruby and Bundler
- ImageMagick (`convert` and `identify`)
- FFmpeg (`ffmpeg` and `ffprobe`)

On Debian or Ubuntu, install the system dependencies and Ruby gems with:

```sh
make install
```

## Local development

Build the site once:

```sh
make build
```

Serve it locally with automatic rebuilding:

```sh
make serve
```

Jekyll will print the local address, normally
<http://127.0.0.1:4000>. Stop the server with `Ctrl-C`.

Most page content is stored in the Markdown files in the repository root.
Laboratory content is in `sdls.md`, and homepage content is in `index.md`.
Group-member records are maintained in `_data/members.yml`; reusable templates
under `_includes/` generate their cards and biography dialogs.

## Updating media

Original, full-resolution media belongs under `_media_sources/`. Files used by
the current website are organized under:

```text
_media_sources/
├── images/
│   ├── branding/
│   ├── home/
│   ├── lab/
│   └── people/
├── videos/
└── archive/        # Historical media not currently published
```

After adding or replacing an active source file, generate the website-ready
versions with:

```sh
make optimize-media
```

The generated files are written to `assets/images/`. Commit both the source and
generated files. The optimizer validates all outputs and publishes them
atomically, so it is safe to run while `make serve` is active.

Portrait filenames must have unique stems. For example,
`_media_sources/images/people/Jane_Doe.jpg` produces:

```text
assets/images/people/Jane_Doe-300.webp
assets/images/people/Jane_Doe-600.webp
```

### Adding or updating a group member

Each person is represented once in `_data/members.yml`. Section and member
order in that file controls the rendered order. A member record contains a
stable lowercase `id`, their displayed `name`, modal `role`, portrait filename
stem in `photo`, HTML biography in `bio`, and optional profile `links` and
`card_title`.

To add a member:

1. Add the original portrait to `_media_sources/images/people/`.
2. Add the member record to the appropriate section in `_data/members.yml`.
3. Run `make optimize-media` to generate the 300px and 600px portraits.
4. Run `make check` and inspect the page with `make serve`.

To move someone to alumni, move their complete record to the `alumni` section
and update `role` or `card_title` as needed. The portrait and biography do not
need to be duplicated.

## Validation

Run the complete local check before committing:

```sh
make check
```

This command performs a clean Jekyll build, checks internal HTML links, and
validates the media referenced by the generated pages. It detects missing or
empty files, corrupted images, incorrectly sized portraits, non-H.264 videos,
differences between `assets/` and `_site/`, and accidental publication of
`_media_sources/`. It also validates member records, unique identifiers,
profile URLs, source portraits, rendered ordering, and the one-to-one mapping
between member cards and biography dialogs.

GitHub Actions runs the same checks for pushes and pull requests, followed by
the theme's Ruby, HTML, and package checks.

## Typical update workflow

1. Edit the appropriate Markdown file.
2. Put new original media in `_media_sources/`, if needed.
3. Run `make optimize-media` after changing media.
4. Run `make check`.
5. Run `make serve` and inspect the affected pages in a browser.
6. Commit the content, original media, and generated media together.

Run `make help` to see the available Makefile commands.
