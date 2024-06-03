import 'package:flutter/material.dart';
import 'package:atmakitchen/models/product.dart';
import 'package:atmakitchen/service/produk_client.dart';
import 'package:atmakitchen/models/product_titipan.dart';
import 'package:atmakitchen/service/produkTitipan_client.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool isLoading = false;
  // List<Pegawai> listPegawai = [];
  List<Product> listProduk = [];

  void handleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void handleData() {
    handleLoading();
    Produk_Client().fetchProducts().then((value) {
      print("value: ${value.length}");
      listProduk = value;
      handleLoading();
    }).catchError((err) {
      print(err);
    });
  }

  // void handleDataProduk() {
  //   handleLoading();
  //   ProdukClient.fetchAll().then((value) {
  //     print("value: ${value.length}");
  //     listProduk = value;
  //     handleLoading();
  //   }).catchError((err) {
  //     print(err);
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    // handleData();
    handleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Test API"),
          onPressed: () {
            handleData();
          },
        ),
      ),
    );
  }
}
