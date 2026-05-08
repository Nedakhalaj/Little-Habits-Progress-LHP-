
# Little Habits, Progress

A local-only iOS habit tracker built with SwiftUI and SwiftData.

## Features

- Add habits with a goal amount and unit (hours, minutes, or times)
- Mark a habit as done each day with one tap
- See a 7-day streak grid and a chart of completions per habit
- Built-in focus timer (Pomodoro-style) tied to any selected habit
- Local username / password login, with logout from Settings

## Tech stack

- iOS 26.2+
- SwiftUI
- SwiftData (local persistence)
- Swift Charts
- Observation (`@Observable`)

## Project structure

```
Little Habits, Progress/
├── App/          # App entry point
├── Models/       # SwiftData @Model types (HabitModel, UserModel)
├── ViewModels/   # @Observable view models (FocusTimeViewModel)
├── Views/        # All SwiftUI screens
└── Assets.xcassets/
```

## How to run

1. Clone the repo.
2. Open `Little Habits, Progress.xcodeproj` in Xcode 16 or later.
3. Pick an iOS 26.2+ simulator and press ⌘R.

No backend, no API keys — everything stays on the device.

## Known limitations

This is a learning project, so a few things are intentionally simple:

- Passwords are stored as plain text
- All accounts currently share the same habits (per-user separation is the next feature)
- No empty-state UI when there are zero habits

## Design

[Figma](https://www.figma.com/design/Dk7zH45WrgZJEVY5Uz67b2/Untitled?t=tSFY2e71297wzv1q-1)
