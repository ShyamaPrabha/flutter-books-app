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
## 🛠️ Setup Instructions

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (latest stable version)
- Android Studio / VS Code
- Git installed

### Steps
1. **Clone the repository**
   git clone  https://github.com/ShyamaPrabha/flutter-books-app.git
2. **Navigate into the project**
3. **Get dependencies**
4. **Run the app**
   
## Project Structure

This project follows a Clean Architecture inspired, Provider-based state management approach.
The structure is modular and layered, similar to MVVM, where:

core/ and models/ → define data models

repositories/ → handle API calls and data persistence

providers/ → act as ViewModels (business logic + state management)

screens/ and widgets/ → represent the View (UI layer)

services/, themes/, utils/ → reusable helpers, theming, and bootstrap setup

---
## Architecture
- Used Provider For State Management
- Local Storage implemented using Shared Preferences . Books marked as favourites stored locally

