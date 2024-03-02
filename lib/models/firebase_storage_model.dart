import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageModel {
  List<Reference> files, folders;

//<editor-fold desc="Data Methods">
  FirebaseStorageModel({
    required this.files,
    required this.folders,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is FirebaseStorageModel &&
              runtimeType == other.runtimeType &&
              files == other.files &&
              folders == other.folders);

  @override
  int get hashCode => files.hashCode ^ folders.hashCode;

  @override
  String toString() {
    return 'FirebaseStorageModel{' +
        ' files: $files,' +
        ' folders: $folders,' +
        '}';
  }

  FirebaseStorageModel copyWith({
    List<Reference>? files,
    List<Reference>? folders,
  }) {
    return FirebaseStorageModel(
      files: files ?? this.files,
      folders: folders ?? this.folders,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'files': this.files,
      'folders': this.folders,
    };
  }

  factory FirebaseStorageModel.fromMap(Map<String, dynamic> map) {
    return FirebaseStorageModel(
      files: map['files'] as List<Reference>,
      folders: map['folders'] as List<Reference>,
    );
  }

//</editor-fold>
}