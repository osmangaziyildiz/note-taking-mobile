import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

extension LocalizedString on String {
  // Example usage: Text('Hello'.localized) or 'Hello'.localized
  String get localized => LocalizationManager.getLocalizedString(this);
}

class LocalizationManager {
  // Notifier: To rebuild the UI when the language changes
  static final ValueNotifier<String?> localeNotifier = ValueNotifier<String?>(null);
  static const Map<String, String> _specialFallbacks = {
    'pt': 'pt-PT', // Use pt-PT if pt is used.
    'es': 'es-MX', // Use es-MX if es is used.
  };

  static const String _defaultLanguage = 'tr';
  static const List<String> _supportedLanguageFiles = [
    'tr-TR',
    'en-US',
    // Future languages can be added:
    // 'de-DE',
    // 'fr-FR',
    // 'es-ES',
    // 'pt-PT',
  ];

  static String? currentLanguage;
  static Map<String, Map<String, String>> translations = {};
  static Set<String> supportedLanguages = {};
  
  // SharedPreferences key for user language preference
  static const String _userLanguageKey = 'user_language_preference';

  static Future<void> init() async {
    // Load each language file separately
    for (final languageFile in _supportedLanguageFiles) {
      await _loadLanguageFile(languageFile);
    }

    await fetchLanguage();
  }

  static Future<void> _loadLanguageFile(String languageFile) async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/localization/$languageFile.json',        
      );
      final strings = json.decode(jsonString) as Map<String, dynamic>;
      
      // Add the translation for each text in the language file
      for (final entry in strings.entries) {
        final key = entry.key;
        final translation = entry.value as String;
        
        if (!translations.containsKey(key)) {
          translations[key] = {};
        }
        translations[key]![languageFile] = translation;
      }
      
      supportedLanguages.add(languageFile);
      debugPrint('✅ $languageFile language file loaded successfully');
    } on Exception catch (e) {
      debugPrint('❌ $languageFile language file loading error: $e');
    }
  }

  static Future<void> fetchLanguage() async {
    // 1. Check user's saved language preference first
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString(_userLanguageKey);
    
    if (savedLanguage != null && supportedLanguages.contains(savedLanguage)) {
      currentLanguage = savedLanguage;
      localeNotifier.value = currentLanguage;
      debugPrint('👤 User preference found: $savedLanguage');
      return;
    }

    // 2. If no user preference, use device locale
    final locale = PlatformDispatcher.instance.locale.toLanguageTag();

    // 2.1. Exact Match Check
    if (supportedLanguages.contains(locale)) {
      currentLanguage = locale;
      localeNotifier.value = currentLanguage;
      debugPrint('🌍 Exact match found: $locale');
      return;
    }

    // If no match, use the base language code.
    final base = locale.split('-')[0];

    // 2.2. Special Rule (Fallback) Check
    if (_specialFallbacks.containsKey(base)) {
      final fallbackLanguage = _specialFallbacks[base]!;
      if (supportedLanguages.contains(fallbackLanguage)) {
        currentLanguage = fallbackLanguage;
        localeNotifier.value = currentLanguage;
        debugPrint('🔄 Special fallback used: $base -> $fallbackLanguage');
        return;
      }
    }

    // 2.3. Base Language Code Check
    if (supportedLanguages.contains(base)) {
      currentLanguage = base;
      localeNotifier.value = currentLanguage;
      debugPrint('🔤 Base language code used: $base');
      return;
    }

    // 3. Return to Default Language
    currentLanguage = _defaultLanguage;
    localeNotifier.value = currentLanguage;
    debugPrint('🏠 Default language used: $_defaultLanguage');
  }

  static String getLocalizedString(String text) {
    final key = text;
    if (translations.containsKey(key)) {
      final langTranslations = translations[key]!;
      if (langTranslations.containsKey(currentLanguage)) {
        return langTranslations[currentLanguage]!;
      } else {
        // If the translation is not found in the current language, return to Turkish.
        return langTranslations['tr-TR'] ?? text;
      }
    }
    return text; // If the key is not found, return the original text.
  }

  // Language change method
  static Future<void> changeLanguage(String languageCode) async {
    if (supportedLanguages.contains(languageCode)) {
      currentLanguage = languageCode;
      localeNotifier.value = currentLanguage;
      
      // Save user preference
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_userLanguageKey, languageCode);
      
      debugPrint('🔄 Language changed and saved: $languageCode');
    } else {
      debugPrint('⚠️ Unsupported language: $languageCode');
    }
  }

  // Get the current language
  static String? getCurrentLanguage() {
    return currentLanguage;
  }

  // Get the supported languages
  static Set<String> getSupportedLanguages() {
    return supportedLanguages;
  }
}
