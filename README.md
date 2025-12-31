# E-Learning Platform

> A simple Flutter mobile application for online learning with course enrollment, progress tracking, and personalized theme customization

---

## Table of Contents

1. [Features](#features)
2. [Project Structure](#project-structure)
3. [Setup Instructions](#setup-instructions)
4. [Architecture & Design Patterns](#architecture--design-patterns)
5. [Contributors](#contributors)

---

## Features

- **Browse & Discover Courses** with categories and instructor information
- **Course Enrollment** with instant access and progress tracking
- **Progress Tracking** for enrolled courses with visual indicators
- **My Courses Dashboard** to view all enrolled courses at a glance
- **Course Details** with comprehensive course information
- **User Profiles** with personalized settings and preferences
- **Light/Dark Theme Toggle** with persistent preference
- **Local Storage** via SharedPreferences for data persistence
- **Provider State Management** for real-time UI updates
- **Search Functionality** to find courses by title or category

---

## Project Structure

```
lib/
├── main.dart                        # App entry point
├── models/
│   ├── course.dart                  # Course data model
│   └── user.dart                    # User data model
├── providers/
│   ├── course_provider.dart         # Course state management
│   └── theme_provider.dart          # Theme state management
├── screens/
│   ├── home_screen.dart             # Main dashboard & course browsing
│   ├── course_details_screen.dart   # Course information & enrollment
│   ├── my_courses_screen.dart       # User's enrolled courses
│   ├── profile_screen.dart          # User profile & settings
│   └── login_screen.dart            # User authentication
└── services/
    └── storage_service.dart         # Local data persistence
```

---

## Setup Instructions

### Prerequisites
- **Flutter SDK**: Version 3.0 or higher ([Install Flutter](https://docs.flutter.dev/get-started/install))
- **Dart SDK**: Version 3.0+
- **IDE**: Android Studio, VS Code
- **Emulator/Device**: Android Emulator, iOS Simulator, or physical device


### Installation

1. **Clone the Repository**

```bash
git clone https://github.com/rasha-2k/E-Learning-Platform.git
cd E-Learning-Platform
```

2. **Install Dependencies**

```bash
flutter pub get
```

3. **Run the Application**

**Option 1: Using IDE**
- Open project in Android Studio/VS Code
- Press F5 or click Run button

**Option 2: Command Line**
```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device-id>

# Run on Android emulator
flutter run -d android

# Run on iOS simulator (macOS only)
flutter run -d ios

# Run on Chrome (web)
flutter run -d chrome
```

---

## Architecture & Design Patterns

### State Management Pattern

This app uses the **Provider** pattern for state management:

```
┌─────────────────────────────────────────┐
│         UI Layer (Screens)               │
│  - Login, Home, Profile, etc.            │
│  - Consumes data via Consumer/watch      │
│  - Triggers provider methods             │
└──────────────┬──────────────────────────┘
               │
               │ notifyListeners()
               ↓
┌──────────────────────────────────────────┐
│      Provider Layer (Business Logic)     │
│  - CourseProvider, ThemeProvider         │
│  - Extends ChangeNotifier                │
│  - Manages app state                     │
│  - Orchestrates data operations          │
└──────────────┬───────────────────────────┘
               │
               │ Calls save/load methods
               ↓
┌──────────────────────────────────────────┐
│       Service Layer (Data Access)        │
│  - StorageService                        │
│  - Wraps SharedPreferences               │
│  - JSON serialization/deserialization    │
└──────────────┬───────────────────────────┘
               │
               │ Read/Write operations
               ↓
┌──────────────────────────────────────────┐
│    Data Layer (Persistence)              │
│  - SharedPreferences                     │
│  - Device local storage                  │
└──────────────────────────────────────────┘
```

---

## Contributors
<div style="display: flex; align-items: center; margin-bottom: 20px;">
    <a href="https://github.com/rasha-2k" style="text-decoration: none; display: flex; align-items: center;">
        <img src="https://github.com/rasha-2k.png" alt="@rasha-2k" title="@rasha-2k" width="100px" height="100px" style="border-radius: 50%; margin-right: 10px;">
    </a>
    <a href="https://github.com/Sdra-Awameh" style="text-decoration: none; display: flex; align-items: center;">
        <img src="https://github.com/Sdra-Awameh.png" alt="@Sdra-Awameh" title="@awsdra" width="100px" height="100px" style="border-radius: 50%; margin-right: 10px;">
    </a>
    <a href="https://github.com/dalaasaqer" style="text-decoration: none; display: flex; align-items: center;">
        <img src="https://github.com/dalaasaqer.png" alt="@dalaasaqer" title="@dalaasaqer" width="100px" height="100px" style="border-radius: 50%; margin-right: 10px;">
    </a>
</div>
