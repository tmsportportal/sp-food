import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sportportal_food/src/utils/show_snack_helper.dart';
import '../features/favorites/controller/favorites_controller.dart';
import '../features/product/data/dto/product_list_dto.dart';

class LikeButton extends StatefulWidget {
  final ProductListDto product;

  const LikeButton({super.key, required this.product});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  final favoritesController = GetIt.instance<FavoritesController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return IconButton(
          onPressed: () {
            if (!favoritesController.favoriteProducts
                .containsKey(widget.product.id)) {
              favoritesController.addToFavorites(
                widget.product.id,
                widget.product,
                unauthorizedCallback: () {
                  ShowSnackHelper.showSnack(context, SnackStatus.message,
                      'Login or register to add product to favorite');
                },
                successCallback: () {
                  ShowSnackHelper.showSnack(context, SnackStatus.success,
                      'Successfully added to wishlist');
                },
                errorCallback: () {
                  ShowSnackHelper.showSnack(context, SnackStatus.error,
                      'Error add product to wishlist');
                },
              );
            } else {
              favoritesController.removeFromFavorites(
                widget.product.id,
                unauthorizedCallback: () {
                  ShowSnackHelper.showSnack(context, SnackStatus.message,
                      'Login or register to add product to favorite');
                },
                successCallback: () {
                  ShowSnackHelper.showSnack(context, SnackStatus.warning,
                      'Successfully removed from wishlist');
                },
                errorCallback: () {
                  ShowSnackHelper.showSnack(context, SnackStatus.error,
                      'Error add product to wishlist');
                },
              );
            }
          },
          color: Colors.red,
          isSelected: favoritesController.favoriteProducts
              .containsKey(widget.product.id),
          selectedIcon: const Icon(CupertinoIcons.heart_fill),
          icon: const Icon(CupertinoIcons.heart),
        );
      },
    );
  }
}
