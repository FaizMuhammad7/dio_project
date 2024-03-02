import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';


/// AuthConstants fire base helpers
class AuthConstants {
  static User? get currentUser => FirebaseAuth.instance.currentUser;

  static bool get isUserLoggedIn => currentUser != null;

  static String? get currentUserId => currentUser?.uid;
}


/// storage constants fire base helpers
class StorageConstants {
  static var mainRef = FirebaseStorage.instance.ref();
  static var images = mainRef.child('Images');
}


/// Data base constants fire base helpers
class DbConstants {
  static var mainRef = FirebaseDatabase.instance.ref();
  static var userRef = mainRef.child("users");

  /// create more references ( Child ) according to your need
}
