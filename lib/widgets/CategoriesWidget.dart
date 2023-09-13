import 'package:click_n_ship/models/Category.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                setState(() {
                if (categories[index].selected){
                  categories[index].selected = false ;

                }else{
                  categories[index].selected = true ;
                }
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: categories[index].selected ?  Colors.grey.shade400:Colors.white, //Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        categories[index].imageurl,
                      ),
                      width: 40,
                      height: 40,
                    ),
                    Text(
                      categories[index].title,
                      style: const TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF355291),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  getcolor() {
    if (!selected) {
      return Colors.white;
    } else {
      return Colors.grey.shade400;
    }
  }
}
