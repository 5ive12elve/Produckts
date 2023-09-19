import 'package:flutter/material.dart';
import 'package:produckts/model/product_model.dart';
import '../details_screen/details_screen.dart';
import 'controller/product_controller.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductController _productController = ProductController();
  late Future<product_model?> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = _productController.getProducts();
  }

  // Create a method to navigate to the DetailsScreen
  void _navigateToDetailsScreen(Products product) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailsScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      backgroundColor: Colors.black, // Set the background color to black
      body: FutureBuilder<product_model?>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null || snapshot.data!.products == null) {
            return Center(child: Text('No products available.'));
          } else {
            final products = snapshot.data!.products;
            // Build your UI using the 'products' data.
            return ListView.builder(
              itemCount: products?.length,
              itemBuilder: (context, index) {
                final product = products?[index];
                return ListTile(
                  title: Text(
                    product?.title ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.w400, // Make the title bold
                      color: Colors.white, // Set the text color to white
                    ),
                  ),
                  onTap: () {
                    // Call the navigation method when a product is tapped
                    _navigateToDetailsScreen(product!);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
