import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  final int id;
  final String judul;
  final String deskripsi;
  bool isDone;
  final Function deleteFunction;
  final Function isChacked;
  Homepage(
      {required this.id,
      required this.judul,
      required this.deskripsi,
      required this.isDone,
      required this.deleteFunction,
      required this.isChacked,
      Key? key})
      : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    false;
    return Card(
      elevation: 4.0,
      child: Row(
        children: [
          Checkbox(
            value: widget.isDone,
            onChanged: (bool? value) {
              setState(() {
                widget.isDone = value!;
                widget.isChacked(widget.id, value);
              });
            },
          ),
          Expanded(
            child: ListTile(
              title: widget.isDone
                  ? Text(widget.judul,
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2))
                  : Text(widget.judul),
              subtitle: widget.isDone
                  ? Text(widget.deskripsi,
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2))
                  : Text(widget.deskripsi),
              onTap: () {},
            ),
          ),
          IconButton(
              onPressed: () {
                widget.deleteFunction(widget.id);
              },
              icon: const Icon(Icons.close))
        ],
      ),
    );
  }
}
