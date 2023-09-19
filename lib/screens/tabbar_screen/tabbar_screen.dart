import 'package:flutter/material.dart';
import 'package:produckts/model/tabbar_model.dart';
import '../../services/tabbar_service.dart';


class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  final TabBarService _tabBarService = TabBarService();
  fifteen? _fifteenData;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final fifteenData = await _tabBarService.fetchFifteenData();
      setState(() {
        _fifteenData = fifteenData;
      });
    } catch (e) {
      // Handle error
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('TabBar Screen'),
          bottom: TabBar(
            tabs: [
              Tab(text: '15'),
              Tab(text: '22'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _fifteenData != null
                ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _fifteenData!.carts!
                    .expand((cart) => cart.products!)
                    .map((product) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2.0,
                      child: ListTile(
                        title: Text("Product Title: ${product.title}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Price: \$${product.price}"),
                            Text("Quantity: ${product.quantity}"),
                            Text("Total: \$${product.total}"),
                            // Add more product details here as needed
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
                : Center(child: CircularProgressIndicator()),
            Center(child: Text('Tab 22 Content')),
          ],
        ),
      ),
    );
  }
}
