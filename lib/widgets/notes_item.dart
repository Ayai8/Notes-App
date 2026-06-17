import 'package:flutter/material.dart';
class NotesItem extends StatelessWidget {
  const NotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24 , bottom: 24 , left: 16),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text('Flutter Tips', style: TextStyle(color: Colors.black , fontSize: 26)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16 , bottom: 16),
              child: Text(
                'Learn Flutter Course By Tharwart Sammy  ',
                style: TextStyle(color: Colors.black26 , fontSize: 20),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete, color: Colors.black54 , size: 28, ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text('May 21 2005', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
