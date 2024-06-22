import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAeU7_Y-1gOTgOoQCq_k6nuWn8KUlOeDvM",
            authDomain: "rabbit-2ba47.firebaseapp.com",
            projectId: "rabbit-2ba47",
            storageBucket: "rabbit-2ba47.appspot.com",
            messagingSenderId: "415352862345",
            appId: "1:415352862345:web:58909286c09321b35cf858",
            measurementId: "G-GEVPZPVEP6"));
  } else {
    await Firebase.initializeApp();
  }
}
