import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/app/models/customer.dart';

class CustomerListCardWidget extends StatelessWidget {
  const CustomerListCardWidget({super.key, required this.customer, this.onTap});

  final Customer customer;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(customer.name),
      onTap: onTap
    );
  }
}
