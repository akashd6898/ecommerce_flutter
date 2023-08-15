import 'package:flutter/material.dart';
import 'package:ecommerce/favorite_page/favourite_page_details.dart';
import 'package:provider/provider.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    final favObj = Provider.of<FavouriteDelete>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          shape: const RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.pinkAccent,
                  width: 2.0,
                  strokeAlign: 2.0,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(50), right: Radius.circular(50))),
          elevation: 10.0,
          title: const Text("Favourites"),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  width: 350,
                  height: 650,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: FavouritePageDetails.favouriteList.isNotEmpty ?
                  CustomScrollView(
                    scrollDirection: Axis.vertical,
                    slivers: [
                      SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                        final item = FavouritePageDetails.favouriteList[index];
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            width: 250,
                            height: 80,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.pinkAccent.withOpacity(0.3),
                                offset: const Offset(0, 3),
                              )
                            ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image(
                                    image: NetworkImage(item[1]),
                                    width: 50,
                                    height: 70),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [Text("${item[2]}"),
                                Text("${item[4]}",
                                  style:const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                )]),
                                Text("₹${item[3]}"),
                                IconButton(
                                  onPressed: ()
                                  {
                                    favObj.favDel(favouriteDelProductCode: item[0]);
                                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Favourites()));
                                  },
                                  icon: const Icon(Icons.highlight_remove_sharp,
                                      color: Colors.red),
                                )
                              ],
                            ),
                          ),
                        );
                      }, childCount: FavouritePageDetails.favouriteList.length))
                    ],
                  ):
                  const Image(image: NetworkImage("https://cdn1.vectorstock.com/i/1000x1000/16/10/heart-symbol-cartoon-is-broken-vector-38851610.jpg"))
              )
            ])));
  }
}
