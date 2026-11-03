# KNOWME NOT — iOS starter project

This is a SwiftUI starter, not a signed IPA.

## Included
- Black/red SwiftUI interface
- Your supplied angel image as the header background
- License-key entry screen
- Locked dashboard until activation is implemented
- Dashboard cards for game settings and device/network monitoring
- Telegram channel button opening https://t.me/knowme_sllv

## Important next steps
1. Create a new iOS App project in Xcode named `KNOWME_NOT` (SwiftUI, iOS 16+).
2. Replace the generated app entry and ContentView with the supplied Swift file, and add the `AngelBackground.imageset` folder to Assets.xcassets.
3. Implement a secure HTTPS license-validation API. The current activation handler is deliberately a placeholder and does not validate keys or unlock the dashboard.
4. Build and sign with your own Apple Developer provisioning profile on a Mac to produce an installable IPA.

The utility cards are interface placeholders; iOS cannot change PUBG's internal settings or guarantee FPS boosts from another app.
