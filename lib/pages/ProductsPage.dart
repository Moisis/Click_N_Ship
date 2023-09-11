
import 'package:click_n_ship/widgets/BackgroundTab.dart';
import 'package:click_n_ship/widgets/ItemWidget.dart';
import 'package:flutter/material.dart';

import '../widgets/CategoriesWidget.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});


  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {


  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      BackgroundTab(childwiget:
         Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: 50,
                      width: 250,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Here .. ',
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.search)
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: const Text(
                  'Categories',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF355291)),
                ),
              ),
              CategoriesWidget(),
              const SizedBox(height: 30),
                 SingleChildScrollView(child: Item_Widget()),
            ],
          ),
      ),
    ]);
  }
}
