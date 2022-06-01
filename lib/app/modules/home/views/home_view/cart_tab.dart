import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:klik_daily/app/modules/home/controllers/cart_product_controller.dart';
import 'package:klik_daily/app/modules/home/controllers/home_controller.dart';
import 'package:klik_daily/app/ui/helper/ui_helper.dart';
import '../../../../ui/theme/app_colors.dart';
import '../../../../ui/widgets/cart_card_widget.dart';

class CartTab extends GetView<HomeController> {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              titleSpacing: 26,
              pinned: true,
              title: Text(
                'Cart Product',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              backgroundColor: Palette.primary,
              elevation: 0,
              toolbarHeight: 93,
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 38,
              ),
              sliver: Obx(
                () {
                  var cartItems = controller.cartItems;
                  if (cartItems.isEmpty) {
                    return SliverToBoxAdapter(
                      child: Container(
                        width: Get.width,
                        height: 186,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Palette.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'No item in cart',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF7D7777),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (cartItems.isEmpty) return SizedBox();
                        var cartItem = cartItems[index];
                        var now = Jiffy().valueOf().toString();
                        Get.lazyPut<CardProductController>(
                          () => CardProductController(
                            cardIndex: index,
                            defaultQuantity: cartItem.quantity ?? 1,
                          ),
                          tag: (cartItem.product?.name ?? index.toString()) +
                              now,
                        );
                        return CartCardWidget(
                          tag: (cartItem.product?.name ?? index.toString()) +
                              now,
                          isLast: index == cartItems.length - 1,
                          name: cartItem.product?.name ?? "",
                          imageUrl: cartItem.product?.imageUrl ?? "",
                          price: cartItem.product?.price ?? 0,
                          rating: cartItem.product?.rating ?? 1,
                          quantity: cartItem.quantity ?? 1,
                          onDelete: () {
                            controller.cartItems.removeAt(index);
                            controller.countCartItems();
                            controller.setCartLocalValue();
                          },
                        );
                      },
                      childCount: cartItems.length,
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: const SizedBox(
                height: 60,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 23,
            horizontal: 30,
          ),
          child: Obx(
            () => ElevatedButton(
              onPressed: controller.cartItems.isEmpty
                  ? null
                  : () {
                      controller.cartItems.clear();
                      controller.cartTotalItems.value = 0;
                      controller.cartTotalPrice.value = 0;
                    },
              style: ElevatedButton.styleFrom(
                primary: Palette.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: Size(
                  double.infinity,
                  59,
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.only(
                              bottom: 1,
                              right: 10,
                            ),
                            child: Text(
                              'Total ${controller.cartTotalItems.value} Items',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Text(
                            UIHelper.convertToIdr(
                                controller.cartTotalPrice.value),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Checkout',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
