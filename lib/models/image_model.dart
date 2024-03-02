class ImageModel{
  String imageUrl, id;

//<editor-fold desc="Data Methods">
  ImageModel({
    required this.imageUrl,
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageModel &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          id == other.id);

  @override
  int get hashCode => imageUrl.hashCode ^ id.hashCode;

  @override
  String toString() {
    return 'ImageModel{' + ' imageUrl: $imageUrl,' + ' id: $id,' + '}';
  }

  ImageModel copyWith({
    String? imageUrl,
    String? id,
  }) {
    return ImageModel(
      imageUrl: imageUrl ?? this.imageUrl,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': this.imageUrl,
      'id': this.id,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      imageUrl: map['imageUrl'] as String,
      id: map['id'] as String,
    );
  }

//</editor-fold>
}