class ApiEndpoints {
  // Base endpoints
  static const String health = '/health';
  
  // Auth endpoints
  static const String authMe = '/api/auth/me';
  static const String authVerify = '/api/auth/verify';
  
  // Notes endpoints
  static const String notes = '/api/notes/';
  static String noteById(String noteId) => '/api/notes/$noteId';
  static String noteFavorite(String noteId) => '/api/notes/$noteId/favorite';
}
