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
- **`grounded/`** - built from Grounded's standard default keybinds
  (movement/sprint/crouch/attack/aim-block as continuous, jump/interact/
  inventory/hotbar as pulses). Not confirmed against Grounded specifically -
  adjust to match if it differs.
- **`grounded2/`** - same base bindings as `grounded/`, for Grounded 2. Not
  confirmed against Grounded 2 specifically - adjust to match if it differs.
  Its `window_titles` is `"grounded 2"` (not just `"grounded"`) so it doesn't
  also match the original Grounded's window.
- **`waterpark_simulator/`** - built from typical first-person building/
  management sim controls (movement/sprint as continuous, jump/interact/
  place/rotate/build-menu/hotbar as pulses). Not confirmed against Waterpark
  Simulator specifically - adjust to match if it differs.
- **`cult_of_the_lamb/`** - confirmed default keybinds (movement, attack as
  continuous, dodge/curse/interact/inventory as pulses). No dedicated sprint
  - dodge (shift) is momentary, not sustained.
- **`stardew_valley/`** - confirmed default keybinds (movement/tool-use as
  continuous, secondary-action/menu/hotbar as pulses).
- **`powerwash_simulator/`** - confirmed default keybinds (movement/sprint/
  wash as continuous, jump/stance/interact/nozzle as pulses).
- **`powerwash_simulator_2/`** - confirmed default keybinds for the "Modern"
  control preset (wash is right-click here, vs. left-click in the first
  game); the game doesn't support rebinding, only preset switching. Its
  `window_titles` is `"powerwash simulator 2"` so it doesn't collide with
  `powerwash_simulator/`, though the reverse (the first game's profile
  matching this game's window) isn't ruled out - same caveat as
  grounded/grounded2.
- **`supermarket_simulator/`** - confirmed default keybinds (movement/sprint
  as continuous, jump/interact/open-box/rotate as pulses). Not rebindable.
- **`supermarket_together/`** - confirmed default keybinds, the co-op
  spinoff of Supermarket Simulator (movement/sprint as continuous,
  interact/place/open-box/deliveries as pulses). Not rebindable.
- **`megastore_simulator/`** - inferred from the Supermarket Simulator-style
  genre convention, not confirmed - no keybind documentation was found for
  this game specifically. Adjust to match if it differs.
- **`retro_rewind/`** - Retro Rewind: Video Store Simulator (a first-person
  video rental store sim - not the Mario Kart Wii mod of the same name).
  Inferred from the Supermarket Simulator-style genre convention, not
  confirmed - no keybind documentation was found for this game
  specifically. Adjust to match if it differs.
- **`spirit_valley/`** - inferred from its Stardew Valley-like genre, not
  confirmed - no keybind documentation was found for this game
  specifically. Adjust to match if it differs.
- **`tailbound/`** - confirmed via the official Steam manual (movement/run
  as continuous, action/cancel/map as pulses). No jump binding - the
  context-sensitive "action" key covers grapple/tail interactions.

## Adding a new profile

1. Copy an existing folder (`minecraft/` is the most complete example) and
   rename it to a short lowercase id for the new game.
2. Edit `keybinds.json`: set `name`, `window_titles` to match that game's
   window title, and adjust `bindings` to that game's controls.
3. Edit `ranges.json` to match every binding id you kept (including
   `background`).
4. Validate it loads correctly by pointing a TIGHC checkout's `profiles/` at
   this repo (or copying the folder in) and running `python cli.py` or
   `python gui.py` - a structurally invalid profile fails fast with a clear
   error at startup rather than crashing mid-session.

This can also be done interactively from TIGHC's GUI (Profiles tab ->
"New profile...", which starts from a copy of `minecraft/`).

## Versioning

Follows [Semantic Versioning](https://semver.org/) independently of the main
TIGHC engine's version - see [CHANGELOG.md](CHANGELOG.md).
