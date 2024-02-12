// import 'package:tgroupbuy/data/repository/header_gen.dart';
// import 'package:tgroupbuy/data/repository/auth_repo.dart';
// import 'package:tgroupbuy/data/repository/header_gen.dart';
// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
//
// // import '../features/shop/controllers/brand_controller.dart';
// // import '../features/personalization/controllers/address_controller.dart';
// // import '../features/personalization/controllers/user_controller.dart';
// // import '../features/shop/controllers/cart_controller.dart';
// // import '../features/shop/controllers/categories_controller.dart';
// // import '../features/shop/controllers/checkout_controller.dart';
// // import '../features/shop/controllers/product_controller.dart';
//
// class GeneralBindings extends Bindings {
//   @override
//   void dependencies() {
//     /// -- Product Controllers
//     //Get.put(ProductController());
//     //Get.put(CartController());
//     //Get.put(CheckoutController());
//     //Get.put(CategoryController());
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
