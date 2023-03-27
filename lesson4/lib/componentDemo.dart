import 'package:flutter/material.dart';

class ComponentDemo extends StatelessWidget {
  const ComponentDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const Icon(
            Icons.notifications_active,
            size: 50,
          ),
          Positioned(
            left: 10,
            bottom: 6,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}
