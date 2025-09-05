import 'package:flutter/material.dart';
import 'package:notetakingapp/core/localization/localization_manager.dart';

class ChangeLanguageTest extends StatefulWidget {
  const ChangeLanguageTest({super.key});

  @override
  State<ChangeLanguageTest> createState() => _ChangeLanguageTestState();
}

class _ChangeLanguageTestState extends State<ChangeLanguageTest> {
  String? selectedLanguage;

  @override
  void initState() {
    super.initState();
    // Mevcut dili dropdown'da göster
    selectedLanguage = LocalizationManager.getCurrentLanguage();
  }

  void _changeLanguage(String? newLanguage) {
    if (newLanguage != null) {
      setState(() {
        selectedLanguage = newLanguage;
      });
      LocalizationManager.changeLanguage(newLanguage);
      // UI'ı yenilemek için setState
      setState(() {});
    }
  }

  String _getLanguageDisplayName(String languageCode) {
    switch (languageCode) {
      case 'tr-TR':
        return '🇹🇷 Türkçe';
      case 'en-US':
        return '🇺🇸 English';
      default:
        return languageCode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NoteTakingApp'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // Dil seçimi dropdown'ı
          Padding(
            padding: const EdgeInsets.all(16),
            child: DropdownButton<String>(
              value: selectedLanguage,
              hint: const Text('🌍'),
              underline: Container(), // Alt çizgiyi kaldır
              items: LocalizationManager.getSupportedLanguages().map((
                languageCode,
              ) {
                return DropdownMenuItem<String>(
                  value: languageCode,
                  child: Text(
                    _getLanguageDisplayName(languageCode),
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
              onChanged: _changeLanguage,
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Dil değişikliği test metinleri
              Text(
                'Merhabalar'.localized,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Hoş geldiniz'.localized,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Daha fazla test metni
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Giriş Yap'.localized,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'E-Posta'.localized,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Şifre'.localized,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Mevcut dil bilgisi
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Mevcut Dil: ${_getLanguageDisplayName(selectedLanguage ?? 'tr-TR')}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
