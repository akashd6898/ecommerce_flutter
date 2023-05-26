class CatalogDetails
{
  String image = '';
  String name = '';
  CatalogDetails({required this.image, required this.name});
}

class CatalogListData
{
  static final catalogData = [
    CatalogDetails(image: "https://i0.wp.com/www.smartprix.com/bytes/wp-content/uploads/2022/04/New-year-new-phone-Top-5-smartphones-to-launch-in-2022-scaled.jpg?ssl=1&quality=80&w=f",
      name: "Phones"),
    CatalogDetails(image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg.phonandroid.com%2F2020%2F12%2Fps5-xbox.jpg&f=1&nofb=1&ipt=808a436d0ddd575f67d86f2f5fa609a9feb6e4070017320eb951064acc125197&ipo=images",
    name: "Consoles"),
    CatalogDetails(image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.androidpolice.com%2Fwp-content%2Fuploads%2F2017%2F11%2Fnexus2cee_4k.png&f=1&nofb=1&ipt=99b88b7927ada771a6dfec24d3f0fe68d4f1a583b16462bb87d8eeea42559c06&ipo=images",
        name: "TV"),
    CatalogDetails(image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.laptopmain.com%2Fwp-content%2Fuploads%2F2017%2F09%2FDell-XPS-15-9560.jpg&f=1&nofb=1&ipt=ec944be4af6f31932ffea29f15e8fbd9fbb3dfbad6959b71c7ff2d31ac8d14b8&ipo=images",
        name: "Laptop"),
  ];
}