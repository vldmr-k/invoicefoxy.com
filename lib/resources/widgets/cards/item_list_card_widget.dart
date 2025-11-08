import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/item.dart';

class ItemListCardWidget extends StatelessWidget {
  const ItemListCardWidget({super.key, required this.item, this.onTap});

  final Item item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      onTap: onTap
    );
  }
}