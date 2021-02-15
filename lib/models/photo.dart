class Photo {
  final String urlRegular;
  final String urlSmall;
  final String description;
  final String authorName;

  Photo({
    this.urlRegular,
    this.urlSmall,
    this.description,
    this.authorName,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
      urlRegular: json['urls']['regular'],
      urlSmall: json['urls']['small'],
      description: json['description'] ?? 'This photo has no description',
      authorName: json['user']['name']);
}
