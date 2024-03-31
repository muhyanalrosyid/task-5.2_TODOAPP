import 'package:flutter/widgets.dart';

import '../utils/DbHelper.dart';
import '../views/homePage.dart';

class TodoList extends StatelessWidget {
  final Function deleteFunction;
  final Function isChacked;

  var db = DbHelper();
  TodoList({
    required this.deleteFunction,
    required this.isChacked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.queryAllRows(),
        builder: ((context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var dataLength = data!.length;

          return dataLength == 0
              ? const Center(
                  child: Text("No Data Found"),
                )
              : ListView.builder(
                  itemCount: dataLength,
                  itemBuilder: (context, i) => Homepage(
                    id: data[i].id,
                    judul: data[i].judul,
                    deskripsi: data[i].deskripsi,
                    isDone: data[i].isDone,
                    deleteFunction: deleteFunction,
                    isChacked: isChacked,
                  ),
                );
        }),
      ),
    );
  }
}
