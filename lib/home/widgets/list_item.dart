import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(right: 24),
              decoration: const BoxDecoration(color: Colors.pink),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Name",
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: const Text(
                    "#000",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );
}
