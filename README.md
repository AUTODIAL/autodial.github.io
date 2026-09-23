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

Most page content is stored in the Markdown files in the repository root. For
example, group-member information is in `group_members.md`, laboratory content
is in `sdls.md`, and homepage content is in `index.md`.

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

When adding a group member, add the original portrait, run
`make optimize-media`, and reference those two generated files from
`group_members.md`.

## Validation

Run the complete local check before committing:

```sh
make check
```

This command performs a clean Jekyll build, checks internal HTML links, and
validates the media referenced by the generated pages. It detects missing or
empty files, corrupted images, incorrectly sized portraits, non-H.264 videos,
differences between `assets/` and `_site/`, and accidental publication of
`_media_sources/`.

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
