import 'package:flutter/material.dart';
import 'package:ecommerce/items/items_page.dart';

class CatalogWidget extends StatefulWidget {
  dynamic catalog;

  CatalogWidget({Key? key, required this.catalog}) : super(key: key);
  @override
  State<CatalogWidget> createState() => _CatalogWidgetState();
}

class _CatalogWidgetState extends State<CatalogWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      margin: const EdgeInsets.all(13.0),
            width: 300.0,
            height: 150.0,
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 5.0
                )]),
            child: Stack(
                fit: StackFit.expand,
                children: [
                  Image(image: NetworkImage("${widget.catalog.image}"),
                    fit: BoxFit.fill,
                    semanticLabel: "Mobile Phones",
                  ),
                  Positioned(left: 0.0,bottom: 0.0,
                      child: Container(
                        width: 100.0,
                        height: 25.0,
                        color: Colors.white,
                        child: Text("${widget.catalog.name}",
                          style: const TextStyle(
                            backgroundColor: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            //textBaseline:
                          ),),
                      )
                  )
                ])),
    );
  }
}
