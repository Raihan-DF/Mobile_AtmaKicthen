import 'package:flutter/material.dart';
import 'package:atmakitchen/view/homeViewCustomer.dart';

class HomeViewGuest extends StatefulWidget {
  @override
  _HomeViewGuestState createState() => _HomeViewGuestState();
}

class _HomeViewGuestState extends State<HomeViewGuest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Atma Kitchen Bakery',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Atma Kitchen is your one-stop shop for delicious baked goods. We offer a wide variety of breads, pastries, and cakes made from the finest ingredients. Our skilled bakers ensure that every bite is a delight.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Produk',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ProductImageWidget(
                          imagePath: 'assets/images/hampers.png',
                          name: 'Hampers'),
                      ProductImageWidget(
                          imagePath: 'assets/images/lapisSurabaya.png',
                          name: 'Lapis Surabaya'),
                      ProductImageWidget(
                          imagePath: 'assets/images/kuePanggang.png',
                          name: 'Kue Panggang'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Produk Titipan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ProductImageWidget(
                          imagePath: 'assets/images/notFound.png',
                          name: 'Titipan 1'),
                      ProductImageWidget(
                          imagePath: 'assets/images/notFound.png',
                          name: 'Titipan 2'),
                      ProductImageWidget(
                          imagePath: 'assets/images/notFound.png',
                          name: 'Titipan 3'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Phone: +62 123 4567 890',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Email: info@atmakitchen.com',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Address: Jl. Merdeka No. 123, Jakarta',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductImageWidget extends StatelessWidget {
  final String imagePath;
  final String name;

  ProductImageWidget({required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeViewCustomer(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 5),
            Text(
              name,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
