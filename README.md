# Gas Mask Belt Attach

A Project Zomboid Build 42 mod that lets `Base.Hat_GasMask` attach to belt and webbing hotbar slots, then be worn from the hotbar instead of only being drawn into a hand.

## Workshop

Preferred download and install link:

[Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3759537586)

## Features

- Adds gas mask attachment support to the hotbar.
- Supports left belt and right belt slot mapping.
- Supports webbing slot mapping.
- Uses wearable behavior from the hotbar instead of standard hand-equip behavior.
- Includes attached-location and model-anchor setup for visible belt/webbing placement work.
- Supports the Half Mask Respirator (`Base.Hat_BuildersRespirator`).

## Current status

Working now:

- Gas mask can attach to supported hotbar slots.
- Hotbar key can trigger the gas mask wear logic.
- Belt left, belt right, and webbing location mappings are set up in Lua.
- Half Mask Respirator support is included.

Still being refined:

- Attached world/model visibility may need offset or model-display tuning depending on the gas mask asset.
- Visual placement may need further adjustment for male/female body models.

## Target item

- `Base.Hat_GasMask`
- `Base.Hat_BuildersRespirator`

## Mod structure

```text
media/
├─ lua/
│  ├─ shared/
│  │  └─ gasmasklocations.lua
│  └─ client/
│     ├─ gasmask_adjust.lua
│     └─ Hotbar/
│        ├─ gashotbarattachdef.lua
│        └─ gasmask_hotbar_wear.lua
└─ scripts/
   └─ gasmask_attachments.txt
```

## How it works

### 1. Attached locations

`gasmasklocations.lua` extends `AttachedLocations.getGroup("Human")` with gas mask locations for belt and webbing.

### 2. Item adjustment

`gasmask_adjust.lua` assigns the correct `AttachmentType` to `Base.Hat_GasMask` so the item is recognized by the hotbar attachment system.

### 3. Hotbar slot patching

`gashotbarattachdef.lua` patches `ISHotbarAttachDefinition` so the gas mask is accepted by the desired belt and webbing slot types.

### 4. Body model anchors

`gasmask_attachments.txt` defines anchor names like:

- `gasmask_left`
- `gasmask_right`
- `webbing_left_gasmask`
- `webbing_right_gasmask`

These names must match the strings used in `setAttachmentName(...)` exactly.

### 5. Hotbar wear behavior

`gasmask_hotbar_wear.lua` adjusts the hotbar action so pressing the assigned hotbar key wears the gas mask instead of only equipping it into a hand.

## Installation

1. Subscribe through the Steam Workshop link above.
2. Enable the mod from the in-game mods menu.
3. Load into Build 42.
4. Attach a gas mask to a supported belt or webbing slot.
5. Press the assigned hotbar key to wear it.

## Notes

- This mod is designed for Project Zomboid Build 42.
- If another mod also overwrites hotbar behavior or attached-location definitions, load-order or compatibility fixes may be needed.

## Credits

- Inspired by flashlight belt/webbing attachment patterns from an existing attachment mod that was removed from Steam.
- BirdTruther
