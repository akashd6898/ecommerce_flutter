class ItemDetails
{
  String brand = '';
  String category = '';
  String model = '';
  String color = '';
  double price = 0.0;
  String description = '';
  String image = '';
  List<String>? imageSet = [''];

  ItemDetails({required this.category, required this.brand , required this.model, required this.color, required this.price, required this.description, required this.image, this.imageSet});
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
imageSet: ['https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.pu6QL5Apg8OxbF2_XNfBrAHaGk%26pid%3DApi&f=1&ipt=76ab5f84bbb8520fe615e360004c4121f3a805985674059eaf7fe2c6485165b5&ipo=images',
  'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.RnWJ6zotyIriq_eRbDW5mAHaHa%26pid%3DApi&f=1&ipt=43e2a6f907d9c478b434f0e82ccdc84950b694b22ca7f9ede2c12e06946fe53e&ipo=images',
  'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.C4-ZG8jaE5cw0UUk_cuERAHaHa%26pid%3DApi&f=1&ipt=6b0f0c76cfc88e382ad5912ead8b41f778ba27a9d97d6aef9374520769bc4501&ipo=images'
]
),
  ItemDetails
    (
      category: "Mobile Phone",
      brand: "Apple",
      model: "iphone 11 ",
      color: "Red",
      price: 20000.00,
      description: 'iphone 11 model 2019',
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOHWk7Ll29dImlcaRndIp0gcLKIGuVS2ZoJw&usqp=CAU",
      imageSet: ['https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.exnxNvanMM6IQDv-6HyaWgHaHa%26pid%3DApi&f=1&ipt=d800ba63339662b4d3d8b6b6215323d902df8b0438f97b9a7b5e969c9acf568c&ipo=images',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.dLxjEXDNnugevdtbA6QGSwHaGk%26pid%3DApi&f=1&ipt=d30eeee12044bb62fa2c4390d5caab206f83ff83f2b38daf9f59ecc52548cffc&ipo=images',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.RNYkR8___dGGgHB7nzbF8QHaHa%26pid%3DApi&f=1&ipt=344b40c61c1798dc13a14a937c9080a4014d5e9881a5c424453cad38343a22c6&ipo=images'
      ]
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
      imageSet: ['https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.zpHUSD4ePTS9voobw9u5dQHaHa%26pid%3DApi&f=1&ipt=2d751fe6b8ac76e24ed4f6b5cbb08a86581b0e61b37c77b55fd1c2b383c9b959&ipo=images',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.gdb4oPErkNZiFu-0XYX3SwHaD4%26pid%3DApi&f=1&ipt=681b6142ae9bf9a2e90d253fff70f2a84b01016ddc68af36cdc20ef180a77549&ipo=images',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.pEBtFEZe8D8VTRsfoJVGwwHaE8%26pid%3DApi&f=1&ipt=8c99626597795e77792c7d90cbb30ecb8e39b8bfb198f683faf52ab4767f352b&ipo=images'
      ]
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
        imageSet: ['https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.yqQXFvYm9XS0fBoMTrYa2QHaDC%26pid%3DApi&f=1&ipt=2f6201bdbce3085c8f1be9bcf9251a48af0d6c9e30e39fabf04fa2804d9967d3&ipo=images',
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.Ehew7h5ao_F-QTmX6MmdVgHaEa%26pid%3DApi&f=1&ipt=332abb6ac289bd9abb0d57c3a0e0f83cbd763de649f2f90b6dfce0c896ef37d2&ipo=images',
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.yeZk2eYnfaQ_nz5HXITJEwHaFk%26pid%3DApi&f=1&ipt=aaa082ce094df9babfb94a2002f2630cd65b79b17dbfdc8eaf0827c79817e92c&ipo=images'
        ]
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
    imageSet: ['https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.og8xDxQq070NrFvNMYgM3QHaHa%26pid%3DApi&f=1&ipt=f47e0d42b525955795b36732bf426e022626812c115160f36f8c119f97e603ea&ipo=images',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.VFL7yUa-sdJDaMUSUtXEpgHaHa%26pid%3DApi&f=1&ipt=800e19d02f7980d4a35c7e1db956eab025f5a0274958e14af437c04aacb6e03e&ipo=images',
      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.Yj6KmwNbxEcpmRioNtzCFAHaHa%26pid%3DApi&f=1&ipt=18a689d8d087baac60cd1a8550be86bfc0e2850a4ac53b120ee3e07774f4cfd5&ipo=images'
      ]
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
      imageSet: ['https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.p9TEGcS0Okx8i1vEYGN2LAHaE7%26pid%3DApi&f=1&ipt=28c90f6abd9ec94622bb5de032e358a8a2e6c4dca41e5a51e5b9ce597a99dd77&ipo=images',
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.j2knTUVxAI9P50XkXBQM2AHaE6%26pid%3DApi&f=1&ipt=a1b2a8124d7fceddc4aa10b4d93bda06ef20aa6be0756c6c58598632e147dfab&ipo=images',
        ]
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
  imageSet: ['https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.eYYnJYtVowihNzN9KOVueAHaFf%26pid%3DApi&f=1&ipt=83a436f831672248295eb03fbecf3aba36dfaf7aecb5fb49f48a58f89931910b&ipo=images',
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.uq4sZeNncxPyk6UGgaKZ8wHaFS%26pid%3DApi&f=1&ipt=d91f1db7b5afd3b665d6237c9581a707f9e7bf2a754a35c413c5e4d53af9dae4&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.aBaa4tTr51eVi2lRLGbfLAHaGD%26pid%3DApi&f=1&ipt=8f9c5dabfa880be6d65d84cd128ba553fd4e79d38c70cec8103a4555e9ec0bbe&ipo=images'
      ]
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
  imageSet: ['https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.df77GrKX4lPpEmbk0IV6EQHaEK%26pid%3DApi&f=1&ipt=7b52f4b11b59cdc536629d14a7e891b1c5a1cbc503337feb284f585056e1bed3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.iQ3vqoC33VHgalRP_nwjMwHaJM%26pid%3DApi&f=1&ipt=9dad8ab70ec106818c4f246aca2fa0864c3d5a49e5ac7bd4c8e708339e1b92d0&ipo=images'
      ]
  )
];
}
