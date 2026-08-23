# TIGHC Profiles

Game profiles for [The Intiface Game Haptics Controller (TIGHC)](https://github.com/StuxieDev/TIGHC).
This repo is meant to be checked out as the `profiles/` git submodule of the
main TIGHC project, so profiles can be updated/shared independently of the
engine itself.

## Structure

Each top-level folder is one profile - one game - with two files:

```
<profile-id>/
  keybinds.json   # which keys/buttons do what, and how
  ranges.json     # intensity/duration bands for each binding
```

- **`keybinds.json`**: `name` (display name), `window_titles` (lowercase
  substrings matched against the focused window's title to auto-select this
  profile), `priority` (continuous-binding ids in first-match-wins order),
  and `bindings` - a list of `{id, keys, mode, enabled, devices}` objects.
  `mode` is `"continuous"` (sustained vibration while held) or `"pulse"`
  (one-shot buzz per press). `devices` is a list of channel nicknames from
  the main app's `devices.json`, or `["all"]`.
- **`ranges.json`**: keyed by the same binding `id`, holds `vibe` (a
  `[low, high]` 0.0-1.0 intensity band) and, for pulse bindings, `duration`
  (a `[low, high]` band in seconds). Always has a `background` entry too -
  the idle level used when nothing more specific is happening.

Full schema details and validation rules live in the main TIGHC repo's
README, since the engine (not this repo) is what parses and enforces them.

## Included profiles

- **`minecraft/`** - Minecraft's default keybinds (WASD movement, sprint,
  sneak, attack/use, jump, drop, offhand, inventory, hotbar).
- **`grounded2/`** - built from Grounded's standard default keybinds
  (movement/sprint/crouch/attack/aim-block as continuous, jump/interact/
  inventory/hotbar as pulses). Not confirmed against Grounded 2 specifically
  - adjust to match if it differs.
- **`waterpark_simulator/`** - built from typical first-person building/
  management sim controls (movement/sprint as continuous, jump/interact/
  place/rotate/build-menu/hotbar as pulses). Not confirmed against Waterpark
  Simulator specifically - adjust to match if it differs.

## Adding a new profile

1. Copy an existing folder (`minecraft/` is the most complete example) and
   rename it to a short lowercase id for the new game.
2. Edit `keybinds.json`: set `name`, `window_titles` to match that game's
   window title, and adjust `bindings` to that game's controls.
3. Edit `ranges.json` to match every binding id you kept (including
   `background`).
4. Validate it loads correctly by pointing a TIGHC checkout's `profiles/` at
   this repo (or copying the folder in) and running `python haptics.py` or
   `python gui.py` - a structurally invalid profile fails fast with a clear
   error at startup rather than crashing mid-session.

This can also be done interactively from TIGHC's GUI (Profiles tab ->
"New profile...", which starts from a copy of `minecraft/`).

## Versioning

Follows [Semantic Versioning](https://semver.org/) independently of the main
TIGHC engine's version - see [CHANGELOG.md](CHANGELOG.md).
