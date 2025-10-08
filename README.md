# Bookly App

A Flutter application for browsing and searching books, powered by the Google Books API.

## Features
- Splash screen with animated logo
- Home screen with featured and newest books
- Book details view with similar books suggestions
- Search functionality for books
- Uses BLoC for state management
- Modern UI with Google Fonts
- Caching and image loading optimizations

## Tech Stack
- **Flutter** (Dart)
- **State Management:** flutter_bloc
- **Dependency Injection:** get_it
- **Networking:** dio
- **Routing:** go_router
- **Image Caching:** cached_network_image
- **External API:** Google Books API

## Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart SDK (comes with Flutter)

### Installation
1. **Clone the repository:**
   ```bash
   git clone <repo-url>
   cd Bookly\ App
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the app:**
   ```bash
   flutter run
   ```

## Directory Structure
- `lib/`
  - `core/` – Utilities, errors, service locator, API service
  - `features/`
    - `home/` – Home, book details, featured/newest books
    - `search/` – Search UI and logic
    - `splash/` – Splash screen
  - `main.dart` – App entry point

## Configuration
- **Assets:** Images are located in `assets/images/` and configured in `pubspec.yaml`.
- **Lints:** Uses `flutter_lints` for code quality.

## Contribution
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

---
