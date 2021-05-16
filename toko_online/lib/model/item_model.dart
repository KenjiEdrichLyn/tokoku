import 'package:flutter/material.dart';
// CATATAN: disini saya hardcode data dan tidak dimasukkan kedalam sql
class ProductItem {
  String name;
  String type;
  String detail;
  double price;
  bool isLiked;
  int discount;
  String photoAsset;
  List<Color> color;
  double rating;
  int id;

  ProductItem({
      this.name,
      this.type,
      this.detail,
      this.price,
      this.isLiked,
      this.discount,
      this.photoAsset,
      this.color,
      this.rating,
      this.id,
  });
}

// -- HARDCODE DATA --
var itemList = [
  ProductItem(
      name: "Nike Air Max 20",
      type: "Sneakers",
      detail: "Nothing as fly, nothing as comfortable, nothing as proven",
      price: 240.00,
      isLiked: false,
      discount: 0,
      photoAsset: "images/shoe1.jpg",
      color: [Colors.yellow, Colors.redAccent, Colors.cyan[900]],
      rating: 2.1,
      id: 0
  ),
  ProductItem(
      name: "Nike Air Max 95 SE",
      type: "Sneakers",
      detail: "Visible Air in the heel and forefoot cushions every step.",
      price: 320.00,
      isLiked: false,
      discount: 0,
      photoAsset: "images/shoe2.jpg",
      color: [Colors.purpleAccent, Colors.redAccent, Colors.blue],
      rating: 4,
      id: 1
  ),
  ProductItem(
      name: "Nike Air Force 1",
      type: "Sneakers",
      detail: "A natural twist on a classic we all know and love.",
      price: 100.00,
      isLiked: false,
      discount: 10,
      photoAsset: "images/shoe3.jpg",
      color: [Colors.yellowAccent,Colors.lightBlue],
      rating: 3.2,
      id: 2
  ),
  ProductItem(
      name: "Nike Waffle One",
      type: "Sneakers",
      detail: "Clean colours and the perfect amount of flash to make you shine.",
      price: 120.00,
      isLiked: false,
      discount: 25,
      photoAsset: "images/shoe4.jpg",
      color: [Colors.black],
      rating: 4.6,
      id: 3
  ),
  ProductItem(
      name: "Nike Air Max 90 SE",
      type: "Sneakers",
      detail: "One that only he could have imagined and one that the world may never understand.",
      price: 150.00,
      isLiked: false,
      discount: 50,
      photoAsset: "images/shoe5.jpg",
      color: [Colors.black, Colors.yellowAccent],
      rating: 5,
      id: 4
  ),
];

var watchList=[
  ProductItem(
      name: "Nike Watch Waffle",
      type: "Watch",
      detail: "One that only he could have imagined and one that the world may never understand.",
      price: 150.00,
      isLiked: false,
      discount: 40,
      photoAsset: "images/watch1.jpg",
      color: [Colors.greenAccent, Colors.yellowAccent],
      rating: 3.6,
      id: 0
  ),
  ProductItem(
      name: "Nike Watch SE2",
      type: "Watch",
      detail: "One that only he could have imagined and one that the world may never understand.",
      price: 220.00,
      isLiked: false,
      discount: 25,
      photoAsset: "images/watch2.jpg",
      color: [Colors.black, Colors.grey],
      rating: 4.7,
      id: 1
  ),
  ProductItem(
      name: "Nike Watch 2+",
      type: "Watch",
      detail: "One that only he could have imagined and one that the world may never understand.",
      price: 320.00,
      isLiked: false,
      discount: 20,
      photoAsset: "images/watch3.jpg",
      color: [Colors.blue, Colors.yellowAccent, Colors.red],
      rating: 2.2,
      id: 2
  ),
];

var backpackList=[
  ProductItem(
      name: "Nike Brasilia Backpack",
      type: "Backpack",
      detail: "One that only he could have imagined and one that the world may never understand.",
      price: 97.00,
      isLiked: false,
      discount: 30,
      photoAsset: "images/bag1.jpg",
      color: [Colors.blue, Colors.yellowAccent, Colors.red],
      rating: 2.2,
      id: 0
  ),
  ProductItem(
      name: "Nike Sporstwear",
      type: "Backpack",
      detail: "One that only he could have imagined",
      price: 120.00,
      isLiked: false,
      discount: 0,
      photoAsset: "images/bag2.jpg",
      color: [Colors.blue, Colors.yellowAccent, Colors.red],
      rating: 2.2,
      id: 1
  ),
  ProductItem(
      name: "Nike Watch 2+",
      type: "Backpack",
      detail: "One that only he could have imagined",
      price: 78.00,
      isLiked: false,
      discount: 10,
      photoAsset: "images/bag3.jpg",
      color: [Colors.blue, Colors.yellowAccent, Colors.red],
      rating: 2.2,
      id: 2
  ),
  ProductItem(
      name: "Nike 2.0 Print",
      type: "Backpack",
      detail: "One that only he could have imagined",
      price: 54.00,
      isLiked: false,
      discount: 0,
      photoAsset: "images/bag4.jpg",
      color: [Colors.blue, Colors.yellowAccent, Colors.red],
      rating: 2.2,
      id: 3
  ),
];