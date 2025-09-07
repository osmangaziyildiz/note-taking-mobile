# Note Feature Documentation

## Overview
The note management feature provides users with the ability to create, edit, delete, and manage notes. It works with an offline-first approach and provides real-time synchronization support.

## Architecture

### State Management
- **NoteCreateBloc**: Note creation state management
  - Form validation
  - Note saving operations
  - Loading and error states
  - Navigation events

- **NoteEditBloc**: Note editing state management
  - Note loading
  - Form updates
  - Note deletion operations
  - Confirmation dialogs

### UI Components
- **NoteCreateScreen**: Note creation interface
  - Title input field
  - Content editor
  - Save button
  - Loading states

- **NoteEditScreen**: Note editing interface
  - Load existing note data
  - Editable form fields
  - Save and delete buttons
  - Delete confirmation dialog

## Key Components

### Models
- `NoteModel`: Note data model
  - `id`: Unique note identifier
  - `title`: Note title
  - `content`: Note content
  - `createdAt`: Creation date
  - `updatedAt`: Update date
  - `ownerUid`: Note owner user ID
  - `isFavorite`: Favorite status
  - `tags`: Tag list
  - `syncStatus`: Synchronization status (pending/synced)
  - `lastSyncedAt`: Last synchronization date

### Validation
- **Form Validation**: Real-time form validation
  - Title requirement
  - Content requirement
  - Minimum character count validation

### Services
- `NoteRepository`: Note data access layer
- `LocalNoteService`: Local note service
- `RemoteNoteRepository`: Remote note repository

## Features

### Note Creation
- ✅ **Form Interface**: Title and content input fields
- ✅ **Real-time Validation**: Real-time form validation
- ✅ **Auto-save**: Automatic saving feature
- ✅ **Loading States**: Loading indicator during saving
- ✅ **Success Feedback**: Successful save notification
- ✅ **Navigation**: Return to home page after saving

### Note Editing
- ✅ **Data Loading**: Load existing note data
- ✅ **Form Pre-population**: Pre-fill form fields
- ✅ **Real-time Updates**: Real-time updates
- ✅ **Save Changes**: Save modifications
- ✅ **Loading States**: Loading indicator during updates

### Note Deletion
- ✅ **Delete Confirmation**: Delete confirmation dialog
- ✅ **Safe Deletion**: Safe deletion process
- ✅ **Loading States**: Loading indicator during deletion
- ✅ **Success Feedback**: Successful deletion notification
- ✅ **Navigation**: Return to home page after deletion

### Offline Support
- ✅ **Local Storage**: Store in local database
- ✅ **Sync Status**: Track synchronization status
- ✅ **Offline Creation**: Create notes without internet
- ✅ **Auto Sync**: Automatic synchronization when connection returns

## Usage

### Note Creation Flow
1. User clicks "Add Note" button
2. NoteCreateScreen opens
3. User enters title and content
4. Form validation works in real-time
5. "Save" button is clicked
6. NoteCreateBloc saves the note
7. Success message is shown
8. Return to home page

### Note Editing Flow
1. User clicks on note card
2. NoteEditScreen opens
3. Existing note data is loaded
4. User makes changes
5. "Save" button is clicked
6. NoteEditBloc saves the update
7. Success message is shown
8. Return to home page

### Note Deletion Flow
1. User clicks "Delete" button
2. Delete confirmation dialog is shown
3. User confirms
4. NoteEditBloc deletes the note
5. Success message is shown
6. Return to home page

## Error Handling

### Validation Errors
- Empty title error
- Empty content error
- Minimum character count error

### Network Errors
- Connection error states
- Synchronization errors
- Timeout errors

### Database Errors
- Local database errors
- Remote database errors
- Data integrity errors

## UI States

### Loading States
- **Initial Loading**: While loading note
- **Saving**: While saving note
- **Deleting**: While deleting note
- **Syncing**: During synchronization

### Error States
- **Validation Error**: Form validation error
- **Network Error**: Network connection error
- **Database Error**: Database error
- **Unknown Error**: Unknown error

### Success States
- **Note Created**: Note successfully created
- **Note Updated**: Note successfully updated
- **Note Deleted**: Note successfully deleted
- **Note Synced**: Note successfully synchronized

## Form Management

### Text Controllers
- `_titleController`: Title input control
- `_contentController`: Content input control
- State updates with real-time listeners

### Validation Rules
- Title: Minimum 1 character
- Content: Minimum 1 character
- Real-time validation feedback

## Navigation
- **Auto Route**: Type-safe navigation
- **Route Parameters**: Parameter passing with note ID
- **Back Navigation**: Back navigation operations
- **Success Navigation**: Redirect after successful operations

## Performance
- **Efficient State Management**: Minimal rebuilds
- **Lazy Loading**: Load only necessary data
- **Memory Management**: Proper controller disposal
- **Optimistic Updates**: Fast UI updates

## Security
- **Input Sanitization**: Clean user inputs
- **Data Validation**: Data validation controls
- **User Authorization**: User authorization controls
- **Safe Deletion**: Safe deletion operations
