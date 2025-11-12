import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/document.dart';
import 'package:invoicefoxy_all/app/models/item.dart';

class DocumentListCardWidget extends StatelessWidget {
  const DocumentListCardWidget({super.key, required this.document, this.onTap});

  final Document document;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(document.number),
      subtitle: Text(document.number),
      trailing: Text("${document.totalAmount}"),
      contentPadding: EdgeInsets.all(0),
      onTap: onTap
    );
  }
}