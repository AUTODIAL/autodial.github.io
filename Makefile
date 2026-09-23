APT_GET ?= sudo apt-get
BUNDLE ?= bundle
GEM ?= gem
RUBY_PACKAGES ?= ruby-full build-essential zlib1g-dev bundler
MEDIA_PACKAGES ?= imagemagick ffmpeg

.PHONY: install install-system install-gems optimize-media build check serve clean

# Show documentation and some recommended commands and instructions for using this Makefile.
help:
	@echo "Makefile for building and serving the Jekyll site."
	@echo ""
	@echo "Usage:"
	@echo "  make install          Install system dependencies and Ruby gems."
	@echo "  make optimize-media   Generate web-ready images and video."
	@echo "  make build            Build the Jekyll site."
	@echo "  make check            Build and validate the site and its media."
	@echo "  make serve            Serve the Jekyll site locally."
	@echo ""
	@echo "Environment Variables:"
	@echo "  APT_GET               Command to use for package installation (default: sudo apt-get)."
	@echo "  BUNDLE                Command to use for Bundler (default: bundle)."
	@echo "  GEM                   Command to use for RubyGems (default: gem)."
	@echo "  RUBY_PACKAGES         List of Ruby packages to install (default: ruby-full build-essential zlib1g-dev bundler)."
	@echo "  MEDIA_PACKAGES        Media tools to install (default: imagemagick ffmpeg)."

install: install-system install-gems

install-system:
	@if command -v apt-get >/dev/null 2>&1; then \
		$(APT_GET) update; \
		$(APT_GET) install -y $(RUBY_PACKAGES) $(MEDIA_PACKAGES); \
	else \
		echo "apt-get not found; install Ruby, Bundler, and build tools manually."; \
	fi

install-gems:
	@if ! command -v $(BUNDLE) >/dev/null 2>&1; then \
		$(GEM) install --user-install bundler; \
	fi
	$(BUNDLE) config set path vendor/bundle
	$(BUNDLE) install

optimize-media:
	./script/optimize-media

build:
	$(BUNDLE) exec jekyll build

check:
	./script/check-site

serve:
	$(BUNDLE) exec jekyll serve

clean:
	$(BUNDLE) exec jekyll clean
