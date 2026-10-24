# Charged Strike balance sample

Seeded QA only. Identical refusal route, no spells, full healing, basic attack versus charge when target has 8+ HP and preparation is survivable. No player outcomes altered.

5000 simulations total: five builds × two policies × 500 seeds. Spells deliberately disabled to compare weapon tactics, not full-build optimal play. Charge only while target has at least 8 HP and its immediate response is survivable.

- Cleric, basic: 51.8% wins; surviving mean HP 2.17.
- Cleric, selective-charge: 52% wins; surviving mean HP 2.44.
- Fighter, basic: 92.2% wins; surviving mean HP 4.9.
- Fighter, selective-charge: 88.8% wins; surviving mean HP 5.11.
- Paladin, basic: 79% wins; surviving mean HP 3.44.
- Paladin, selective-charge: 76.4% wins; surviving mean HP 3.71.
- Rogue, basic: 52.6% wins; surviving mean HP 2.12.
- Rogue, selective-charge: 57.2% wins; surviving mean HP 2.26.
- Wizard, basic: 49% wins; surviving mean HP 2.13.
- Wizard, selective-charge: 50.8% wins; surviving mean HP 2.35.

The charge policy is not uniformly better: the Fighter and Paladin lose some consistency, while surviving runs retain slightly more health. These samples support a risk/reward tradeoff, not a universally dominant upgrade or a definitive balance guarantee. The paired policies consume random rolls differently, so individual same-seed runs do not represent identical future random events.

Opal’s actual play is not included as a public character fixture. Her historical run used no charged strikes.
