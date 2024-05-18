import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAawLGPiBxFNY144jjcCZFn7vfDlB-1Csc",
            authDomain: "rabbit-2ba47.firebaseapp.com",
            projectId: "rabbit-2ba47",
            storageBucket: "rabbit-2ba47.appspot.com",
            messagingSenderId: "415352862345",
            appId: "1:415352862345:web:69d5cf48d7c610535cf858",
            measurementId: "G-J23SB2ETVM"));
  } else {
    await Firebase.initializeApp();
  }
}
