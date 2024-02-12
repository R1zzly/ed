// import 'package:cwt_ecommerce_ui_kit/data/repository/auth_repo.dart';
// import 'package:cwt_ecommerce_ui_kit/data/repository/header_gen.dart';
// import 'package:cwt_ecommerce_ui_kit/data/repository/shop_repo.dart';
// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
//
// import '../features/shop/controllers/brand_controller.dart';
// import '../features/personalization/controllers/address_controller.dart';
// import '../features/personalization/controllers/user_controller.dart';
// import '../features/shop/controllers/cart_controller.dart';
// import '../features/shop/controllers/categories_controller.dart';
// import '../features/shop/controllers/checkout_controller.dart';
// import '../features/shop/controllers/product_controller.dart';
//
// class GeneralBindings extends Bindings {
//   @override
//   void dependencies() {
//     /// -- Product Controllers
//     Get.put(ProductController());
//     Get.put(CartController());
//     Get.put(CheckoutController());
//     Get.put(CategoryController());
//     //Get.put(BrandController());
//
//     /// -- User Controllers
//     Get.put(UserController());
//     Get.put(AddressController());
//
//     // Dependency
//     Get.lazyPut<Dio>(() => Dio());
//     Get.lazyPut<HeaderGen>(() => HeaderGen());
//     /// -- Other Controllers
//     Get.lazyPut<AuthRepo>(() => AuthRepoImpl(Get.find<Dio>(), Get.find<HeaderGen>()));
//     Get.lazyPut<ShopRepo>(() => ShopRepoImpl(Get.find<Dio>(),  Get.find<HeaderGen>()));
//   }
// }
