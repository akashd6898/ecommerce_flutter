import 'package:ecommerce/catalog_home/catalog_details.dart';
import 'package:ecommerce/catalog_home/catalog_widget.dart';
import 'package:ecommerce/items/item_details.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/items/items_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body:
        ListView.builder(itemCount: CatalogListData.catalogData.length,
            itemBuilder: (context, index)
            {
              return GestureDetector(
                onTap: ()
                {
                  if(CatalogListData.catalogData[index].name == "Phones")
                    {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ItemPage(categorySelected: CatalogListData.catalogData[index].name,createCategory: PhoneList.itemsList)));
                    }
                  if(CatalogListData.catalogData[index].name == "Consoles")
                  {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ItemPage(categorySelected: CatalogListData.catalogData[index].name,createCategory: ConsoleList.itemsList)));
                  }
                  if(CatalogListData.catalogData[index].name == "TV")
                  {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ItemPage(categorySelected: CatalogListData.catalogData[index].name,createCategory: TvList.itemsList)));
                  }
                  if(CatalogListData.catalogData[index].name == "Laptop")
                  {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ItemPage(categorySelected: CatalogListData.catalogData[index].name,createCategory: LaptopList.itemsList)));
                  }
                },
                  child:  CatalogWidget(catalog: CatalogListData.catalogData[index])
              );
            },
        ),
      /*ListView.builder(itemCount: ProductsList.itemsList.length,
      itemBuilder: (context, index){
        return ItemsTile(
          item: ProductsList.itemsList[index]
        );
      },
    ),*/
      /*Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Container(
          width: 300.0,
          height: 150.0,
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
          ),
          decoration: const BoxDecoration(
              color: Colors.deepOrange,
              boxShadow: [BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 5.0
              )]),
        child: Stack(
        fit: StackFit.expand,
        children: [
          const Image(image: NetworkImage("https://i0.wp.com/www.smartprix.com/bytes/wp-content/uploads/2022/04/New-year-new-phone-Top-5-smartphones-to-launch-in-2022-scaled.jpg?ssl=1&quality=80&w=f"),
          fit: BoxFit.fill,
          semanticLabel: "Mobile Phones",
          ),
          Positioned(left: 0.0,bottom: 0.0,
              child: Container(
                width: 150.0,
                height: 25.0,
                color: Colors.white,
                child: const Text("Mobile Phones",

                  style: TextStyle(
                      backgroundColor: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    //textBaseline:
                  ),),
              )
            )
        ]))],
      )),*/

      /*ListView.builder(itemCount: ProductsList.itemsList.length,
      itemBuilder: (context, index){
        return ItemsTile(
          item: ProductsList.itemsList[index]
        );
      },
    ),*/
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 0, vertical: 10),
              color: Colors.blue,
              child: const Column(
              children: [CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("images/coffee_Drink.png")),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [*/
              Text("username",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white
              ),
                strutStyle: StrutStyle(
                  height: 3.0
                ),
              ),
              ]),
            ),
            const Divider(
              color: Colors.white,
              height: 30.0,
            ),
            const ListTile(
              shape: BorderDirectional(top: BorderSide(
                style:BorderStyle.solid,
              ),bottom: BorderSide(
                style: BorderStyle.solid,
              )),
              iconColor: Colors.white,
              leading: Icon(Icons.home),
              tileColor: Colors.blue,
              title: Text("Home",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white
              )),
            ),
            const Divider(
              color: Colors.white,
              height: 30.0,
            ),
            const ListTile(
              shape: BorderDirectional(top: BorderSide(
                style:BorderStyle.solid,
              ),bottom: BorderSide(
                style: BorderStyle.solid,
              )),
              iconColor: Colors.white,
              leading: Icon(Icons.shopping_basket_outlined),
              tileColor: Colors.blue,
              title: Text("Orders",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  )),
            ),
            const Divider(
              color: Colors.white,
              height: 30.0,
            ),
            const ListTile(
              shape: BorderDirectional(top: BorderSide(
              ),bottom: BorderSide(
                style: BorderStyle.solid,
              )),
              iconColor: Colors.white,
              leading: Icon(Icons.settings),
              tileColor: Colors.blue,
              title: Text("Settings",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  )),
            ),
            const Divider(
              color: Colors.white,
              height: 30.0,
            ),
            const ListTile(
              shape: BorderDirectional(top: BorderSide(
                style:BorderStyle.solid,
              ),bottom: BorderSide(
                style: BorderStyle.solid,
              )),
              iconColor: Colors.white,
              leading: Icon(Icons.mail),
              tileColor: Colors.blue,
              title: Text("Support",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  )),
            ),
          ],
        )
      ),
    );
  }
}