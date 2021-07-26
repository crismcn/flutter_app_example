import 'package:app_example/utils/ui_texts.dart';
import 'package:app_example/utils/ui_theme.dart';
import 'package:app_example/view/atoms/custom_loading.dart';
import 'package:app_example/view/molecules/custom_background.dart';
import 'package:flutter/material.dart';

class HomeTemplate extends StatefulWidget {
  const HomeTemplate({
    this.result,
    required this.searchBar,
    required this.list,
  });
  final int? result;
  final TextField searchBar;
  final Widget list;

  @override
  _HomeTemplateState createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {
  double baseHeight = kToolbarHeight * 3;
  bool showOrnaments = true;

  @override
  build(_) => Scaffold(
      backgroundColor: Colors.white,
      body: Stack(fit: StackFit.expand, children: [
        Positioned(
            top: 0, child: CustomBackground(showOrnaments, height: baseHeight)),
        AnimatedPositioned(
            top: baseHeight - 30,
            width: MediaQuery.of(_).size.width,
            height: MediaQuery.of(_).size.height - baseHeight,
            curve: Curves.ease,
            duration: Duration(milliseconds: 350),
            child: FocusScope(
              child: Focus(
                onFocusChange: (hasFocus) => hasFocus
                    ? setState(() {
                        showOrnaments = false;
                        baseHeight = kToolbarHeight * 2;
                      })
                    : setState(() {
                        showOrnaments = true;
                        baseHeight = kToolbarHeight * 3;
                      }),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        widget.searchBar,
                        if (widget.result != null)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              '${widget.result! < 10 ? '0' : ""}'
                              '${widget.result} '
                              '${UITexts.totalFoundText.toLowerCase()}',
                              style: Theme.of(_).primaryTextTheme.headline3,
                            ),
                          ),
                        Expanded(
                            child: (widget.result == null)
                                ? CustomLoading(color: UI.secundaryColor)
                                : widget.list)
                      ]),
                ),
              ),
            )),
      ]));
}
