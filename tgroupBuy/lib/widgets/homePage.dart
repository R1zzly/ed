// import 'package:flutterflow_ui/flutterflow_ui.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart'
//     as smooth_page_indicator;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_animate/flutter_animate.dart';

// class HomePageWidget extends StatefulWidget {
//   const HomePageWidget({super.key});

//   @override
//   State<HomePageWidget> createState() => _HomePageWidgetState();
// }

// class _HomePageWidgetState extends State<HomePageWidget>
//     with TickerProviderStateMixin {
//   late PageController _pageViewController;

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   final animationsMap = {
//     'pageViewOnPageLoadAnimation': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         FadeEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: 0,
//           end: 1,
//         ),
//         MoveEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: const Offset(0, 70),
//           end: const Offset(0, 0),
//         ),
//       ],
//     ),
//     'imageOnPageLoadAnimation': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         FadeEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: 0,
//           end: 1,
//         ),
//       ],
//     ),
//     'rowOnPageLoadAnimation1': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         FadeEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: 0,
//           end: 1,
//         ),
//         MoveEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: const Offset(0, 60),
//           end: const Offset(0, 0),
//         ),
//       ],
//     ),
//     'rowOnPageLoadAnimation2': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         FadeEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: 0,
//           end: 1,
//         ),
//         MoveEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: const Offset(0, 50),
//           end: const Offset(0, 0),
//         ),
//       ],
//     ),
//     'containerOnPageLoadAnimation1': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         FadeEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: 0,
//           end: 1,
//         ),
//         MoveEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: const Offset(0, 50),
//           end: const Offset(0, 0),
//         ),
//       ],
//     ),
//     'containerOnPageLoadAnimation2': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         FadeEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: 0,
//           end: 1,
//         ),
//         MoveEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: const Offset(60, 0),
//           end: const Offset(0, 0),
//         ),
//         ScaleEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: const Offset(0.6, 0),
//           end: const Offset(0, 1),
//         ),
//       ],
//     ),
//     'containerOnPageLoadAnimation3': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       effects: [
//         FadeEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: 0,
//           end: 1,
//         ),
//         MoveEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: const Offset(80, 0),
//           end: const Offset(0, 0),
//         ),
//         ScaleEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: const Offset(0.6, 0),
//           end: const Offset(0, 1),
//         ),
//       ],
//     ),
//   };

//   @override
//   void initState() {
//     super.initState();
//     _pageViewController = PageController(initialPage: 0);
//     setupAnimations(
//       animationsMap.values.where((anim) =>
//           anim.trigger == AnimationTrigger.onActionTrigger ||
//           !anim.applyInitialState),
//       this,
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _pageViewController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isiOS) {
//       SystemChrome.setSystemUIOverlayStyle(
//         SystemUiOverlayStyle(
//           statusBarBrightness: Theme.of(context).brightness,
//           systemStatusBarContrastEnforced: true,
//         ),
//       );
//     }

//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//       appBar: AppBar(
//         backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//         automaticallyImplyLeading: false,
//         title: Text(
//           'Popular Looks',
//           style: FlutterFlowTheme.of(context).displaySmall.override(
//                 fontFamily: 'Outfit',
//                 color: FlutterFlowTheme.of(context).primaryText,
//               ),
//         ),
//         actions: const [],
//         centerTitle: false,
//         elevation: 0,
//       ),
//       body: SafeArea(
//         top: true,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Text(
//                       'Items that are getting attention',
//                       style: FlutterFlowTheme.of(context).labelMedium,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 height: 530,
//                 child: Stack(
//                   children: [
//                     Padding(
//                       padding:
//                           const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
//                       child: PageView(
//                         controller: _pageViewController ??=
//                             PageController(initialPage: 0),
//                         scrollDirection: Axis.horizontal,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 12, 0, 12, 0),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(12),
//                               child: Image.network(
//                                 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8b08f141-4901-4e04-a17b-21e868003e44/sportswear-phoenix-fleece-womens-oversized-pullover-hoodie-bs372Q.png',
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                               ),
//                             ).animateOnPageLoad(
//                                 animationsMap['imageOnPageLoadAnimation']!),
//                           ),
//                           Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 12, 0, 12, 0),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(12),
//                               child: Image.network(
//                                 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a825afbf-a2c1-4ad8-a3a7-f3a4b29d78b8/primary-mens-dri-fit-versatile-tank-RcQ41g.png',
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 12, 0, 12, 0),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(12),
//                               child: Image.network(
//                                 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/dc811684-8b82-4fbf-8db8-df854abc2131/sportswear-phoenix-fleece-womens-oversized-pullover-hoodie-bs372Q.png',
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Align(
//                       alignment: const AlignmentDirectional(-0.9, 1),
//                       child: Padding(
//                         padding:
//                             const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
//                         child: smooth_page_indicator.SmoothPageIndicator(
//                           controller: _pageViewController ??=
//                               PageController(initialPage: 0),
//                           count: 3,
//                           axisDirection: Axis.horizontal,
//                           onDotClicked: (i) async {
//                             await _pageViewController.animateToPage(
//                               i,
//                               duration: const Duration(milliseconds: 500),
//                               curve: Curves.ease,
//                             );
//                           },
//                           effect: smooth_page_indicator.ExpandingDotsEffect(
//                             expansionFactor: 2,
//                             spacing: 8,
//                             radius: 16,
//                             dotWidth: 16,
//                             dotHeight: 4,
//                             dotColor: FlutterFlowTheme.of(context).alternate,
//                             activeDotColor:
//                                 FlutterFlowTheme.of(context).secondaryText,
//                             paintStyle: PaintingStyle.fill,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ).animateOnPageLoad(
//                   animationsMap['pageViewOnPageLoadAnimation']!),
//               Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Text(
//                       'Shoes in the cubbard',
//                       style: FlutterFlowTheme.of(context).headlineSmall,
//                     ),
//                   ],
//                 ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation1']!),
//               ),
//               Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Text(
//                       'Find the latest look in our recent review.',
//                       style: FlutterFlowTheme.of(context).labelMedium,
//                     ),
//                   ],
//                 ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation2']!),
//               ),
//               Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
//                 child: Container(
//                   width: double.infinity,
//                   height: 240,
//                   decoration: BoxDecoration(
//                     color: FlutterFlowTheme.of(context).primaryBackground,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
//                     child: ListView(
//                       padding: EdgeInsets.zero,
//                       primary: false,
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               12, 12, 0, 12),
//                           child: Container(
//                             width: 180,
//                             height: 160,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               boxShadow: const [
//                                 BoxShadow(
//                                   blurRadius: 4,
//                                   color: Color(0x3F15212B),
//                                   offset: Offset(0, 3),
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   0, 0, 0, 12),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Expanded(
//                                     child: Padding(
//                                       padding:
//                                           const EdgeInsetsDirectional.fromSTEB(
//                                               8, 8, 8, 0),
//                                       child: Container(
//                                         width: double.infinity,
//                                         height: 100,
//                                         decoration: BoxDecoration(
//                                           color:
//                                               FlutterFlowTheme.of(context).info,
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsetsDirectional
//                                               .fromSTEB(0, 0, 0, 8),
//                                           child: ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                             child: Image.network(
//                                               'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/adf87c27-e670-4e75-86fd-31c1241b9ed6/air-max-90-mens-shoes-6n3vKB.png',
//                                               width: double.infinity,
//                                               height: 110,
//                                               fit: BoxFit.cover,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsetsDirectional.fromSTEB(
//                                             16, 4, 16, 0),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Text(
//                                           'Nike Air Shoe',
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyMedium,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsetsDirectional.fromSTEB(
//                                             16, 4, 16, 0),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Text(
//                                           '\$250.00',
//                                           style: FlutterFlowTheme.of(context)
//                                               .labelMedium,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ).animateOnPageLoad(
//                               animationsMap['containerOnPageLoadAnimation2']!),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(12),
//                           child: Container(
//                             width: 180,
//                             height: 160,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               boxShadow: const [
//                                 BoxShadow(
//                                   blurRadius: 4,
//                                   color: Color(0x3F15212B),
//                                   offset: Offset(0, 3),
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   0, 0, 0, 12),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Expanded(
//                                     child: Padding(
//                                       padding:
//                                           const EdgeInsetsDirectional.fromSTEB(
//                                               8, 8, 8, 0),
//                                       child: Container(
//                                         width: double.infinity,
//                                         height: 100,
//                                         decoration: BoxDecoration(
//                                           color:
//                                               FlutterFlowTheme.of(context).info,
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsetsDirectional
//                                               .fromSTEB(0, 0, 0, 8),
//                                           child: ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                             child: Image.network(
//                                               'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/9e7c969b-a36f-4d25-ae53-80ca724ea237/air-max-systm-mens-shoes-TwgLWK.png',
//                                               width: double.infinity,
//                                               height: 110,
//                                               fit: BoxFit.cover,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsetsDirectional.fromSTEB(
//                                             16, 4, 16, 0),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Text(
//                                           'Nike Air Shoe',
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyMedium,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsetsDirectional.fromSTEB(
//                                             16, 4, 16, 0),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Text(
//                                           '\$120',
//                                           style: FlutterFlowTheme.of(context)
//                                               .labelMedium,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ).animateOnPageLoad(
//                               animationsMap['containerOnPageLoadAnimation3']!),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(12),
//                           child: Container(
//                             width: 180,
//                             height: 160,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               boxShadow: const [
//                                 BoxShadow(
//                                   blurRadius: 4,
//                                   color: Color(0x3F15212B),
//                                   offset: Offset(0, 3),
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   0, 0, 0, 12),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Expanded(
//                                     child: Padding(
//                                       padding:
//                                           const EdgeInsetsDirectional.fromSTEB(
//                                               8, 8, 8, 0),
//                                       child: Container(
//                                         width: double.infinity,
//                                         height: 100,
//                                         decoration: BoxDecoration(
//                                           color:
//                                               FlutterFlowTheme.of(context).info,
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsetsDirectional
//                                               .fromSTEB(0, 0, 0, 8),
//                                           child: ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                             child: Image.network(
//                                               'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/74a133e6-c902-48f2-9e77-765a727fadf3/air-max-systm-womens-shoes-Cz5zxV.png',
//                                               width: double.infinity,
//                                               height: 110,
//                                               fit: BoxFit.fitHeight,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsetsDirectional.fromSTEB(
//                                             16, 4, 16, 0),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Text(
//                                           'AirMax',
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyMedium,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsetsDirectional.fromSTEB(
//                                             16, 4, 16, 0),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Text(
//                                           '\$250.00',
//                                           style: FlutterFlowTheme.of(context)
//                                               .labelMedium,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ).animateOnPageLoad(
//                     animationsMap['containerOnPageLoadAnimation1']!),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
