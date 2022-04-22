import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../models/cart.dart';
import '../models/cart_item.dart';
import '../models/food.dart';

class CartProvider extends ChangeNotifier {
  List<Food> foods = [
    Food(
      id: 101,
      name: "Akara, Pap, Milk And Sugar",
      image: "akara.png",
      amount: 30.00,
      color: Colors.orangeAccent,
    ),
    Food(
      id: 102,
      name: "Boiled Yam, Chicken Stew (Chicken Cooked In Stew)",
      image: "yam.png",
      amount: 10.00,
      color: Colors.redAccent,
    ),
    Food(
      id: 103,
      name: "Plain Spaghetti, Croaker Fish Stew, Fried Plantain Side",
      image: "noodles.png",
      amount: 15.00,
      color: Colors.greenAccent,
    ),
  ];

  final Cart _cart = Cart(items: []);
  Cart get cart => _cart;

  removeItemFromCart({required CartItem item}) {
    CartItem? it = cart.items!.firstWhereOrNull(
      (el) => el.food.id == item.food.id,
    );

    if (it != null) {
      cart.items!.remove(it);
      notifyListeners();
    }
  }

  increaseItemInCart({required dynamic item}) {
    if (item is CartItem) {
      cart.add(item);
    } else {
      cart.add(CartItem(food: item));
    }
    notifyListeners();
  }

  decreaseItemInCart({required CartItem item}) {
    CartItem? it = cart.items!.firstWhereOrNull(
      (el) => el.food.id == item.food.id,
    );

    if (it != null) {
      if (it.quantity > 1) {
        --it.quantity;
      } else {
        cart.items!.remove(it);
      }
      notifyListeners();
    }
  }
}
