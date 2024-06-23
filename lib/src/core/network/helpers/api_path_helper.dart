class ApiPathHelper {
  const ApiPathHelper._();
  static String products(ProductsPath path, {int? id, String? slug}) {
    const base = 'product/';
    switch (path) {
      case ProductsPath.base:
        return base;
      case ProductsPath.byId:
        return '$base$id/';
      case ProductsPath.bySlug:
        return '$base$slug/';
    }
  }

  static String category(CategoriesPath path, {int? id, String? slug}) {
    const base = 'category/';
    switch (path) {
      case CategoriesPath.base:
        return base;
      case CategoriesPath.byId:
        return '$base$id/';
      case CategoriesPath.bySlug:
        return '$base$slug/';
    }
  }

  static String brand(BrandsPath path, {int? id, String? slug}) {
    const base = 'brand/';
    switch (path) {
      case BrandsPath.base:
        return base;
    }
  }

  static String favorites(FavoritesPath path, [int? id]) {
    const base = 'favourite/';
    switch (path) {
      case FavoritesPath.base:
        return base;
      case FavoritesPath.byId:
        return '$base$id/';
    }
  }

  static String auth(AuthPath path, {String? id}) {
    const base = 'auth';
    switch (path) {
      case AuthPath.base:
        return '$base/';
      case AuthPath.account:
        return '$base/account/';
      case AuthPath.register:
        return '$base/register/';
      case AuthPath.address:
        return '$base/address/';
      case AuthPath.addressById:
        return '$base/address/$id/';
    }
  }

  static String cart(CartPath path, {String? uuid, String? id}) {
    const base = 'basket';
    switch (path) {
      case CartPath.create:
        return '$base/create/';
      case CartPath.getBasketByUUID:
        return '$base/$uuid/';
      case CartPath.addItemToBasket:
        return '$base/item/$uuid/';
      case CartPath.updateItem:
        return '$base/update-item/$id/';
      case CartPath.deleteItem:
        return '$base/delete-item/$id/';
    }
  }

  static String checkout(CheckoutPath path, {int? id}) {
    switch (path) {
      case CheckoutPath.base:
        return 'checkout/';
      case CheckoutPath.byId:
        return 'checkout/$id/';
      case CheckoutPath.checkoutTypes:
        return 'checkout-types/';
    }
  }
}

enum ProductsPath {
  base,
  byId,
  bySlug,
}

enum CategoriesPath {
  base,
  byId,
  bySlug,
}

enum BrandsPath { base }

enum AuthPath {
  base,
  register,
  address,
  addressById,
  account,
}

enum CartPath {
  // base,
  create,
  getBasketByUUID,
  updateItem,
  deleteItem,
  addItemToBasket,
}

enum FavoritesPath { base, byId }

enum CheckoutPath {
  base,
  checkoutTypes,
  byId,
}
