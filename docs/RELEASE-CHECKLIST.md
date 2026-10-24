# Open-source release gate

## Completed in this private 0.1.1 pass

- Shared deterministic-testable headless/browser rules core.
- Machine-readable CLI discovery, catalog, validation, views and errors.
- New-save overwrite protection and failed-choice save preservation.
- Detailed setup, process contract, API, authoring, player, safety and contributor documentation.
- Runnable no-install example agent and fresh-distribution tests.
- Mixed-choice campaign coverage, rule boundaries, character combinations, malformed inputs, save roundtrips and DOM flow.
- Clean dependency installation and full suite on the available Linux / Node 24.19 environment.
- CI workflow supplied for Linux, Windows and macOS with Node 24. This workflow has NOT run on a hosted repository.

## Required before calling this a polished public release

- Owner chooses an original-code license and authorizes public repository creation/publishing.
- Confirm redistribution/licensing of generic Studio source/assets and preserve Ink/SRD notices. No license grants are invented by this checklist.
- Run the CI matrix on the actual repository. Node 20.20.2 player-runtime tests have passed locally; CI still needs to verify its advertised platform combinations.
- Real-browser offline file:// checks in supported browsers, including imports/downloads, reduced motion, mobile layout and character rendering.
- Review malicious/adversarial compiled Ink handling and CPU/memory limits before offering untrusted-story execution as an agent service. Current validation does not make arbitrary packages safe.
- Independent user/agent playtesting of setup clarity, narrative fairness, balance and replayability. Large automated test counts do not answer those questions.
- Define supported-platform/version policy, issue template, maintenance/security contact and release procedure.

## Test interpretation

The 3,000 seeded runs explore the small bundled demo, not all possible adventures. All demo scenes/actions were visited, but this is not exhaustive branch-state coverage or a formal proof. Arithmetic cases test engine check resolution, not every SRD rule. The system is deliberately limited. No test suite can justify a promise of no bugs.
