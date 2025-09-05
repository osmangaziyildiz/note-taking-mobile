import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notetakingapp/core/localization/localization_manager.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // LocalizationManager'ı başlat
  debugPrint('🌍 LocalizationManager başlatılıyor...');
  await LocalizationManager.init();
  debugPrint('✅ LocalizationManager başarıyla başlatıldı!');

  await ScreenUtil.ensureScreenSize();
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NoteTakingApp',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const Placeholder(),
        );
      },
    );
  }
}
