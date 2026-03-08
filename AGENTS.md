# Repository Guidelines

## Project Structure & Module Organization
This repository is a Flutter application.
- `lib/`: app source code. Current structure uses feature folders such as `lib/modules/splash/` and `lib/modules/home/`, plus shared utilities in `lib/core/`.
- `test/`: Dart/Flutter tests (currently `test/widget_test.dart`). Add new tests here, mirroring `lib/` paths when possible.
- `assets/`: static assets declared in `pubspec.yaml` (`assets/images/`, `assets/logo/`).
- Platform runners: `android/`, `ios/`, `web/`, `linux/`, `macos/`, `windows/`.

## Build, Test, and Development Commands
Run commands from the repository root.
- `flutter pub get`: install dependencies.
- `flutter run`: run locally on the connected device/emulator.
- `flutter analyze`: run static analysis using `analysis_options.yaml`.
- `flutter test`: run all tests in `test/`.
- `flutter build apk` or `flutter build ios`: create production builds for a target platform.

## Coding Style & Naming Conventions
- Follow Flutter/Dart style with 2-space indentation and null-safety.
- File names: `snake_case.dart` (for example, `splash_page.dart`).
- Types/classes: `PascalCase`; methods/variables: `lowerCamelCase`; constants: prefer `static const` with clear names.
- Keep widgets focused and modular: feature UI in `lib/modules/<feature>/`, shared helpers in `lib/core/`.
- Use `dart format .` before opening a PR.

## Testing Guidelines
- Framework: `flutter_test`.
- Test files should end with `_test.dart` and describe behavior clearly (example: `home_page_test.dart`).
- Prefer widget tests for screens and unit tests for utilities.
- Run `flutter test` and `flutter analyze` before committing.

## Commit & Pull Request Guidelines
Current history only includes an initial commit, so adopt a clear convention going forward.
- Commit format: imperative, scoped subject (example: `feat(splash): add logo preload`).
- Keep commits small and focused; avoid mixing refactors with features.
- PRs should include: summary, changed paths, test evidence (`flutter test`/`flutter analyze` output), and screenshots/GIFs for UI updates.
- Link related issue IDs when available.

## Configuration & Assets
- When adding assets, place files under `assets/` and register them in `pubspec.yaml` before use.
- Do not commit secrets or environment-specific credentials.
