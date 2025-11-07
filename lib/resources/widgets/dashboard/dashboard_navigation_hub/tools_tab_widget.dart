import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/resources/pages/dashboard/items_page.dart';
import 'package:invoicefoxy_all/resources/widgets/layout/scaffold_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class _ToolsCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _ToolsCard({super.key, required this.title, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return ListTile(
          leading: const Icon(Icons.manage_accounts, color: Colors.black,),
          title: Text(this.title),
          tileColor: Colors.lightGreen.shade100,
          style: ListTileStyle.drawer,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
          ),
          onTap: this.onTap,
    );
    //return SizedBox(width: 300, height: 100, child: Center(child: Text(title)));
  }
}

class ToolsTab extends StatefulWidget {
  
  const ToolsTab({super.key});

  @override
  createState() => _ToolsTabState();
}

class _ToolsTabState extends NyState<ToolsTab> {

  @override
  get init => () {

  };

  @override
  Widget view(BuildContext context) {
    return ScaffoldWidget(
      title: Text("Tools"),
      body: NyListView.grid(
            child: (BuildContext context, dynamic data) {
                return data;
                // return ListTile(
                //   title: Text(data['title']),
                //   tileColor: Colors.red,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                // );
            },
            data: () async {
              return [
                  _ToolsCard(
                    title: "Manage Items",
                    onTap: () => routeTo(ItemsPage.path),
                  ),
              ];
                // return [
                //     {"title": "Items"},
                //     {"title": "Go to the airport"},
                //     {"title": "Buy new shoes"},
                //     {"title": "Go shopping"},
                //     {"title": "Find my keys"}
                // ];
            },
            crossAxisCount: 1, // The number of rows in the grid
            // mainAxisSpacing: 1.0, // The mainAxis spacing
            // crossAxisSpacing: 1.0, // The crossAxisSpacing
        )
    );
  }
}
