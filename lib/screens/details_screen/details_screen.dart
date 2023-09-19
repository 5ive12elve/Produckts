import 'package:flutter/material.dart';
import 'package:produckts/model/product_model.dart';

class DetailsScreen extends StatelessWidget {
  final Products product;

  DetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 400, // Adjust the height as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(product.thumbnail ?? ''),
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16.0), // Add left padding
            child: Text(
              'Title: ${product.title ?? ''}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 16.0), // Add left padding
            child: Text(
              'Description: ${product.description ?? ''}',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 16.0), // Add left padding
            child: Text(
              'Price: \$${product.price ?? ''}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.orangeAccent,
              ),
            ),
          ),
          // Add more product details as needed
        ],
      ),
    );
  }
}
