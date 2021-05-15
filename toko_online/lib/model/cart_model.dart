import 'package:flutter/material.dart';

class CartItem{
  String name;
  String imageAsset;
  String size;
  double total;

  CartItem({
    this.name,
    this.imageAsset,
    this.size,
    this.total
  });
}

var cartList=[];