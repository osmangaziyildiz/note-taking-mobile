# Google Sign-In Setup Roadmap

### 1. Firebase Console
1. Create a project in Firebase Console
2. **Enable Authentication > Sign-in method > Google**

### 2. Android Setup
1. Copy **google-services.json** file to `android/app/` folder

### 3. iOS Setup
1. Copy **GoogleService-Info.plist** file to `ios/Runner/` folder
2. Add to **ios/Runner/Info.plist**:
```xml
<key>GIDClientID</key>
<string>CLIENT_ID_FROM_PLIST.apps.googleusercontent.com</string>

<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>REVERSED_CLIENT_ID_FROM_PLIST</string>
        </array>
    </dict>
</array>
```

### 4. Flutter Packages
```yaml
dependencies:
  google_sign_in: ^6.2.1
  firebase_auth: ^4.17.8
  firebase_core: ^2.24.2
```

### 5. Service Locator
```dart
sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.instance)
```

## 🔑 Important Notes

- Get **CLIENT_ID** and **REVERSED_CLIENT_ID** values from GoogleService-Info.plist
- Test on real device for iOS (may not work on simulator)
- Package name and Bundle ID must match Firebase Console
