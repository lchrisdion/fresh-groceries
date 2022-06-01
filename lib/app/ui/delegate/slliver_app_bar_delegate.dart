import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({this.tabBar});

  final PreferredSize? tabBar;

  @override
  double get minExtent => tabBar!.preferredSize.height;
  @override
  double get maxExtent => tabBar!.preferredSize.height;
  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return OverflowBox(
      alignment: Alignment.topCenter,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
