## API Documentation

### Base URL
- **Local Development:** `http://127.0.0.1:8000`
- **Production:** `https://note-taking-backend-04jp.onrender.com`

> **Note:** The root URL (`/`) only returns a welcome message. To access the interactive API documentation and testing interface, you must navigate to the `/docs` endpoint. This is the standard FastAPI behavior where Swagger UI is served at the `/docs` path.

### Authentication
All endpoints (except health check) require authentication using Firebase ID Token in the Authorization header:

```
Authorization: Bearer <your-firebase-id-token>
```


### Endpoints

#### Health Check
- **GET** `/health` - Check API health status (hidden from Swagger UI)

#### Authentication
- **GET** `/api/auth/me` - Get current user information
- **GET** `/api/auth/verify` - Verify authentication token

#### Notes
- **POST** `/api/Notes` - Create a new note
- **GET** `/api/Notes` - Get all user's notes
- **PUT** `/api/Notes/{note_id}` - Update a note
- **DELETE** `/api/Notes/{note_id}` - Delete a note

### Request/Response Format

#### Success Response Example
```json
{
  "success": true,
  "data": { ... },
  "message": "Operation successful"
}
```

#### Error Response Example
```json
{
  "success": false,
  "statusCode": 404,
  "errorMessage": "Note not found",
  "details": null
}
```