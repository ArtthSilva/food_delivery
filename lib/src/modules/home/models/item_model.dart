import 'package:flutter/material.dart';

 class ItemModel {
  final Icon icon;
  final Text title;
  final Function() onSelected;

  ItemModel({required this.icon, required this.title, required this.onSelected});
}
