import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:tgroupbuy/common/error/exceptions.dart';
import 'package:tgroupbuy/data/models/product.dart';
import 'package:tgroupbuy/data/repository/header_gen.dart';
import 'package:tgroupbuy/data/repository/shop_repo.dart';
import 'package:tgroupbuy/widgets/product.dart';



class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  List<Product> searchResults = [];
  bool isLoading = false;
  void searchProducts(String value) async {
    setState(() {
      isLoading = true;
    });

    try {
      final products = await ShopRepoImpl(Dio(), HeaderGen()).productSearch(value);
      searchResults = products;
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("error ${e.message}")));
      }
    }finally {
      setState(() {
      isLoading = false;
    });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            searchProducts(value);
          },
          decoration: InputDecoration( 
            labelText: "Search",
            suffix: isLoading ?const CircularProgressIndicator() : null,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  searchProducts(value);
                }
              },
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: isLoading ? CircularProgressIndicator() : null,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Price", style: TextStyle(fontSize: 20)),
            IconButton(onPressed: () {
              setState(() {
                searchResults.sort((a,b) => a.price.compareTo(b.price));
              });
            }, icon: Icon(Icons.arrow_upward)),
            SizedBox(width: 15,),
            IconButton(onPressed: () {
              setState(() {
                searchResults.sort((a,b) => b.price.compareTo(a.price));
              });
            }, icon: Icon(Icons.arrow_downward))
          ],),
        isLoading ?const CircularProgressIndicator() :
          Expanded(
            child: ListView.builder(
                                    itemCount: searchResults.length,
                                    itemBuilder: (context, index) {
                                       return  GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(builder: (ctx) {
                                              return ProductWidget(product: searchResults[index]);
                                            })
                                          );
                                        },
                                         child: Padding(
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
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                // 'https://static.nike.com/a/images/t_prod_ss/w_640,c_limit,f_auto/95c8dcbe-3d3f-46a9-9887-43161ef949c5/sleepers-of-the-week-release-date.jpg'
                                                child: Image.network(
                                                 searchResults[index].image ,
                                                  width: 80,
                                                  height: 80,
                                                  fit: BoxFit.fitWidth,
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
                                                        searchResults[index].name,
                                                        style:
                                                        FlutterFlowTheme.of(context)
                                                            .titleLarge,
                                                      ),
                                                    ),
                                                    Text(
                                                      '\$${searchResults[index].price}',
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
                                                  Icons.arrow_forward,
                                                  color:
                                                  FlutterFlowTheme.of(context).error,
                                                  size: 20,
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                            MaterialPageRoute(builder: (ctx) {
                                              return ProductWidget(product: searchResults[index]);
                                            })
                                          );
                                                },
                                              ),
                                            ],
                                          ),
                                                                               ),
                                                                             ),
                                                                           ),
                                       );
                                  
                                    }
                                    ),
             
          ),
        ],
      ),
    );
  }
}