# Contributing to Mihr UI

Thank you for your interest in contributing!

## Proposing a Change

If you intend to change the public API or make non-trivial changes to the
implementation, please file an issue first so we can discuss the approach before
significant effort is invested.

Bug-fix PRs can be submitted directly, but we still recommend filing an issue
to track the problem.

## Creating a Pull Request

Before opening a PR, please:

1. Fork the repository and create your branch from `main`.
2. Run `flutter pub get` to install dependencies.
3. Add tests for any new or changed code.
4. Ensure all tests pass: `flutter test`.
5. Update or add documentation for any public API changes.
6. Format your code: `dart format .`.
7. Analyze your code: `dart analyze --fatal-infos --fatal-warnings .`.
8. Update `CHANGELOG.md` under `[Unreleased]` following the existing format.
9. Squash your commits into a meaningful commit message.
10. Create the Pull Request and verify all CI checks pass.

## Code Coverage

Pull Requests must maintain or improve code coverage. The current minimum
threshold is **80%**. Run coverage locally:

```bash
flutter test --coverage
```

## Code Style

This project uses [very_good_analysis](https://pub.dev/packages/very_good_analysis)
for linting. All public APIs must have dartdoc comments.

## License

By contributing to Mihr UI, you agree that your contributions will be licensed
under its [MIT license](LICENSE).
