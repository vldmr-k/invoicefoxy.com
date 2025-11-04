import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class InvoicesTab extends StatefulWidget {
  
  const InvoicesTab({super.key});

  @override
  createState() => _InvoicesTabState();
}

class _InvoicesTabState extends NyState<InvoicesTab> {

  @override
  get init => () {

  };

  @override
  Widget view(BuildContext context) {
    return Container(
      child: Text("Invoices"),
    );
  }
}
