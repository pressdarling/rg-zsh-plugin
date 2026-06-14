# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an Oh My Zsh plugin that provides shell completions for ripgrep (`rg`), the fast file and text search tool. It's designed to integrate with Oh My Zsh's plugin system.

## Architecture

The plugin consists of a single file `rg.plugin.zsh` that:

1. Checks if `rg` command is available on the system
2. Sets up autoload for the `_rg` completion function if not already cached
3. Generates fresh completions asynchronously by calling `rg --generate complete-zsh`
4. Caches completions in `$ZSH_CACHE_DIR/completions/_rg`

The async generation (`&|`) ensures the plugin loads quickly without blocking the shell startup.

## Testing

To test changes:

1. Set ZSH_CACHE_DIR and create the completions directory: export ZSH_CACHE_DIR="${ZSH_CACHE_DIR:-$HOME/.cache/zsh}" && mkdir -p "$ZSH_CACHE_DIR/completions"
2. Reload your shell or source the plugin: source rg.plugin.zsh
3. Verify completions work: type rg - and press Tab
4. Check the cache was generated: ls $ZSH_CACHE_DIR/completions/_rg

## Key Considerations

- The plugin gracefully exits if `rg` is not installed (`(( ! ${+commands[rg]} ))`)
- Completions are regenerated on every shell startup to stay current with the installed `rg` version
- The cache file location is controlled by Oh My Zsh's `$ZSH_CACHE_DIR` variable
- Completions are generated directly from rg --generate complete-zsh (requires ripgrep v14.0.0 or newer) to ensure accuracy
