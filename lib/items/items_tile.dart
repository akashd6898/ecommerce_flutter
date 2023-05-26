import "package:flutter/material.dart";

class ItemsTile extends StatefulWidget {
  dynamic item;

  ItemsTile({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemsTile> createState() => _ItemsTileState();
}

class _ItemsTileState extends State<ItemsTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 5.0,
    child: ListTile(
      leading: Image.network(widget.item.image),
      title: Text(widget.item.model,
      style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(widget.item.description),
      trailing: Text("₹${widget.item.price.toString()}"),
      isThreeLine: true,
      tileColor: Colors.white70,
      horizontalTitleGap: 16.0,
      //selectedTileColor: Colors.blue,
      //contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
    ));
  }
}

