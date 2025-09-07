import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:fpdart/fpdart.dart';

class GeminiService {
  factory GeminiService() => _instance;

  GeminiService._internal();

  static final GeminiService _instance = GeminiService._internal();

  late Gemini _gemini;

  void initialize({required String apiKey}) {
    Gemini.init(apiKey: apiKey);
    _gemini = Gemini.instance;
  }


  /// Notlarla birlikte soru sorma (AI Asistan) - Multi-turn chat
  Future<Either<String, String>> askQuestionWithNotes({
    required String question,
    required String notes,
    List<Map<String, String>>? chatHistory,
  }) async {
    try {
      print('🚀 Gemini Service: Soru alındı: $question');
      print('📚 Gemini Service: Chat geçmişi: $chatHistory');
      print('📝 Gemini Service: Notlar uzunluğu: ${notes.length}');
      
      final chatMessages = <Content>[];

      // İlk mesaj: Notları tanıt
      if (chatHistory == null || chatHistory.isEmpty) {
        print('🆕 Gemini Service: İlk mesaj - notlar tanıtılıyor');
        chatMessages.add(
          Content(
            role: 'user',
            parts: [
              Part.text('''
Sen bir kişisel not asistanısın. Tek işin kullanıcının notlarını analiz ederek sorularını yanıtlamak.
Notlar dışında herhangi bir bilgi verme. Hassas içeriğe sahip konular hakkında asla konuşma.

Kullanıcının Notları:
$notes

Lütfen:
1. Notları analiz et.
2. Soruyla ilgili notları bul.
3. Kullanıcın sana yazdığı dilde detaylı ve faydalı bir yanıt ver.
4. İlgili notların başlıklarını ve önemli noktalarını belirt.
5. Eğer soruyla ilgili not bulunamazsa, bunu nazikçe belirt.

Kullanıcının Sorusu: $question
'''),
            ],
          ),
        );
      } else {
        print('💬 Gemini Service: Chat geçmişi var - ${chatHistory.length} mesaj');
        
        // İlk mesaj: Notları tanıt (chat geçmişi varken de)
        chatMessages.add(
          Content(
            role: 'user',
            parts: [
              Part.text('''
Sen bir kişisel not asistanısın. Tek işin kullanıcının notlarını analiz ederek sorularını yanıtlamak.
Notlar dışında herhangi bir bilgi verme. Hassas içeriğe sahip konular hakkında asla konuşma.

Kullanıcının Notları:
$notes

Lütfen:
1. Notları analiz et.
2. Soruyla ilgili notları bul.
3. Kullanıcın sana yazdığı dilde detaylı ve faydalı bir yanıt ver.
4. İlgili notların başlıklarını ve önemli noktalarını belirt.
5. Eğer soruyla ilgili not bulunamazsa, bunu nazikçe belirt.

Kullanıcının Sorusu: $question
'''),
            ],
          ),
        );
        
        // Chat geçmişini ekle
        for (final message in chatHistory) {
          print('📨 Gemini Service: Mesaj ekleniyor - ${message['role']}: ${message['content']}');
          chatMessages.add(
            Content(
              role: message['role'],
              parts: [Part.text(message['content']!)],
            ),
          );
        }

        // Yeni soruyu ekle
        print('❓ Gemini Service: Yeni soru ekleniyor: $question');
        chatMessages.add(Content(role: 'user', parts: [Part.text(question)]));
      }

      print("📤 Gemini Service: ${chatMessages.length} mesaj Gemini'ye gönderiliyor'");
      final response = await _gemini.chat(chatMessages);
      print('📥 Gemini Service: Gemini yanıtı: ${response?.output}');
      return Right(response?.output ?? 'Yanıt oluşturulamadı');
    } on Exception catch (e) {
      return Left('AI yanıtı alınırken hata oluştu: $e');
    }
  }
}
