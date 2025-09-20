import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/shoe.dart';

class Cart extends ChangeNotifier{
  //Shop cart
  List<Shoe> shoeShop = [
    Shoe(name: 'Nike air 1', price: '144', imagePath: 'lib/images/nike1.png', description: 'this is Nike air one'),
    Shoe(name: 'Nike air 2', price: '244', imagePath: 'lib/images/nike2.png', description: 'this is Nike air two'),
    Shoe(name: 'Nike air 3', price: '344', imagePath: 'lib/images/nike3.png', description: 'this is Nike air three'),
  ];

  //User cart
  List<Shoe> shoeUser = [];

  //get list of the shop
  List<Shoe> getShoeList(){
    return shoeShop;
  }

  //get list user cart
  List<Shoe> getUserCart(){
    return shoeUser;
  }
  
  //add item to cart
  void AddToCart(Shoe shoe){
    shoeUser.add(shoe);
    notifyListeners();
  }

  //remove item in cart
  void RemoveToCart(Shoe shoe){
    shoeUser.remove(shoe);
    notifyListeners();
  }
}