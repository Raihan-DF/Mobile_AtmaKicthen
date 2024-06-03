import 'package:flutter/material.dart';
import 'package:atmakitchen/service/produk_client.dart';
import 'package:atmakitchen/service/produkTitipan_client.dart';
import 'package:atmakitchen/models/product.dart';
import 'package:atmakitchen/models/product_titipan.dart';
import 'package:atmakitchen/view/RegulerProduk.dart';
import 'package:atmakitchen/view/ProdukTitipan.dart';

class HomeViewCustomer extends StatefulWidget {
  @override
  _HomeViewCustomerState createState() => _HomeViewCustomerState();
}

class _HomeViewCustomerState extends State<HomeViewCustomer> {
  late Future<List<Product>> futureProducts;
  late Future<List<ProductTitipan>> futureTitipanProducts;
  late List<Product> allProducts = [];
  late List<ProductTitipan> allTitipanProducts = [];
  late List<Product> filteredProducts = [];
  late List<ProductTitipan> filteredTitipanProducts = [];
  String selectedFilter = 'Produk';

  @override
  void initState() {
    super.initState();
    futureProducts = Produk_Client().fetchProducts();
    futureTitipanProducts = ProdukTitipan_Client().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Produk'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = 'Produk';
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: selectedFilter == 'Produk'
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Produk',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = 'Titipan';
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: selectedFilter == 'Titipan'
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Titipan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: selectedFilter == 'Produk'
                    ? FutureBuilder<List<Product>>(
                        future: futureProducts,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Gagal memuat produk'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(
                                child: Text('Tidak ada produk tersedia'));
                          } else {
                            allProducts = snapshot.data!;
                            return RegularProductWidget(allProducts);
                          }
                        },
                      )
                    : FutureBuilder<List<ProductTitipan>>(
                        future: futureTitipanProducts,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Gagal memuat produk'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(
                                child:
                                    Text('Tidak ada produk titipan tersedia'));
                          } else {
                            allTitipanProducts = snapshot.data!;
                            return TitipanProductWidget(allTitipanProducts);
                          }
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
