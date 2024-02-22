import 'package:dio/dio.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tgroupbuy/data/models/product.dart';
import 'package:tgroupbuy/data/repository/header_gen.dart';
import 'package:tgroupbuy/data/repository/shop_repo.dart';
import 'package:tgroupbuy/provider/user_provider.dart';





class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }
    final user = Provider.of<UserProvider>(context, listen: true).user;
    return  FutureBuilder(
      future: ShopRepoImpl(Dio(), HeaderGen()).getCart(token: user.token, userId: user.id),
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(snapshot.hasError ) {
          return Text(snapshot.error.toString());
        }
        final cart = snapshot.requireData;
     int total = 0;

      for (var element in cart) {
       total += element.price;
     }
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           if (total != 0) Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: Text(
                'Below are the items in your cart.',
                style: FlutterFlowTheme.of(context).labelMedium,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: cart.isEmpty ? Center(
                 child: Text('No items in cart'),
                ) :
                                  ListView.builder(
                                    itemCount: cart.length,
                                    itemBuilder: (context, index) {
                                       return  Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x320E151B),
                                            offset: Offset(0, 1),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(12, 8, 8, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Hero(
                                              tag: 'ControllerImage',
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                // 'https://static.nike.com/a/images/t_prod_ss/w_640,c_limit,f_auto/95c8dcbe-3d3f-46a9-9887-43161ef949c5/sleepers-of-the-week-release-date.jpg'
                                                child: Image.network(
                                                 cart[index].image ,
                                                  width: 80,
                                                  height: 80,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 8),
                                                    child: Text(
                                                      cart[index].name,
                                                      style:
                                                      FlutterFlowTheme.of(context)
                                                          .titleLarge,
                                                    ),
                                                  ),
                                                  Text(
                                                    '\$${cart[index].price}',
                                                    style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 8, 0, 0),
                                                    child: Text(
                                                      'Quanity: 1',
                                                      style:
                                                      FlutterFlowTheme.of(context)
                                                          .labelSmall,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 40,
                                              icon: Icon(
                                                Icons.delete_outline_rounded,
                                                color:
                                                FlutterFlowTheme.of(context).error,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                  
                                    }
                                    ),
              ),
            ),
            if (total != 0)Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(24, 4, 24, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Total',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium,
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 36,
                            icon: Icon(
                              Icons.info_outlined,
                              color: Color(0xFF57636C),
                              size: 18,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ],
                      ),
                      Text(
                        '\$$total',
                        style:
                        FlutterFlowTheme.of(context).displaySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (total != 0) Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x320E151B),
                    offset: Offset(0, -2),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Text(
                'Checkout (\$$total)',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleMedium,
              ),
            ),
          ],
        );
      }
    );
  }
}
