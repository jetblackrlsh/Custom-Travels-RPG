# Difficulty study — October 24, 2026

5,400 seeded trials: nine legal builds, two routes, two fixed policies, 150 trials per combination. Test seeds are deterministic QA only; normal gameplay retains system randomness. All routes rescue the first villager, accept bounded first aid and take the mountain stair. Shortcut-heavy strategies, perfect optimization and human enjoyment were not measured.

| Build | Route | Policy | Win rate | Mean winning HP / max | Mean charges spent |
|---|---|---|---:|---:|---:|
| Cleric | Oppose queen | tactical | 92% | 4.32 / 8 | 4.47 |
| Cleric | Oppose queen | weapon-only | 53.3% | 2.21 / 8 | 0 |
| Cleric | Join queen | tactical | 100% | 5.91 / 8 | 5.77 |
| Cleric | Join queen | weapon-only | 12.7% | 1 / 8 | 0 |
| Fighter | Oppose queen | tactical | 91.3% | 5.11 / 12 | 0 |
| Fighter | Oppose queen | weapon-only | 91.3% | 5.11 / 12 | 0 |
| Fighter | Join queen | tactical | 83.3% | 6.1 / 12 | 2 |
| Fighter | Join queen | weapon-only | 67.3% | 3.84 / 12 | 0 |
| Paladin | Oppose queen | tactical | 87.3% | 4.09 / 10 | 1 |
| Paladin | Oppose queen | weapon-only | 82.7% | 3.46 / 10 | 0 |
| Paladin | Join queen | tactical | 99.3% | 7.87 / 10 | 5 |
| Paladin | Join queen | weapon-only | 44% | 2.21 / 10 | 0 |
| Rogue | Oppose queen | tactical | 59.3% | 2.13 / 8 | 0 |
| Rogue | Oppose queen | weapon-only | 59.3% | 2.13 / 8 | 0 |
| Rogue | Join queen | tactical | 47.3% | 3.8 / 8 | 2 |
| Rogue | Join queen | weapon-only | 25.3% | 1 / 8 | 0 |
| Wizard | Oppose queen | tactical | 78% | 4.03 / 8 | 4.29 |
| Wizard | Oppose queen | weapon-only | 52.7% | 2.06 / 8 | 0 |
| Wizard | Join queen | tactical | 68.7% | 4.73 / 8 | 6.19 |
| Wizard | Join queen | weapon-only | 14% | 1 / 8 | 0 |
| Custom sturdy | Oppose queen | tactical | 92% | 6.55 / 12 | 2 |
| Custom sturdy | Oppose queen | weapon-only | 85.3% | 5 / 12 | 0 |
| Custom sturdy | Join queen | tactical | 86.7% | 7.15 / 12 | 4 |
| Custom sturdy | Join queen | weapon-only | 58.7% | 3.42 / 12 | 0 |
| Custom balanced | Oppose queen | tactical | 76.7% | 4.34 / 10 | 3 |
| Custom balanced | Oppose queen | weapon-only | 67.3% | 3.36 / 10 | 0 |
| Custom balanced | Join queen | tactical | 76.7% | 5.93 / 10 | 5 |
| Custom balanced | Join queen | weapon-only | 38% | 2.11 / 10 | 0 |
| Custom mystic | Oppose queen | tactical | 65.3% | 4.69 / 8 | 5 |
| Custom mystic | Oppose queen | weapon-only | 29.3% | 1.8 / 8 | 0 |
| Custom mystic | Join queen | tactical | 92% | 5.58 / 8 | 7 |
| Custom mystic | Join queen | weapon-only | 8.7% | 1 / 8 | 0 |
| Custom specialist | Oppose queen | tactical | 60% | 2.17 / 8 | 0 |
| Custom specialist | Oppose queen | weapon-only | 60% | 2.17 / 8 | 0 |
| Custom specialist | Join queen | tactical | 47.3% | 3.8 / 8 | 2 |
| Custom specialist | Join queen | weapon-only | 24% | 1 / 8 | 0 |

## Interpretation
The oppose-queen route now yields roughly half-health wins for several representative builds: Wizard 4.03/8, Cleric 4.32/8, Fighter 5.11/12 and balanced custom 4.34/10 under the tested tactical policy. Their victory rates differ, and weak offensive noncasters struggle more. The ally route is explicitly dangerous without magical protection and favors protective kits. Some well-equipped builds still win comfortably; the game does not force injuries to make every result match a target.

The queen’s repeated counterattacks were increased from 1 to 2 fixed damage, and Sleep no longer bypasses her entire battle. It provides one bounded opening instead. These are disclosed authored rules, not hidden roll changes.

Weapon-only means voluntary refusal of all spells, including the queen’s offered gift. It is a stress test, not a recommendation. All premades have at least one tested no-spell victory on both routes, but low win rates on that harder self-imposed policy remain visible above.

Sampling uncertainty and policy quality matter. These results are not human playtests or a claim of optimal balance. An earlier human half-health playtest informed the target feel; it was not used to rig outcomes.
