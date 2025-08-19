# Flutter Books App

A Flutter application to browse books, view details, and manage favourites.  
Built with **Provider** state management and follows a clean architecture approach.

---

## Features
-  Browse a list of books (fetched from API).
-  View detailed information about each book.
-  Add/remove books from **Favourites** (saved locally).
-  Responsive UI with Flutter Widgets.

---
## Project Structure
lib/
│
├── models/          # Data models (e.g., Book, Work)
├── providers/       # State management with Provider
├── usecase/         # Business logic / API calls
├── screens/         # UI screens (Listing, Detail, Favourites)
├── widgets/         # Reusable widgets
└── main.dart        # App entry point

---
## Architecture
- Used Provider For State Management
- Local Storage implemented using Shared Preferences . Books marked as favourites stored locally

