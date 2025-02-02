class Level {
  final int id;
  final String theme;
  final List<String> items;
  final List<String> correctItems;
  final String imageAsset; // Tambahkan field untuk gambar

  Level({
    required this.id,
    required this.theme,
    required this.items,
    required this.correctItems,
    required this.imageAsset, // Tambahkan parameter ke konstruktor
  });

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      id: json['id'],
      theme: json['theme'],
      items: List<String>.from(json['items']),
      correctItems: List<String>.from(json['correctItems']),
      imageAsset: json['imageAsset'], // Ambil gambar dari JSON
    );
  }
}