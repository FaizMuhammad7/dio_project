import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

/// storage constants
class StorageConstants {
  static var mainRef = FirebaseStorage.instance.ref();
  static var images = mainRef.child('Images');
}

/// AuthConstants fire base helpers
class AuthConstants {
  static User? get currentUser => FirebaseAuth.instance.currentUser;
  static bool get isUserLoggedIn => currentUser != null;
  static String? get currentUserId => currentUser?.uid;
}
