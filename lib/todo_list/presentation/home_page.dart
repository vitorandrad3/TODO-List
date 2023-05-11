import 'package:flutter/material.dart';
import '../../global/presentation/custom_drawer.dart';
import 'widgets/custom_floating_action_button.dart';
import 'widgets/custom_sliver_app_bar.dart';
import 'widgets/custom_sliver_items.dart';
import 'widgets/custom_sliver_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CustomDrawer(),
      floatingActionButton: CustomFloatingActionButton(),
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          CustomSliverSearchBar(),
          CustomSliverItems(),
        ],
      ),
    );
  }
}
