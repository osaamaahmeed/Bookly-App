# Bookly App 📚✨

A beautiful book discovery app built with **Flutter**.  
This project was developed to practice advanced Flutter patterns, state management, and API integration. 🚀

[![Flutter](https://img.shields.io/badge/Flutter-3.9.0-blue)](https://flutter.dev)  
[![Dart](https://img.shields.io/badge/Dart-3.9.0-blue)](https://dart.dev)  

---

## Features ✨
- **Book Discovery** 🔍:  
  - Browse featured and newest books.
  - Book details with similar book suggestions.
- **Search** 📝:  
  - Search for books by title or topic.
- **Modern UI** 🎨:  
  - Google Fonts, custom widgets, and smooth navigation.
- **State Management** 🧩:  
  - BLoC pattern for scalable state handling.
- **API Integration** 🌐:  
  - Uses Google Books API for real data.
- **Image Caching** 🖼️:  
  - Fast, efficient image loading and caching.

---

## Screenshots 📸

<div align="center">

| 🏠 Home | 📖 Book Details |
|:---:|:---:|
| <img src="assets/screenshots/bookly view 1.jpg" width=250> | <img src="assets/screenshots/bookly view 2.jpg" width=250> |

**More screenshots coming soon!**

</div>

---

## Installation ⚙️
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

---

## Project Structure 📂
```bash
lib/
├── constants.dart
├── core/            # Utilities, errors, service locator, API service
├── features/
│   ├── home/        # Home, book details, featured/newest books
│   ├── search/      # Search UI and logic
│   └── splash/      # Splash screen
└── main.dart        # App entry point
assets/
└── images/          # App images
└── screenshots/     # App screenshots
```

---

## Key Learnings 🧠
- Integrated a public API (Google Books) for real-world data.
- Used BLoC and dependency injection for scalable architecture.
- Built a modern, responsive UI with custom widgets and Google Fonts.
- Implemented image caching for performance.
- Practiced clean code and project structure in Flutter.

---

## Acknowledgements 🙏
[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/) ↗ for the framework <br>
[![Google Books API](https://img.shields.io/badge/Google%20Books%20API-4285F4?style=for-the-badge&logo=google&logoColor=white)](https://developers.google.com/books) ↗ for book data <br>
ChatGPT for code and documentation help 😂

---
