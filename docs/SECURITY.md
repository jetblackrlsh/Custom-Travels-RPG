# Security and trust boundaries

This is a open-source alpha, not a security-audited product. Local save editing is intentionally possible; it is not competitive anti-cheat software.

Use adventure packages from trusted authors. Structural validation checks the manifest, references, damage formulas, and basic coverage, but does not prove that arbitrary compiled Ink matches the manifest, terminates, or cannot consume excessive CPU/memory. Do not execute untrusted packages in a privileged agent process. Review manifests, compile them yourself, and use OS-level isolation/resource limits for genuinely untrusted content. Never relax host security controls to run a story.

The CLI caps input files at 5 MiB. Normal game randomness uses system cryptographic randomness. Inputs are not shell-evaluated. Display text is treated as text by the UI, but that is not a full third-party audit of the vendored renderer and Ink runtime.

Save validation rejects malformed HP, charges, appearance, flags, enemies, and action lists. It cannot establish that a user has not tampered with an otherwise structurally valid save. Do not use saves as proof of score or fair play.

Use one writer per save. Temporary-file replacement protects against many partial writes but is not crash-durable transactional storage, file locking, or optimistic concurrency control. Keep backups before migrations. Never put credentials or sensitive personal data in an adventure, test fixture, or issue report.

Before relying on a release: review its test report, run cross-platform CI and real-browser offline tests for your environment, review dependencies, and arrange independent review appropriate to your use. Report vulnerabilities privately to the repository owner through a private reporting route when the repository provides one. Do not put exploit details or private data in public issues.
