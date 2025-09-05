import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

extension LocalizedString on String {
  String get localized => LocalizationManager.getLocalizedString(this);
}

class LocalizationManager {
  static const Map<String, String> _specialFallbacks = {
    'pt': 'pt-PT', // Use pt-PT if pt is used.
    'es': 'es-MX', // Use es-MX if es is used.
  };

  static const String _defaultLanguage = 'tr';
  static const List<String> _supportedLanguageFiles = [
    'tr-TR',
    'en-US',
    // Future languages to be added:
    // 'de-DE',
    // 'fr-FR',
    // 'es-ES',
    // 'pt-PT',
  ];

  static String? currentLanguage;
  static Map<String, Map<String, String>> translations = {};
  static Set<String> supportedLanguages = {};

  static Future<void> init() async {
    // Load each language file separately
    for (final languageFile in _supportedLanguageFiles) {
      await _loadLanguageFile(languageFile);
    }

    fetchLanguage();
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

  static void fetchLanguage() {
    final locale = PlatformDispatcher.instance.locale.toLanguageTag();

    // 1. Exact Match Check
    if (supportedLanguages.contains(locale)) {
      currentLanguage = locale;
      debugPrint('🌍 Exact match found: $locale');
      return;
    }

    // If no match, use the base language code.
    final base = locale.split('-')[0];

    // 2. Special Rule (Fallback) Check
    if (_specialFallbacks.containsKey(base)) {
      final fallbackLanguage = _specialFallbacks[base]!;
      if (supportedLanguages.contains(fallbackLanguage)) {
        currentLanguage = fallbackLanguage;
        debugPrint('🔄 Special fallback used: $base -> $fallbackLanguage');
        return;
      }
    }

    // 3. Base Language Code Check
    if (supportedLanguages.contains(base)) {
      currentLanguage = base;
      debugPrint('🔤 Base language code used: $base');
      return;
    }

    // 4. Return to Default Language
    currentLanguage = _defaultLanguage;
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
  static void changeLanguage(String languageCode) {
    if (supportedLanguages.contains(languageCode)) {
      currentLanguage = languageCode;
      debugPrint('🔄 Language changed: $languageCode');
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

  // Debug for all translations
  static void debugPrintTranslations() {
    debugPrint('🔍 Current Translations:');
    debugPrint('🌍 Current Language: $currentLanguage');
    debugPrint('📚 Supported Languages: $supportedLanguages');
    debugPrint('📝 Total Translation Count: ${translations.length}');
    
    translations.forEach((key, value) {
      debugPrint('  "$key": $value');
    });
  }
}
