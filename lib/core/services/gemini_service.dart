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

  /// Ask questions with notes (AI Assistant) - Multi-turn chat
  Future<Either<String, String>> askQuestionWithNotes({
    required String question,
    required String notes,
    List<Map<String, String>>? chatHistory,
  }) async {
    try {
      final chatMessages = <Content>[];

      // First message: Introduce notes
      if (chatHistory == null || chatHistory.isEmpty) {
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
        // First message: Introduce notes (even with chat history)
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

        // Add chat history
        for (final message in chatHistory) {
          chatMessages.add(
            Content(
              role: message['role'],
              parts: [Part.text(message['content']!)],
            ),
          );
        }

        // Add new question
        chatMessages.add(Content(role: 'user', parts: [Part.text(question)]));
      }

      final response = await _gemini.chat(chatMessages);
      return Right(response?.output ?? 'Response could not be generated');
    } on Exception catch (e) {
      return Left('Error occurred while getting AI response: $e');
    }
  }
}
