# Note Taking App - Case Study

A comprehensive Flutter application demonstrating modern mobile development practices with offline-first architecture, AI integration, and clean code principles.

## Project Overview

This note-taking application serves as a case study showcasing advanced Flutter development techniques including:

- **Offline-First Architecture**: Local-first data storage with cloud synchronization
- **AI Integration**: Google Gemini API for intelligent note analysis and chat assistance
- **Clean Architecture**: Repository pattern with dependency injection
- **State Management**: Flutter Bloc for predictable state updates
- **Authentication**: Firebase Auth with email/password and Google Sign-In
- **Multi-language Support**: Turkish and English localization
- **Theme Management**: Light/Dark theme switching

## Architecture

The application follows clean architecture principles with clear separation of concerns:

```
lib/
├── core/                    # Core functionality
│   ├── database/           # Local database setup
│   ├── di/                 # Dependency injection
│   ├── localization/       # Multi-language support
│   ├── models/             # Data models
│   ├── network/            # Network connectivity
│   ├── repositories/       # Data access layer
│   ├── router/             # Navigation
│   ├── services/           # Business services
│   ├── theme/              # UI theming
│   ├── utils/              # Utility functions
│   └── widgets/            # Reusable widgets
├── features/               # Feature modules
│   ├── auth/              # Authentication
│   ├── home/              # Home screen
│   ├── note/              # Note management
│   ├── ai/                # AI assistant
│   └── settings/          # Settings
└── main.dart              # Application entry point
```

## Features

### Authentication
- Email/password authentication
- Google Sign-In integration
- User session management
- Secure token handling

### Note Management
- Create, edit, and delete notes
- Offline-first data storage
- Real-time synchronization
- Favorite notes functionality
- Note filtering and search

### AI Assistant
- Google Gemini API integration
- Intelligent note analysis
- Chat-based interaction
- Context-aware responses
- Multi-language support

### Settings
- Theme switching (Light/Dark)
- Language selection (Turkish/English)
- Connection status monitoring
- User preferences management

## Technology Stack

- **Framework**: Flutter 3.x
- **State Management**: Flutter Bloc
- **Backend**: Firebase (Auth, Firestore)
- **Local Database**: SQLite
- **AI Service**: Google Gemini API
- **Dependency Injection**: GetIt
- **Navigation**: Auto Route
- **Code Generation**: Freezed, JSON Annotation
- **Functional Programming**: Fpdart
- **Localization**: Flutter Intl

## Installation

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / VS Code
- Git

### Setup Steps

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd notetakingapp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Configure Firebase**
   - Add `google-services.json` to `android/app/`
   - Add `GoogleService-Info.plist` to `ios/Runner/`
   - Configure Firebase project settings

5. **Set up Google Sign-In**
   - Configure OAuth 2.0 credentials
   - Update bundle ID and package name
   - Add SHA-1 fingerprint for Android

6. **Configure Gemini API**
   - Copy `.env.example` to `.env`
   - Obtain API key from Google AI Studio
   - Add your API key to `.env` file:
     ```
     GEMINI_API_KEY=your_actual_api_key_here
     ```

7. **Run the application**
   ```bash
   flutter run
   ```

## Documentation

Comprehensive documentation is available in the `docs/` directory:

- [Authentication Feature](docs/auth_feature.md) - Complete authentication implementation
- [Home Feature](docs/home_feature.md) - Note listing and management
- [Note Feature](docs/note_feature.md) - Note creation and editing
- [AI Assistant Feature](docs/ai_assistant_feature.md) - AI integration and chat
- [Settings Feature](docs/settings_feature.md) - User preferences and settings
- [Error Handling with Fpdart](docs/error_handling_with_fpdart.md) - Error management patterns
- [Google Sign-In Configuration](docs/signIn_with_google_configuration.md) - Setup guide

## Key Design Patterns

### Repository Pattern
- Abstract data access layer
- Local and remote data sources
- Offline-first synchronization

### Bloc Pattern
- Predictable state management
- Event-driven architecture
- Separation of business logic

### Dependency Injection
- Service locator pattern
- Loose coupling between components
- Testable architecture

### Error Handling
- Functional programming approach
- Either type for error handling
- Comprehensive error management

## Development Practices

### Code Quality
- Clean architecture principles
- SOLID principles adherence
- Comprehensive error handling
- Type safety with null safety

### Testing
- Unit tests for business logic
- Widget tests for UI components
- Integration tests for user flows

### Performance
- Lazy loading implementation
- Efficient state management
- Memory optimization
- Offline-first data strategy

## Case Study Focus

This project demonstrates:

1. **Modern Flutter Development**: Latest Flutter features and best practices
2. **Scalable Architecture**: Clean architecture that can grow with requirements
3. **Offline-First Design**: Robust offline functionality with cloud sync
4. **AI Integration**: Real-world AI service integration
5. **Internationalization**: Multi-language support implementation
6. **State Management**: Complex state management with Bloc pattern
7. **Error Handling**: Comprehensive error handling strategies
8. **Code Generation**: Effective use of code generation tools

## Project Structure

The project is organized into feature modules, each containing:

- **Models**: Data structures and business entities
- **Repositories**: Data access layer
- **Blocs**: State management and business logic
- **Screens**: UI components and user interfaces
- **Widgets**: Reusable UI components

## Dependencies

Key dependencies used in this project:

- `flutter_bloc`: State management
- `firebase_auth`: Authentication
- `cloud_firestore`: Cloud database
- `sqflite`: Local database
- `google_sign_in`: Google authentication
- `auto_route`: Navigation
- `freezed`: Code generation
- `fpdart`: Functional programming
- `get_it`: Dependency injection
- `google_generative_ai`: AI integration

