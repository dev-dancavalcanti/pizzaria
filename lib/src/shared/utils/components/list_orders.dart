// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ListOrders extends StatelessWidget {
  final Query query;
  final String nameQuery;
  final void Function()? function;
  const ListOrders(
      {super.key,
      required this.query,
      required this.nameQuery,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(nameQuery),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            onPressed: () {},
          ),
        ),
        Visibility(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 3),
            child: FirebaseAnimatedList(
              shrinkWrap: true,
              query: query,
              itemBuilder: (context, snapshot, animation, index) {
                return InkWell(
                  onTap: function,
                  child: Card(
                    color: Colors.red,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.amber,
                          width: 100,
                          height: 100,
                        ),
                        Text(snapshot.child("name").value.toString()),
                        Text(snapshot.child("flavor").value.toString()),
                        Text(snapshot.child("adress").value.toString())
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
