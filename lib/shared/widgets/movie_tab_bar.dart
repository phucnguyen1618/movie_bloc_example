import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';

class MovieTabBar extends StatefulWidget {
  final String firstText;
  final String lastText;
  final Function() onTapTabBar;

  const MovieTabBar({
    Key? key,
    required this.firstText,
    required this.lastText, required this.onTapTabBar,
  }) : super(key: key);

  @override
  State<MovieTabBar> createState() => _MovieTabBarState();
}

class _MovieTabBarState extends State<MovieTabBar> with SingleTickerProviderStateMixin {
  int indexSelected = 0;

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController?.addListener(() {
      widget.onTapTabBar();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: SegmentedTabControl(
          backgroundColor: Colors.grey.shade300,
          indicatorColor: Colors.grey.shade300,
          tabTextColor: Colors.black45,
          controller: tabController,
          selectedTabTextColor: Colors.white,
          tabs: [
            SegmentTab(
              label: widget.firstText,
              color: Colors.teal.shade900,
            ),
            SegmentTab(
              label: widget.lastText,
              color: Colors.teal.shade900,
            ),
          ],
        ),
      ),
    );
  }
}
