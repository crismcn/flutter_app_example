import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({this.color = Colors.white, this.shadow = false});
  final Color color;
  final bool shadow;

  @override
  build(_) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(_).viewInsets.bottom),
      child: Stack(alignment: Alignment.center, children: [
        if (shadow) Container(color: Colors.grey[900]!.withOpacity(.75)),
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
      ]));
}
