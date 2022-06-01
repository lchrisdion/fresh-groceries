import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../ui/delegate/slliver_app_bar_delegate.dart';
import '../../../../ui/widgets/home_product_card_widget.dart';
import '../../controllers/home_controller.dart';
import 'home_tab/home_category_tab_list.dart';
import 'home_tab/home_flexible_appbar.dart';
import 'home_tab/home_search_text_field.dart';

class HomeTab extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 80,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            titlePadding: const EdgeInsets.symmetric(
              horizontal: 35.0,
              vertical: 15,
            ),
            expandedTitleScale: 1.0,
            stretchModes: [StretchMode.blurBackground],
            title: const HomeFlexibleAppBar(),
          ),
          expandedHeight: 168,
        ),
        SliverToBoxAdapter(
          child: const HomeSearchTextField(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
            ),
            child: Text(
              'Categories',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverAppBarDelegate(
            tabBar: PreferredSize(
              preferredSize: Size.fromHeight(87),
              child: HomeCategoryTabList(),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
          ),
          sliver: Obx(
            () {
              if (controller.productTypeList.isEmpty)
                return SliverToBoxAdapter(child: SizedBox());
              var productList = controller
                  .productTypeList[controller.selectedCategory.value].products;
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (productList!.isEmpty) return SizedBox();
                    var product = productList[index];
                    return HomeProductCardWidget(
                      isLast: index == productList.length-1,
                      name: product.name ?? "",
                      imageUrl: product.imageUrl ?? "",
                      price: product.price ?? 0,
                      rating: product.rating ?? 1,
                      onTap: () {
                        controller.addToCart(product);
                      },
                    );
                  },
                  childCount: productList?.length ?? 0,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
