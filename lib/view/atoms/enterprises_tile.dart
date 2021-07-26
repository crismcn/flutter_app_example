// 'https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png',
import 'dart:math' as math;
import 'package:app_example/models/enterprise.dart';
import 'package:app_example/utils/api_consts.dart';
import 'package:flutter/material.dart';

class EnterprisesTile extends StatelessWidget {
  const EnterprisesTile(this.enterprise);
  final Enterprise enterprise;

  @override
  build(_) => Container(
        height: MediaQuery.of(_).size.height * .2,
        margin: EdgeInsets.only(bottom: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          image: enterprise.photoUrl.isNotEmpty
              ? DecorationImage(
                  image: NetworkImage(
                    '${API.DOMAIN}${enterprise.photoUrl}',
                  ),
                  fit: BoxFit.cover)
              : null,
          color: enterprise.photoUrl.isEmpty
              ? Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1)
              : null,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (enterprise.logoUrl.isNotEmpty)
                Image.network(enterprise.logoUrl,
                    width: 48,
                    fit: BoxFit.contain,
                    loadingBuilder: (_, child, progress) => (progress != null)
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white))
                        : child),
              Stack(children: [
                Text(enterprise.name.toUpperCase(),
                    style: Theme.of(_).primaryTextTheme.headline4!.copyWith(
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1.5
                            ..color = Colors.black,
                        )),
                Text(enterprise.name.toUpperCase(),
                    style: Theme.of(_).primaryTextTheme.headline4),
              ]),
            ]),
      );
}
