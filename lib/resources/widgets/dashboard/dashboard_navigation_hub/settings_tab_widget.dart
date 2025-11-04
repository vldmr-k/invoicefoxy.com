import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class SettingsTab extends StatefulWidget {
  
  const SettingsTab({super.key});

  @override
  createState() => _SettingsTabState();
}

class _SettingsTabState extends NyState<SettingsTab> {

  @override
  get init => () {

  };

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings")
      ),
      body: SafeArea(
         child: Container(
          child: Column(
            children: [
              Text("Welcome to InvoiceFoxy"),
            ],
          ),
         ),
      ),
    );
  }
}
