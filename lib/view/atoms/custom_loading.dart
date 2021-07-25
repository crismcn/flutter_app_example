import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({this.color = Colors.white});
  final Color color;

  @override
  build(_) => Stack(alignment: Alignment.center, children: [
        RotatedBox(
          quarterTurns: 1,
          child: SizedBox.fromSize(
            size: Size(50, 50),
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ),
        SizedBox.fromSize(
          size: Size(75, 75),
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ]);
}
