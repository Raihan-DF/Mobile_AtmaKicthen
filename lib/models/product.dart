class Product {
  final int id;
  final String name;
  final String type;
  final double price;
  final String imageUrl;
  final String status;

  Product({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.imageUrl,
    required this.status,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id_produk'],
      name: json['nama_produk'],
      type: json['jenis_produk'],
      price: json['harga'].toDouble(),
      imageUrl: json['gambar_produk'],
      status: json['status_produk'],
    );
  }
}
