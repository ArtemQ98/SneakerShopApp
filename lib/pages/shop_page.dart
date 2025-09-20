import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/shoe_tile.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/shoe.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  TextEditingController searchController = new TextEditingController();

  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen: false).AddToCart(shoe);
    showDialog(
      context: context,
      builder:(context) => AlertDialog(
        title: Text("Successfully added: "),
        content: Text('Check your cart'),
      ),);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder:(context, value, child) => Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black87,
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: "Search...",
              hintStyle: TextStyle(
          
              ),
            ),
            controller: searchController,
          ),
        ),
        Padding(
          padding: const EdgeInsetsGeometry.symmetric(vertical: 10.0),
          child: Text("everyone flies.. some fly longer than others", style: TextStyle(color: Colors.grey[600]),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Hot picks 🔥", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              Text('See all', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),)
            ],
          ),
        ),
        SizedBox(height: 25,),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index){
              Shoe shoe1 = value.getShoeList()[index];
              return ShoeTile(
                shoe: shoe1,
                onTap: () => addShoeToCart(shoe1),
                );
            },)
          ),
          Padding(padding: EdgeInsetsGeometry.only(top: 40.0, left: 25.0, right: 25.0))
      ],
    ),);
  }
}