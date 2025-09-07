# AI Assistant Feature Documentation

## Overview
The AI Assistant feature is an artificial intelligence assistant that analyzes users' notes and answers their questions. It works with Google Gemini API integration and provides chat-based interaction.

## Architecture

### State Management
- **AiBloc**: AI assistant state management
  - Question processing
  - Chat history management
  - Note analysis
  - AI response processing
  - Error handling

- **AiState**: Immutable state model
  - `initial`: Initial state
  - `loading`: Loading state
  - `responseReceived`: Response received state
  - `error`: Error state

### UI Components
- **AiAssistantScreen**: AI assistant interface
  - Chat area
  - Message input
  - Send button
  - Chat history display
  - Loading and error states

### Services
- **GeminiService**: Google Gemini API integration
  - Note analysis
  - Question answering
  - Chat history support
  - API error handling

## Key Components

### Models
- **Chat Message**: Chat message model
  - `role`: Message role (user/model)
  - `content`: Message content

### AI Integration
- **Gemini API**: Google's artificial intelligence service
  - Note analysis
  - Natural language processing
  - Contextual responses
  - Multi-language support

### Data Processing
- **Note Formatting**: Formatting notes for AI
  - Title and content combination
  - Date information addition
  - Tag information addition
  - Structured format

## Features

### AI Chat
- ✅ **Ask Questions**: Ask questions about notes
- ✅ **Smart Responses**: Contextual and accurate responses
- ✅ **Chat History**: Store conversation history
- ✅ **Multiple Questions**: Ask consecutive questions
- ✅ **Context Preservation**: Remember previous conversations

### Note Analysis
- ✅ **Analyze All Notes**: Examine all user notes
- ✅ **Content Understanding**: Understand note contents
- ✅ **Contextual Search**: Connect between notes
- ✅ **Summarization**: Summarize notes
- ✅ **Categorization**: Categorize notes

### User Experience
- ✅ **Real-time Chat**: Instant messaging experience
- ✅ **Loading States**: Loading indicator while waiting for AI response
- ✅ **Error Handling**: User notification on error states
- ✅ **Chat UI**: Modern chat interface
- ✅ **Auto Scroll**: Auto scroll to show last message

### Security
- ✅ **Exit Confirmation**: Chat history loss warning
- ✅ **Secure API**: Secure API calls
- ✅ **Data Protection**: User data protection

## Usage

### AI Chat Flow
1. User clicks AI Assistant button
2. AiAssistantScreen opens
3. User writes a question
4. Clicks "Send" button
5. AI analyzes notes
6. Creates and shows response
7. Chat history is updated

### Note Analysis Flow
1. When first question is asked
2. All notes are loaded from local database
3. Notes are formatted for AI
4. Sent to Gemini API
5. AI analyzes notes
6. Creates response

### Chat History Management
1. Each question and answer is added to chat history
2. History is used in subsequent questions
3. Context is preserved
4. History is cleared on exit

## Error Handling

### API Errors
- **Gemini API Error**: API response error
- **Rate Limiting**: API limit exceeded
- **Network Error**: Network connection error
- **Timeout**: API response timeout

### Data Errors
- **Note Loading Error**: Error while loading notes
- **Format Error**: Note formatting error
- **Data Corruption**: Corrupted note data

### UI Errors
- **Input Validation**: Invalid input
- **State Error**: State management error
- **Navigation Error**: Page transition error

## UI States

### Initial State
- **Welcome Message**: AI assistant introduction
- **Usage Instructions**: How to use information
- **Empty Chat Area**: Clean start

### Loading State
- **AI Response Waiting**: While AI creates response
- **Note Analysis**: While analyzing notes
- **API Call**: While sending request to API

### Response State
- **Chat Messages**: User and AI messages
- **Message Formatting**: Proper message display
- **Avatar Display**: User and AI avatars
- **Timestamp**: Message times

### Error State
- **Error Message**: Descriptive error notification
- **Retry**: Retry after error
- **Error Details**: Technical error information

## Chat Interface

### Message Types
- **User Messages**: User messages (right, purple)
- **AI Messages**: AI responses (left, white)
- **System Messages**: System messages

### Message Formatting
- **Text Wrapping**: Wrapping long texts
- **Link Detection**: Link detection
- **Code Formatting**: Code block formatting
- **List Formatting**: List formatting

### Input Management
- **Multi-line Input**: Multi-line input
- **Auto Resize**: Automatic resizing
- **Send on Enter**: Send with Enter
- **Input Validation**: Input validation

## Performance

### Optimization
- **Lazy Loading**: Load only necessary data
- **Caching**: Cache note data
- **Efficient State**: Minimal state updates
- **Memory Management**: Memory usage optimization

### API Management
- **Request Batching**: Group API requests
- **Error Retry**: Retry on error
- **Timeout Handling**: Timeout management
- **Rate Limiting**: API limit management

## Security

### Data Protection
- **API Key Security**: Secure API key storage
- **Data Encryption**: Data encryption
- **User Privacy**: User privacy
- **Secure Communication**: Secure communication

### Input Validation
- **Sanitization**: Input cleaning
- **Length Limits**: Length limits
- **Content Filtering**: Content filtering
- **Malicious Input**: Malicious input protection

## Integration

### Gemini API
- **Authentication**: API authentication
- **Request Format**: Request format
- **Response Parsing**: Response parsing
- **Error Handling**: Error management

### Local Data
- **Note Repository**: Note data access
- **Data Formatting**: Data formatting
- **Cache Management**: Cache management
- **Sync Status**: Synchronization status
