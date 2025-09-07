import 'package:dio/dio.dart';
import 'package:notetakingapp/features/auth/repositories/auth_repository.dart';

class DioService {
  factory DioService() => _instance;
  
  DioService._internal();
  
  static final DioService _instance = DioService._internal();

  late Dio _dio;
  AuthRepository? _authRepository;
  
  static const String _baseUrl = 'https://note-taking-backend-04jp.onrender.com';

  Dio get dio => _dio;

  void initialize({AuthRepository? authRepository}) {
    _authRepository = authRepository;
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Request interceptor - add token
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Add token to header
          final token = await _getAuthToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) {
          // Token expired
          if (error.response?.statusCode == 401) {
            // TODO: Handle unauthorized
            print('❌ Unauthorized - Token expired');
          }
          handler.next(error);
        },
      ),
    );
  }

  // Get auth token - Firebase ID token
  Future<String?> _getAuthToken() async {
    if (_authRepository == null) return null;
    
    final result = await _authRepository!.getIdToken();
    return result.fold(
      (error) {
        print('❌ Failed to get auth token: $error');
        return null;
      },
      (token) => token,
    );
  }
}
