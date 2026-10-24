# 0.2.1 open-source alpha

- Delayed Charged Strike is supplied by the core engine for eligible weapon combats, including untouched imported adventures. No new character ability or author-written preparation choice is required.
- Preparation has no attack roll and deals no damage; it receives the existing weapon action's enemy response. Next same-enemy weapon attack gains +4 fixed bonus damage on a hit. Miss consumes it. Cannot stack. Leaving the scene, enemy victory or player defeat clears it.
- Persistent ready status, transparent journal math and an automatically available browser/CLI choice. UI does not show a d20 animation for preparation.
- Old adventure IDs, versions, characters and saves remain compatible. Existing adventures were not rewritten. The engine adds the core action at runtime without mutating the manifest or compiled Ink.
- Adventure-authoring skill now requires at least two meaningfully different non-magical approaches to every problem, including optional obstacles. Retreat alone and renamed identical choices do not count. This is future-authoring guidance, not a claim that every existing scene now meets it.
- This update preserves prior published history and does not include private player character sheets or cartoon production assets.

Known limits: no new live-browser/file:// or cross-platform CI execution is claimed for this patch. Simulated DOM, headless runtime, renderer and distribution tests are distinct surfaces. Balance tests use declared policies and seeds, not rigged normal gameplay.
