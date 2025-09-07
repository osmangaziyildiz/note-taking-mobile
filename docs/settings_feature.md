# Settings Feature Documentation

## Overview
The settings feature provides functionality for managing application settings, changing user preferences, and displaying system information. It includes theme, language, connection status, and logout operations.

## Architecture

### State Management
- **ThemeBloc**: Theme state management
  - Light/Dark theme switching
  - Theme status tracking
  - System theme integration

- **LocalizationManager**: Language management
  - Supported languages
  - Current language tracking
  - Language change operations

### UI Components
- **SettingsScreen**: Settings interface
  - Preferences section
  - About section
  - Logout button
  - Connection status indicator

### Services
- **ConnectionService**: Connection status tracking
- **LocalNoteService**: Local note service
- **AuthBloc**: Authentication management

## Key Components

### Preferences
- **Theme Selection**: Theme selection
  - Light Mode: Light theme
  - Dark Mode: Dark theme
  - System Theme: System theme

- **Language Selection**: Language selection
  - Turkish (tr-TR)
  - English (en-US)
  - Language change modal

### System Information
- **App Version**: Application version
- **Last Sync**: Last synchronization date
- **Connection Status**: Connection status
- **Sync Information**: Synchronization information

### User Actions
- **Logout**: Logout operation
- **Confirmation Dialog**: Logout confirmation
- **Auth State Management**: Authentication state management

## Features

### Theme Management
- ✅ **Theme Switching**: Switch between Light/Dark themes
- ✅ **Real-time Update**: Instant theme update
- ✅ **Persistent Storage**: Save theme preference
- ✅ **System Integration**: System theme integration
- ✅ **UI Consistency**: Consistent theme across all UI

### Language Management
- ✅ **Multi-language Support**: Multi-language support
- ✅ **Language Selection**: Language selection modal
- ✅ **Real-time Translation**: Instant language change
- ✅ **Persistent Storage**: Save language preference
- ✅ **Fallback Language**: Default language support

### System Information
- ✅ **App Version**: Display application version
- ✅ **Last Sync Time**: Last synchronization date
- ✅ **Connection Status**: Real-time connection status
- ✅ **Sync Information**: Synchronization details
- ✅ **System Health**: System health status

### Logout Process
- ✅ **Logout Confirmation**: Logout confirmation dialog
- ✅ **Auth State Clear**: Clear authentication state
- ✅ **Data Cleanup**: Data cleanup
- ✅ **Navigation**: Redirect to login page
- ✅ **Session Termination**: Session termination

## Usage

### Theme Change Flow
1. User clicks "Theme" option
2. Current theme status is displayed
3. Theme changes on click
4. UI updates instantly
5. Theme preference is saved

### Language Change Flow
1. User clicks "Language" option
2. Language selection modal opens
3. User selects language
4. Modal closes
5. UI translates instantly
6. Language preference is saved

### Logout Process Flow
1. User clicks "Logout" button
2. Logout confirmation dialog is shown
3. User confirms
4. AuthBloc starts logout process
5. User data is cleared
6. Redirect to login page

### Connection Status Tracking
1. ConnectionService tracks connection status
2. Real-time updates are made
3. Status indicator in UI is updated
4. Offline/Online status is displayed

## Error Handling

### Theme Errors
- **Theme Load Error**: Theme loading error
- **Theme Save Error**: Theme saving error
- **Theme Apply Error**: Theme application error

### Language Errors
- **Language Load Error**: Language loading error
- **Translation Error**: Translation error
- **Language Save Error**: Language saving error

### Logout Errors
- **Logout Error**: Logout operation error
- **Auth Clear Error**: Authentication clearing error
- **Navigation Error**: Navigation error

### Connection Errors
- **Connection Check Error**: Connection check error
- **Status Update Error**: Status update error
- **Network Error**: Network error

## UI States

### Loading States
- **Theme Loading**: While loading theme
- **Language Loading**: While loading language
- **Logout Processing**: While processing logout
- **Sync Loading**: While loading synchronization

### Error States
- **Theme Error**: Theme error state
- **Language Error**: Language error state
- **Logout Error**: Logout error state
- **Connection Error**: Connection error state

### Success States
- **Theme Changed**: Theme successfully changed
- **Language Changed**: Language successfully changed
- **Logout Success**: Logout successful
- **Sync Success**: Synchronization successful

## UI Components

### Preference Items
- **Theme Item**: Theme selection item
  - Icon: Palette
  - Title: Theme
  - Subtitle: Current theme
  - Action: Theme change

- **Language Item**: Language selection item
  - Icon: Language
  - Title: Language
  - Subtitle: Current language
  - Action: Language selection modal

### About Items
- **App Info Item**: Application info item
  - Icon: Info
  - Title: About Notetaking App
  - Subtitle: v1.0.0
  - Action: Show information

- **Last Sync Item**: Last synchronization item
  - Icon: Sync
  - Title: Last sync
  - Subtitle: Synchronization date
  - Action: Show information

- **Connection Item**: Connection status item
  - Icon: WiFi/WiFi Off
  - Title: Connection status
  - Subtitle: Online/Offline
  - Color: Green/Red

### Action Items
- **Logout Item**: Logout item
  - Icon: Logout
  - Title: Logout
  - Color: Red
  - Action: Logout confirmation dialog

## Modals and Dialogs

### Language Selection Modal
- **Bottom Sheet**: Modal opening from bottom
- **Language List**: List of supported languages
- **Current Selection**: Current selection indicator
- **Selection Action**: Language selection action

### Logout Confirmation Dialog
- **Alert Dialog**: Confirmation dialog
- **Title**: Logout
- **Content**: Logout confirmation message
- **Actions**: Cancel/Logout buttons
- **Styling**: Red logout button

## Data Management

### Theme Storage
- **SharedPreferences**: Theme preference storage
- **ThemeMode**: Light/Dark theme state
- **System Theme**: System theme support
- **Persistence**: Persistence after app restart

### Language Storage
- **LocalizationManager**: Language management
- **Supported Languages**: Supported languages
- **Current Language**: Current language
- **Fallback**: Default language support

### Sync Information
- **Last Sync Time**: Last synchronization date
- **Date Formatting**: Date formatting
- **Never Synced**: Never synchronized state
- **Real-time Updates**: Real-time updates

## Performance

### Optimization
- **Lazy Loading**: Load only necessary data
- **Efficient State**: Minimal state updates
- **Memory Management**: Memory usage optimization
- **UI Performance**: UI performance optimization

### Caching
- **Theme Cache**: Theme preference cache
- **Language Cache**: Language preference cache
- **Sync Cache**: Synchronization information cache
- **Connection Cache**: Connection status cache

## Security

### Data Protection
- **Secure Storage**: Secure data storage
- **User Privacy**: User privacy
- **Data Encryption**: Data encryption
- **Session Security**: Session security

### Logout Security
- **Complete Cleanup**: Complete data cleanup
- **Session Termination**: Session termination
- **Token Invalidation**: Token invalidation
- **Data Wiping**: Data wiping
