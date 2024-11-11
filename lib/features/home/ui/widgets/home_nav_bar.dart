import 'package:dalel/core/theming/app_images.dart';
import 'package:dalel/features/cart/views/cart_view.dart';
import 'package:dalel/features/home/home_view.dart';
import 'package:dalel/features/profile/views/profile_view.dart';
import 'package:dalel/features/search/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

final PersistentTabController controller =
    PersistentTabController(initialIndex: 0);

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeView(),
    const CartView(),
    const SearchView(),
    const ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Image.asset(AppImages.imagesHome),
      inactiveIcon: Image.asset(AppImages.imagesHomeInactive),
      title: ("Home"),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: Image.asset(AppImages.imagesShoppingCart),
      icon: Image.asset(AppImages.imagesShoppingCartActive),
      title: ("cart"),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: Image.asset(AppImages.imagesSearch),
      icon: Image.asset(AppImages.imagesSearchActive),
      title: ("search"),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: Image.asset(AppImages.imagesPerson),
      icon: Image.asset(AppImages.imagesPersonActive),
      title: ("profile"),
    ),
  ];
}
