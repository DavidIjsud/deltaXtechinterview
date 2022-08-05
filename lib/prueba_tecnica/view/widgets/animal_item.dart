import 'package:flutter/material.dart';
import 'package:prueba_tecnica/prueba_tecnica/models/ubication.dart';

class AnimalItem extends StatefulWidget {
  const AnimalItem(
      {Key? key,
      required this.image,
      required this.name,
      required this.ubication})
      : super(key: key);

  final String image;
  final String name;
  final Ubication ubication;

  @override
  State<AnimalItem> createState() => _AnimalItemState();
}

class _AnimalItemState extends State<AnimalItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          const SizedBox(
            width: 20.0,
          ),
          Image.network(
            widget.image,
            width: 100,
            height: 100,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(widget.name),
          Expanded(child: Container()),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.location_city,
                color: Colors.blue,
              )),
          const SizedBox(
            width: 10.0,
          ),
          const Text("Ubicar", style: TextStyle(color: Colors.blue)),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }
}
