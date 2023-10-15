import 'package:ecommerce/catalog_home/catalog_details.dart';
import 'package:ecommerce/catalog_home/catalog_widget.dart';
import 'package:ecommerce/items/item_details.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/items/items_page.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
            drawerListTile("Checkout", Icons.shopping_cart, Colors.black, context, MyRoutes.checkoutpage),
            /*ListTile(
                shape: const BorderDirectional(top: BorderSide(
                  style:BorderStyle.solid,
                ),bottom: BorderSide(
                  style: BorderStyle.solid,
                )),
                iconColor: Colors.white,
                leading: const Icon(Icons.shopping_cart),
                tileColor: Colors.blue,
                title: const Text("Checkout",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white
                )),
              onTap:() {
                Navigator.pushNamed(context, MyRoutes.checkoutpage);
              },
              ),*/
            const Divider(
              color: Colors.white,
              height: 30.0,
            ),
            drawerListTile("Favourites", Icons.favorite_outlined, Colors.pink.shade200, context, MyRoutes.favouritespage),
            /*ListTile(
              shape: const BorderDirectional(top: BorderSide(
                style:BorderStyle.solid,
              ),bottom: BorderSide(
                style: BorderStyle.solid,
              )),
              iconColor: Colors.pink[200],
              leading: const Icon(Icons.favorite),
              tileColor: Colors.blue,
              title: const Text("Favourites",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  )),
              onTap:() {
                Navigator.pushNamed(context, MyRoutes.favouritespage);
              },
            ),*/
            const Divider(
              color: Colors.white70,
              height: 30.0,
            ),
            drawerListTile("Orders", Icons.shopping_basket_outlined, Colors.black, context, "To be filled"),
            /*const ListTile(
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
            ),*/
            const Divider(
              color: Colors.white,
              height: 30.0,
            ),
            drawerListTile("Settings", Icons.settings, Colors.black, context, "To be filled"),
            /*const ListTile(
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
            ),*/
            const Divider(
              color: Colors.white,
              height: 30.0,
            ),
            drawerListTile("Sign out", Icons.exit_to_app_rounded, Colors.black, context, MyRoutes.loginpage),
            /*const Divider(
              color: Colors.white,
              height: 30.0,
            ),
            ListTile(
              shape: const BorderDirectional(top: BorderSide(
                style:BorderStyle.solid,
              ),bottom: BorderSide(
                style: BorderStyle.solid,
              )),
              iconColor: Colors.white,
              leading: const Icon(Icons.mail),
              tileColor: Colors.blue,
              title: const Text("Sign out",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  )),
              onTap: () async
              {
                try {
                  await FirebaseAuth.instance.signOut();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("See you soon!"),
                        backgroundColor: Colors.green,
                      ));
                  Navigator.pushReplacementNamed(context, MyRoutes.loginpage);
                } on FirebaseAuthException catch (e) {
                  print(e.code);
                }
              }
            )*/
          ],
        )
      ),
    );
  }
}

ListTile drawerListTile(String itemName, IconData itemIcon, Color iconPaint, BuildContext context, String selection)
{
  return ListTile(
    iconColor: iconPaint,
    leading: Icon(itemIcon),
    title: Text(itemName),
    selectedColor: Colors.blue,
    tileColor: Colors.white,
    textColor: Colors.black,
    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold,
    fontSize: 18.0),
    onTap: () async
    {
      if(itemName == "Sign out")
        {
          try {
            await FirebaseAuth.instance.signOut();
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("See you soon!"),
                  backgroundColor: Colors.green,
                ));
            Navigator.pushReplacementNamed(context, selection);
          } on FirebaseAuthException catch (e) {
            print(e.code);
          }
        }
        else
          {
            Navigator.pushNamed(context, selection);
          }
    },
  );
}