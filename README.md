# instant_app

Instant app

## Getting Started



Requirement:

< 15mb 


Android Instant App testen:

1. Tools > SDK Manager > SDK Tool tab > vink 'Google Play Instant Development SDK' aan

2. Voeg 'C:\Users\%EIGEN GEBRUIKERSNAAM%\AppData\Local\Android\Sdk\extras\google\instantapps' toe in omgevings variabelen(path)
3. Android studio opnieuw opstarten

4. instant_app apk builden > 
Flutter build apk --target-platform android-arm lib/main.dart
Flutter build apk --target-platform android-arm instant_app\lib\instant_app.dart
Flutter build apk --target-platform android-arm lib\instant_app\instant_app.dart


5. Open Terminal > cd ez_charge\build\app\outputs\apk\release
6. ia run app-release.apk
ia run build\app\outputs\apk\release\app-release.apk

OF
2. open het project als android project ipv flutter.
2. Run tab > edit configurations > vink 'Deploy as instant app'


Problemen met:

Execution failed for task ':app:lintVitalRelease'.
> Could not resolve all artifacts for configuration ':app:profileRuntimeClasspath'.

oplossing: 
Flutter build apk --target-platform android-arm --debug instant_app/lib/main.dart
Flutter build apk --target-platform android-arm --profile instant_app/lib/main.dart
Flutter build apk --target-platform android-arm instant_app/lib/main.dart


