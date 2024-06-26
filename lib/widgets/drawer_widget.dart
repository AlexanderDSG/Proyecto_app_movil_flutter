import 'package:flutter/material.dart';
import 'package:myapp/routes/app_routes.dart';
import 'package:myapp/widgets/custom_title_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      height: double.infinity,
      decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
      child: Column(
        children: [
          const SizedBox(height: 35),
          const Text("Menu"),
          CustomTitleWidget(
            lead: Icons.home,
            label: "Home",
            routes: AppRoutes.home,
          ),
          CustomTitleWidget(
            lead: Icons.document_scanner_outlined,
            label: "List",
            routes: AppRoutes.productListView,
          ),
          CustomTitleWidget(
            lead: Icons.add_circle_outline,
            label: "Create",
            routes: AppRoutes.createUpdate,
          ),
        ],
      ),
    );
  }
}
