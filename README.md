# Pokedex

A Flutter application to browse and manage your Pokemon collection.

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Xcode for iOS development
- Android Studio for Android development

### Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/pokedex.git
cd pokedex
```

2. Install dependencies:

```bash
flutter pub get
```

3. Generate Realm models:

```bash
dart run build_runner build
```

### Key Features

- Browse Pokemon catalog
- Save favorite Pokemon
- Reorder your Pokedex
- View Pokemon details and abilities

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Building the App

```bash
# Build for iOS
flutter build ios

# Build for Android
flutter build apk
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
