# LiftWave 1.3.4 (26) — QA, 2026-09-09

## Corrections verified

- Clearing a weight or repetition field now saves zero instead of retaining an invisible previous value. Regression tests cover both fields and decimal input.
- Workout details preserve decimal weights (22.5 kg / 22,5 kg).
- Adding an exercise from its library detail starts a free workout or appends to the active session without resetting completed sets or elapsed time.
- Empty history no longer displays empty routine headings. Exercise/set counts use localized plurals, and muscle labels in details/history use the selected language.
- The iOS lockfile now matches purchases_flutter 9.16.1. A locked CocoaPods deployment install passed.
- Firestore's deployed rules denied every request. Published the existing owner-only firestore.rules and registered it in firebase.json. Live checks: own-account read 200; other-user and unauthenticated reads 403. No existing user documents were modified administratively.

## Manual simulator coverage

| Flow | iPhone 17 Pro, iOS 26.5 | Pixel 7, Android API 36.1 |
| --- | --- | --- |
| Launch, email sign-in, required-field validation | Passed | Passed |
| Training preferences onboarding | Passed | Passed |
| PRO entitlement shown in profile | Passed | Passed |
| Exercise library, combined muscle/equipment filters, instructions | Passed | Passed |
| Free workout, exercise selection, completed/incomplete sets | Passed | Passed |
| Decimal weight and clearing an existing weight | Passed | Passed |
| Rest timer pause and add 15 seconds | Passed | Passed |
| Force-close and recover active workout | Passed | Passed |
| Finish, persisted history, correct completed-set volume | Passed | Passed |
| Add from library to new/existing workout | Passed | Not separately completed on Android |
| Saved day routine, history editing, adaptive-plan load/cancel | Passed | Not separately completed on Android |
| Cloud history between platforms after rules correction | Android workout visible in iOS | iOS workout visible in Android |

Android numeric check: 10 repetitions at zero kg plus 10 at 22.5 kg produced 225 kg, preserved after restarting the app. Final iOS and Android builds were installed and launched with version 1.3.4 / build 26.

## Automated/build checks

- flutter analyze --no-pub: no issues.
- flutter test --no-pub: 52 tests passed.
- iOS arm64 simulator build: passed.
- Android signed release APK and AAB: passed using Gradle with JDK 17.
- git diff --check: passed.

## Limits

These are simulator checks, not physical-device certification. Real store purchases, Apple Watch interaction, progress photos/camera and every body-measurement flow were not verified. Subscription entitlement was checked using a dedicated review account. Cloud-build processing and App Store review status are tracked separately in App Store Connect.
