class ProductTitipan {
  final int id;
  final String name;
  final int stock;
  final double price;
  final String imageUrl;

  ProductTitipan({
    required this.id,
    required this.name,
    required this.stock,
    required this.price,
    required this.imageUrl,
  });

  factory ProductTitipan.fromJson(Map<String, dynamic> json) {
    return ProductTitipan(
      id: json['id_produk_titipan'],
      name: json['nama_produk_titipan'],
      stock: json['jumlah_titipan'],
      price: json['harga_produk_titipan'].toDouble(),
      imageUrl: json['gambar_produk_titipan'] ?? '-',
    );
  }
}
