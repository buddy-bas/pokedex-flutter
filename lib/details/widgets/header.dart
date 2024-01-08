import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
    this.trailing,
  });

  final String title;
  final Widget? trailing;

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
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines:
                  2, // Set the maximum number of lines // Display ellipsis if text is truncated
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          trailing != null
              ? trailing!
              : const SizedBox(
                  width: 0,
                  height: 0,
                )
        ],
      ),
    ));
  }
}
