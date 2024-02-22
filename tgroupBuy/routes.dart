import 'package:flutter/material.dart';
import 'package:tgroupbuy/widgets/cart.dart';
import 'package:tgroupbuy/widgets/profile.dart';
import 'package:tgroupbuy/widgets/simpleHomePage.dart';

Route onGenerateRoutes(RouteSettings settings) {
  switch (settings.name ){
    case '/home':
      return MaterialPageRoute(
            builder: (context) {
              return SHomePageWidget();
            },
          );
    case '/profile': 
    return MaterialPageRoute(
            builder: (context) {
              return ProfileWidget();
            },
          );
    case '/cart': 
    return MaterialPageRoute(
            builder: (context) {
              return CartWidget();
            },
          );

          default: 
          return MaterialPageRoute(
            builder: (context) {
              return SHomePageWidget();
            },
          );
  }
}