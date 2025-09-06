# Auth Feature Documentation

## Overview
Complete Firebase Authentication implementation with email/password login and registration. Built using Flutter Bloc pattern with clean architecture principles.

## Architecture

### Global State Management
- **AuthBloc**: Central authentication state management
  - Handles login, logout, registration events
  - Manages user tokens and authentication state
  - Provides auth state changes stream
  - Integrates with Firebase Auth backend

- **AuthRepository**: Data layer abstraction
  - Firebase Auth integration
  - API call implementations
  - Error handling and data transformation
  - Token management and refresh

### UI State Management
- **LoginScreen**: Login form interface
  - Email/password input fields
  - Real-time form validation
  - Loading states and error display
  - Navigation to home on success

- **RegisterScreen**: Registration form interface
  - Name, email, password, confirm password fields
  - Form validation with password matching
  - Loading states and error handling
  - Navigation to login on success

## Key Components

### Models
- `UserModel`: Immutable user data model
  - `id`: Unique user identifier
  - `email`: User email address
  - `displayName`: Optional display name
  - `isEmailVerified`: Email verification status
  - `createdAt`: Account creation timestamp
  - `updatedAt`: Last update timestamp

### Validation
- `Validators`: Centralized validation utilities
  - `validateEmail()`: Email format validation
  - `validatePassword()`: Password strength validation (min 6 chars)
  - `validateConfirmPassword()`: Password matching validation

### Navigation
- **Auto Route**: Type-safe navigation system
  - Route definitions in `app_router.dart`
  - Generated route classes
  - Deep linking support
  - Navigation flow: Login ↔ Register → Home

## Features

### Authentication
- ✅ **Email/Password Login**: Secure authentication with Firebase
- ✅ **Email/Password Registration**: New user account creation
- ✅ **Logout**: Secure session termination
- ✅ **Token Management**: Automatic token refresh and storage
- ✅ **Auth State Persistence**: Maintains login state across app restarts

### User Experience
- ✅ **Form Validation**: Real-time input validation with user-friendly messages
- ✅ **Loading States**: Visual feedback during authentication operations
- ✅ **Error Handling**: Comprehensive error messages for different scenarios
- ✅ **Auto Navigation**: Seamless page transitions based on auth state
- ✅ **Password Visibility Toggle**: User-friendly password input

### Technical
- ✅ **Clean Architecture**: Separation of concerns with repository pattern
- ✅ **State Management**: Flutter Bloc for predictable state updates
- ✅ **Type Safety**: Freezed for immutable data models
- ✅ **Functional Programming**: Fpdart for error handling
- ✅ **Code Generation**: Build runner for Freezed and Auto Route

## Usage

### Login Flow
1. User enters email and password
2. Form validation runs in real-time
3. AuthBloc processes login request
4. Firebase authenticates credentials
5. User token is generated and stored
6. Navigation to Home screen
7. Token details printed to console

### Registration Flow
1. User fills registration form (name, email, password, confirm password)
2. Form validation ensures data integrity
3. AuthBloc processes registration request
4. Firebase creates new user account
5. User is automatically logged in
6. Navigation to Home screen

### Logout Flow
1. User clicks logout button on Home screen
2. AuthBloc processes logout request
3. Firebase session is terminated
4. User state is cleared
5. Navigation back to Login screen

## Error Handling
- Network connectivity issues
- Invalid email format
- Weak passwords
- User not found
- Wrong password
- Account disabled
- Rate limiting
- Firebase service errors

## Security Features
- Password strength requirements
- Email format validation
- Secure token storage
- Session management
- Automatic logout on token expiry
