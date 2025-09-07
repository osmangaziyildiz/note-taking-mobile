# Home Feature Documentation

## Overview
The home feature provides users with the ability to view, search, filter, and manage their notes. It works with an offline-first approach and tracks real-time connection status.

## Architecture

### State Management
- **HomeBloc**: Home page state management
  - Note list management
  - Filtering operations
  - Search functions
  - Favorite note operations
  - Connection status tracking

- **HomeState**: Immutable state model
  - `notes`: Note list
  - `isLoading`: Loading state
  - `error`: Error messages
  - `selectedFilter`: Active filter

### UI Components
- **HomeScreen**: Home page interface
  - Header section
  - Search bar
  - Filter options
  - Note list
  - Floating Action Buttons

- **HomeNotesList**: Note list widget
  - Note cards
  - Favorite toggle functionality
  - Empty state display
  - Date formatting

## Key Components

### Models
- `NoteModel`: Note data model
  - `id`: Unique note identifier
  - `title`: Note title
  - `content`: Note content
  - `createdAt`: Creation date
  - `updatedAt`: Update date
  - `isFavorite`: Favorite status
  - `tags`: Tag list
  - `syncStatus`: Synchronization status

### Filters
- `NoteFilter`: Filtering options
  - `all`: All notes
  - `favorites`: Favorite notes only

### Services
- `NoteRepository`: Note data access layer
- `ConnectionService`: Connection status tracking

## Features

### Note Management
- ✅ **Note List**: Display all notes
- ✅ **Favorite Notes**: Mark/unmark favorite notes
- ✅ **Note Filtering**: All notes / Favorite notes
- ✅ **Search**: Search in note titles and content
- ✅ **Offline Support**: Work without internet connection

### User Experience
- ✅ **Real-time Updates**: Automatic refresh on connection status changes
- ✅ **Loading States**: Loading indicators
- ✅ **Error Handling**: User notification on error states
- ✅ **Empty States**: Empty state displays
- ✅ **Responsive Design**: Adaptation to different screen sizes

### Navigation
- ✅ **Note Creation**: Navigate to new note creation page
- ✅ **Note Editing**: Navigate to note editing page
- ✅ **AI Assistant**: Navigate to AI assistant page

## Usage

### Note List Loading
1. Automatic note loading when HomeBloc is initialized
2. Automatic refresh on connection status changes
3. Fetch note data from repository
4. State update and UI refresh

### Filtering Process
1. User selects filter option
2. HomeBloc processes filter change
3. Note list is filtered
4. UI is updated

### Favorite Process
1. User clicks favorite icon
2. HomeBloc changes favorite status
3. Repository is updated
4. UI is updated instantly

### Search Process
1. User enters text in search bar
2. Notes are filtered by search text
3. Results are displayed in real-time

## Error Handling
- Connection error states
- Note loading errors
- Favorite update errors
- Search errors

## Offline-First Features
- Read notes from local database
- Work in offline mode
- Automatic synchronization when connection returns
- Synchronization status tracking

## UI States

### Loading State
- CircularProgressIndicator display
- Red color theme

### Empty State
- Appropriate icon display
- Descriptive message
- Different messages based on filter state

### Error State
- Error message display
- User-friendly error descriptions

## Performance
- Lazy loading for note list
- Efficient state management
- Minimal rebuilds
- Memory efficient widgets
