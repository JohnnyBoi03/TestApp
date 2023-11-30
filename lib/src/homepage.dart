import 'package:api_test_app/src/controller/product_controller.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Products',
          ),
        ),
      ),
      body: Scrollbar(
        radius: Radius.circular(15),
        thickness: 10,
        //interactive: true,
        child: FutureBuilder(
          future: ProductController().getProducts(),
          builder: (context, snapshot) {
            snapshot.data;
      
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
      
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(products[index].title, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      Text(products[index].description)
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
