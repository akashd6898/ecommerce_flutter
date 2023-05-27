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
class PhoneList
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
class ConsoleList
{
  static final itemsList = [ItemDetails
    (
    category: "Console",
    brand: "Sony",
    model: "Playstation 5 Digital",
    color: "White",
    price: 50000.00,
    description: 'Playstation 5 Digital model 2019',
    image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftitanprocurementlimited.com%2Fwp-content%2Fuploads%2F2020%2F10%2F61JbCra7GL._SL1500_.jpg&f=1&nofb=1&ipt=c3d6d6eac05b3e0d1ecfab054f397f8c2557acb8b3350928caaee5820712ea3f&ipo=images",
  ),
    ItemDetails
      (
      category: "Console",
      brand: "Sony",
      model: "Playstation 5 Disc",
      color: "White",
      price: 50000.00,
      description: 'Playstation 5 Disc model 2019',
      image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ebayimg.com%2Fimages%2Fg%2FzAgAAOSwhJNf0gOR%2Fs-l1200.jpg&f=1&nofb=1&ipt=68d3ed52969a648429c0257f8c407efebcd2bb6d8a607457f3879aada4373262&ipo=images",
    )
  ];
}

class TvList
{
  static final itemsList = [ItemDetails
    (
    category: "TV",
    brand: "LG",
    model: "QLED",
    color: "Black",
    price: 70000.00,
    description: 'QLED ultra HD 55 inch',
    image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.VFL7yUa-sdJDaMUSUtXEpgHaHa%26pid%3DApi&f=1&ipt=800e19d02f7980d4a35c7e1db956eab025f5a0274958e14af437c04aacb6e03e&ipo=images",
  ),
    ItemDetails
      (
      category: "TV",
      brand: "LG",
      model: "OLED",
      color: "Black",
      price: 60000.00,
      description: 'OLED ultra HD 55 inch',
      image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.iVhJu6Yh0WsgvTjy44sBmQHaE6%26pid%3DApi&f=1&ipt=e29c80cbfc8c7436182538bd16cc9d3c2aba6a10aad2ffa69df88ea0f4080815&ipo=images",
    )
  ];
}

class LaptopList
{
  static final itemsList = [ItemDetails
  (
  category: "Laptop",
  brand: "Apple",
  model: "MacBook Air",
  color: "Gold",
  price: 70000.00,
  description: 'Macbook Air M2 chip',
  image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fthesimplicitypost.com%2Fwp-content%2Fuploads%2F2018%2F11%2FMacBook-Air-gold-10302018.jpg&f=1&nofb=1&ipt=8684ffb33fcd5116931e4cb4eeb3224614b40a43ab3083bcac4b08ccd379d492&ipo=images",
  ),
  ItemDetails
  (
  category: "Laptop",
  brand: "Apple",
  model: "MacBook Pro",
  color: "Grey",
  price: 90000.00,
  description: 'Macbook Pro M2 chip',
  image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.zapID4Aqr9d9qSpk9n-aewHaHa%26pid%3DApi&f=1&ipt=d46c121bf4822e34586f81ec0a17c08244d801bd44afd1dd65f0ff9567592623&ipo=images",
  )
];
}