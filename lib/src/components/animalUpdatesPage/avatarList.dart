import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

import '../../pages/articleDetailPage.dart';

class AvatarList extends StatelessWidget {
  final List<String> avatars;

  AvatarList({required this.avatars});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: avatars.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ArticleDetailPage(),
                  ),
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    painter: DashedCirclePainter(radius: 30, dotCount: 30),
                    child: Container(
                      width: 50, // 外层虚线圆直径
                      height: 50, // 外层虚线圆直径
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 50, // 内层实心圆直径
                    height: 50, // 内层实心圆直径
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(avatars[index]),
                      radius: 25, // 内层实心圆半径
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final double radius;
  final int dotCount;

  DashedCirclePainter({required this.radius, required this.dotCount});

  void paint(Canvas canvas, Size size) {
    final Paint dotPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    for (int i = 0; i < dotCount; i++) {
      final double angle = 2 * pi * i / dotCount;
      final Offset dotOffset = Offset(size.width / 2 + radius * cos(angle),
          size.height / 2 + radius * sin(angle));
      canvas.drawCircle(dotOffset, 1, dotPaint);
    }
  }

  @override
  bool shouldRepaint(DashedCirclePainter oldDelegate) => false;
}
