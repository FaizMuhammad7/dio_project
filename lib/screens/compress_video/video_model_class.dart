class VideoModel {
  List<String> videoId;
  List<String> videoUrl;
  List<String> thumbnailUrl;

//<editor-fold desc="Data Methods">
  VideoModel({
    required this.videoId,
    required this.videoUrl,
    required this.thumbnailUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VideoModel &&
          runtimeType == other.runtimeType &&
          videoId == other.videoId &&
          videoUrl == other.videoUrl &&
          thumbnailUrl == other.thumbnailUrl);

  @override
  int get hashCode =>
      videoId.hashCode ^ videoUrl.hashCode ^ thumbnailUrl.hashCode;

  @override
  String toString() {
    return 'VideoModel{' +
        ' videoId: $videoId,' +
        ' videoUrl: $videoUrl,' +
        ' thumbnailUrl: $thumbnailUrl,' +
        '}';
  }

  VideoModel copyWith({
    List<String>? videoId,
    List<String>? videoUrl,
    List<String>? thumbnailUrl,
  }) {
    return VideoModel(
      videoId: videoId ?? this.videoId,
      videoUrl: videoUrl ?? this.videoUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'videoId': this.videoId,
      'videoUrl': this.videoUrl,
      'thumbnailUrl': this.thumbnailUrl,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      videoId: map['videoId'] as List<String>,
      videoUrl: map['videoUrl'] as List<String>,
      thumbnailUrl: map['thumbnailUrl'] as List<String>,
    );
  }

//</editor-fold>
}
