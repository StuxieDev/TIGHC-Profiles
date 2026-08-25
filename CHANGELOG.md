# Changelog

All notable changes to this project are documented here. Versioning follows
[Semantic Versioning](https://semver.org/) (`MAJOR.MINOR.PATCH`), independent
of the main [TIGHC](https://github.com/StuxieDev/TIGHC) engine's own version.

## [1.1.2]

### Fixed
- `assets/icon.png`, `icon.ico`, and `logo.png` had an opaque dark
  (`#1E1E1E`) rounded-rect fill baked in instead of a transparent
  background. Replaced with transparent versions (copied from the main
  TIGHC repo after fixing them there via a color-to-alpha un-blend).

## [1.1.1]

### Added
- Logo banner and an `assets/` folder (`icon.png`/`icon.ico`/`logo.png`,
  copied from the main TIGHC repo) at the top of README.md, for visual
  consistency with the main repo and the website.
- Author credit section in README.md (StuxieDev, with a GitHub avatar at
  `assets/author.png`), matching the same addition in the main TIGHC repo
  and TIGHC-Website.

## [1.1.0]

### Added
- `cult_of_the_lamb/`, `stardew_valley/`, `powerwash_simulator/`,
  `powerwash_simulator_2/`, `supermarket_simulator/`,
  `supermarket_together/`, `megastore_simulator/`, `retro_rewind/`,
  `spirit_valley/`, and `tailbound/` profiles, covering the gameplay-driven
  titles in the local Steam library that weren't already covered.
  Confidence varies by title - see README.md's "Included profiles" section
  for which are confirmed vs. inferred/community-sourced. (`retro_rewind/`
  is Retro Rewind: Video Store Simulator, not the Mario Kart Wii mod
  initially assumed.)

## [1.0.2]

### Added
- `grounded/` profile - built from Grounded's standard default keybinds
  (movement, sprint, crouch, attack, aim/block, jump, interact, inventory,
  hotbar switching). Not confirmed against Grounded specifically.

### Changed
- `grounded2/` profile's `window_titles` narrowed to `"grounded 2"` (was
  `"grounded"`) so it no longer also matches the original Grounded's window
  now that both profiles exist.

## [1.0.1]

### Added
- `waterpark_simulator/` profile - built from typical first-person
  building/management sim controls (movement, sprint, jump, interact,
  place, rotate, build menu, hotbar switching). Not confirmed against
  Waterpark Simulator specifically.

## [1.0.0]

Initial release, split out from the main TIGHC repo into its own submodule.

### Added
- `minecraft/` profile - Minecraft's default keybinds (WASD movement,
  sprint, sneak, attack/use, jump, pick block, drop, offhand, inventory,
  hotbar switching).
- `grounded2/` profile - built from Grounded's standard default keybinds
  (movement, sprint, crouch, attack, aim/block, jump, interact, inventory,
  hotbar switching).
