# Custom Travels RPG contributor instructions

Read README.md, docs/AGENT-QUICKSTART.md, docs/HEADLESS.md, and docs/AUTHORING.md before modifying mechanics or authoring adventures. Read docs/SECURITY.md for trust boundaries.

- Keep browser and headless mechanics in src/engine.js; do not duplicate rules in the UI or CLI.
- Preserve honest dice, transparent arithmetic, finite charges, ordinary alternatives, and full character portability.
- Keep mechanics bounded to the existing catalog and scope unless the owner requests expansion.
- Never include proprietary reference-game story/art or private character templates in generic releases.
- Do not change existing format/version meanings silently. Document compatibility and migration decisions.
- Run npm test and npm run build. Include regression tests for each fix and playtest changed branches.
- A passing validator is structural evidence, not proof of narrative fairness or complete branch coverage.
- Do not claim live browser or cross-platform tests ran unless they actually ran. CI configuration alone is not execution evidence.
- Do not publish or change licenses/account settings beyond the user’s authorized scope. Preserve the established GPL-3.0-only license and third-party notices.
