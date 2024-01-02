import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title});

  final String title;

  bool hasTopSafeAreaTop(BuildContext context) {
    double top = MediaQuery.of(context).viewPadding.top;
    return top > 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(
          right: 20, top: hasTopSafeAreaTop(context) ? 0 : 20, bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines:
                  2, // Set the maximum number of lines // Display ellipsis if text is truncated
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            "#001",
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              height: 0.11,
            ),
          ),
        ],
      ),
    ));
  }
}
