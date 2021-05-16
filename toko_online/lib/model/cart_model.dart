import 'package:flutter/material.dart';

class CartItem{
  String name;
  String imageAsset;
  String size;
  double total;
  Color color;
  int discount;

  CartItem({
    this.name,
    this.imageAsset,
    this.size,
    this.total,
    this.color,
    this.discount
  });
}

var cartList=[];