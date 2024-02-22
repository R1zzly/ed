import 'package:dio/dio.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:tgroupbuy/common/error/exceptions.dart';
import 'package:tgroupbuy/data/models/product.dart';
import 'package:tgroupbuy/data/repository/header_gen.dart';
import 'package:tgroupbuy/data/repository/shop_repo.dart';
import 'package:tgroupbuy/provider/user_provider.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key, required this.product});
  final Product product;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget>
    with TickerProviderStateMixin {
      bool isLoading =false;

  String toTitleCase(String text) {
  return text.split(' ').map((word) {
    if (word.isNotEmpty) {
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }
    return '';
  }).join(' ');
  }

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(2, 2),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(0, 70),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(0, 270),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(0.5, 0.5),
          end: const Offset(1, 1),
        ),
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0.2,
          end: 0,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 500.ms,
          duration: 400.ms,
          begin: const Offset(0, 120),
          end: const Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 400.ms,
          begin: const Offset(0, 40),
          end: const Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 400.ms,
          begin: const Offset(0, 40),
          end: const Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 400.ms,
          begin: const Offset(0, 40),
          end: const Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'stackOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1200.ms,
          duration: 400.ms,
          begin: const Offset(0, 40),
          end: const Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1200.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 1200.ms,
          duration: 400.ms,
          begin: const Offset(0.6, 0.6),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'stackOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1400.ms,
          duration: 400.ms,
          begin: const Offset(0, 40),
          end: const Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1400.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 1400.ms,
          duration: 400.ms,
          begin: const Offset(0.6, 0.6),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'stackOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1600.ms,
          duration: 400.ms,
          begin: const Offset(0, 40),
          end: const Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1600.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 1600.ms,
          duration: 400.ms,
          begin: const Offset(0.6, 0.6),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 900.ms,
          duration: 400.ms,
          begin: const Offset(0.8, 0.8),
          end: const Offset(1, 1),
        ),
      ],
    ),
  };
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

    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation1']!),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 130, 0, 0),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation2']!),
            ),
        
            // This image is pretty cool i'm trying to add this multi-line code and all sorts of cool stuff.
            Align(
              alignment: const AlignmentDirectional(0, -1),
              child: Image.network(
                widget.product.image,
                fit: BoxFit.cover,
                width: 300,
                height: 300,
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 320, 0, 0),
                child: ListView(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Text(
                        widget.product.name,
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation1']!),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                      child: Text(
                        'Aspiring players can always rely on their Lebron Vitness VI basketball shoes for ultimate comfort. Lightweight and breathable, with flexible forefoot grooves and a plastic clip around the heel for extra stability, this slam dunkin\' pair will make you stand out on or off the court.',
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation2']!),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8, 0, 0, 0),
                              child: Text(
                                '15 Mins',
                                style:
                                    FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
                            child: Icon(
                              Icons.star_border_rounded,
                              color: Color(0xFFF6C143),
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8, 0, 0, 0),
                            child: Text(
                              widget.product.rating.toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8, 0, 0, 0),
                            child: Text(
                              '(1k reviews)',
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12, 0, 0, 0),
                            child: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color:
                                  FlutterFlowTheme.of(context).secondaryText,
                              size: 20,
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['rowOnPageLoadAnimation']!),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // SizedBox(
                          //   width: 110,
                          //   height: 120,
                          //   child: Stack(
                          //     children: [     
                          //       Align(
                          //         alignment:
                          //             const AlignmentDirectional(0.04, -0.79),
                          //         child: Theme(
                          //           data: ThemeData(
                          //             checkboxTheme: const CheckboxThemeData(
                          //               shape: CircleBorder(),
                          //             ),
                          //             unselectedWidgetColor:
                          //                 FlutterFlowTheme.of(context)
                          //                     .secondaryText,
                          //           ),
                          //           child: Checkbox(
                          //             value: false,
                          //             onChanged: (newValue) async {
                          //               // setState(() => _model.checkboxValue1 =
                          //               //     newValue!);
                          //             },
                          //             activeColor:
                          //                 FlutterFlowTheme.of(context)
                          //                     .primary,
                          //             checkColor: FlutterFlowTheme.of(context)
                          //                 .primaryText,
                          //           ),
                          //         ),
                          //       ),
                          //       Align(
                          //         alignment:
                          //             const AlignmentDirectional(0, 0.45),
                          //         child: Text(
                          //           '\$129.99',
                          //           style: FlutterFlowTheme.of(context)
                          //               .bodyLarge,
                          //         ),
                          //       ),
                          //       Align(
                          //         alignment: const AlignmentDirectional(0, 0),
                          //         child: Text(
                          //           'Mens 9',
                          //           style: FlutterFlowTheme.of(context)
                          //               .labelMedium,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ).animateOnPageLoad(
                          //     animationsMap['stackOnPageLoadAnimation1']!),
                          // SizedBox(
                          //   width: 110,
                          //   height: 120,
                          //   child: Stack(
                          //     children: [
                          //       Align(
                          //         alignment: const AlignmentDirectional(0, 0),
                          //         child: Container(
                          //           width: 110,
                          //           height: 130,
                          //           decoration: BoxDecoration(
                          //             color: FlutterFlowTheme.of(context)
                          //                 .secondaryBackground,
                          //             borderRadius: BorderRadius.circular(12),
                          //             border: Border.all(
                          //               color: FlutterFlowTheme.of(context)
                          //                   .primary,
                          //               width: 2,
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //       if (false == false)
                          //         Align(
                          //           alignment:
                          //               const AlignmentDirectional(0, 0),
                          //           child: Container(
                          //             width: 110,
                          //             height: 130,
                          //             decoration: BoxDecoration(
                          //               color: true == true
                          //                   ? FlutterFlowTheme.of(context)
                          //                       .accent1
                          //                   : FlutterFlowTheme.of(context)
                          //                       .secondaryBackground,
                          //               borderRadius:
                          //                   BorderRadius.circular(12),
                          //               border: Border.all(
                          //                 color: FlutterFlowTheme.of(context)
                          //                     .alternate,
                          //                 width: 2,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       Align(
                          //         alignment:
                          //             const AlignmentDirectional(0.04, -0.79),
                          //         child: Theme(
                          //           data: ThemeData(
                          //             checkboxTheme: const CheckboxThemeData(
                          //               shape: CircleBorder(),
                          //             ),
                          //             unselectedWidgetColor:
                          //                 FlutterFlowTheme.of(context)
                          //                     .secondaryText,
                          //           ),
                          //           child: Checkbox(
                          //             value: false,
                          //             onChanged: (newValue) async {
                          //               // setState(() => _model.checkboxValue2 =
                          //               //     newValue!);
                          //             },
                          //             activeColor:
                          //                 FlutterFlowTheme.of(context)
                          //                     .primary,
                          //             checkColor: FlutterFlowTheme.of(context)
                          //                 .primaryText,
                          //           ),
                          //         ),
                          //       ),
                          //       Align(
                          //         alignment:
                          //             const AlignmentDirectional(0, 0.45),
                          //         child: Text(
                          //           '\$129.99',
                          //           style: FlutterFlowTheme.of(context)
                          //               .bodyLarge,
                          //         ),
                          //       ),
                          //       Align(
                          //         alignment: const AlignmentDirectional(0, 0),
                          //         child: Text(
                          //           'Mens 10',
                          //           style: FlutterFlowTheme.of(context)
                          //               .labelMedium,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ).animateOnPageLoad(
                          //     animationsMap['stackOnPageLoadAnimation2']!),
                          SizedBox(
                            width: 110,
                            height: 120,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Container(
                                    width: 110,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                if (true == false)
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0, 0),
                                    child: Container(
                                      width: 110,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: true
                                            ? FlutterFlowTheme.of(context)
                                                .accent1
                                            // ignore: dead_code
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.04, -0.79),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: const CheckboxThemeData(
                                        shape: CircleBorder(),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: Checkbox(
                                      value: false,
                                      onChanged: (newValue) async {
                                        // setState(() => _model.checkboxValue3 =
                                        //     newValue!);
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context)
                                              .primary,
                                      checkColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                    const AlignmentDirectional(0, 0.45),
                                  child: Text(
                                    '${widget.product.price}\$',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Text(
                                    toTitleCase(widget.product.category),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                  ),
                                ),
                              ],
                            ),
                          ).animateOnPageLoad(
                              animationsMap['stackOnPageLoadAnimation3']!),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  32, 24, 32, 0),
                              child: isLoading ? const CircularProgressIndicator() : FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  try {
                                    await ShopRepoImpl(Dio(), HeaderGen()).addToCart(userId: user.id, productId: widget.product.id, token: user.token);
                                  }on ApiException catch (e) {
                                    print(e.message);
                                  }
                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                                text: 'Add To Cart',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50,
                                  padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                  iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                  elevation: 3,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'buttonOnPageLoadAnimation']!),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation']!),
              ),
            ),
          ],         
        ),
      ),

    );
  }
}
