# Mr.Shadow v21 — Aurora X interaction edition

## Intent
A visual and interaction upgrade on the v20 source. Existing data keys and app feature logic were preserved. Added a searchable command palette, keyboard shortcut (Ctrl/Cmd+K), live command filtering, pointer-responsive local card lighting, animated aurora background, richer tactile controls, focus styling and page/modal transitions. Updated PWA theme/icon and service-worker cache to v21.

## Checks performed
- JavaScript syntax check with Node.js.
- Service worker syntax check with Node.js.
- Manifest JSON parse and required PWA fields check.
- CSS style-block presence and balanced brace check.
- Command palette action and keyboard shortcut presence checks.
- ZIP integrity test.

## Limits
This is a source-level audit; no claim of a full device/browser end-to-end test. Pointer spotlight is disabled for touch events and reduced-motion preferences disable ambient animations. No third-party libraries, external requests, or cloud services were added.

## Deploy
Back up JSON first. Replace index.html, manifest.webmanifest, sw.js and icon.svg in the existing GitHub Pages repository root.
