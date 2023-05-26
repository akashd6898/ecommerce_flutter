class ItemDetails
{
  String brand = '';
  String category = '';
  String model = '';
  String color = '';
  double price = 0.0;
  String description = '';
  String image = '';
  //double truePrice = double.parse(price);

  ItemDetails({required this.category, required this.brand , required this.model, required this.color, required this.price, required this.description, required this.image});
}
class ProductsList
{
static final itemsList = [ItemDetails
(
category: "Mobile Phone",
brand: "Apple",
model: "iphone Xs",
color: "Gold",
price: 10000.00,
description: 'iphone Xs model 2018',
image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.qIHwGBO4dfsqXPUfLaEEaAHaOV%26pid%3DApi&f=1&ipt=88ce9f3a2b2bd0afb83a07b16488181d5b898b7f2880757c3a7c01dcb9ded684&ipo=images",
),
  ItemDetails
    (
      category: "Mobile Phone",
      brand: "Apple",
      model: "iphone 11 ",
      color: "Red",
      price: 20000.00,
      description: 'iphone 11 model 2019',
      image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ffoppo.fi%2Fwp-content%2Fuploads%2F2020%2F08%2FIPHONE-11-RED.jpg&f=1&nofb=1&ipt=1062427f6c0132cca30e3ae5ab6c7668d9cebc427b61f24225ee2f0e455769f4&ipo=images",
  )
];
}