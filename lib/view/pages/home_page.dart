import 'package:app_example/utils/ui_texts.dart';
import 'package:app_example/utils/ui_theme.dart';
import 'package:app_example/view/atoms/enterprises_tile.dart';
import 'package:app_example/view/template/home_template.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  build(_) => HomeTemplate(
        result: 0,
        searchBar: TextField(
          decoration: InputDecoration(
            hintText: UITexts.searchForCompaniesHintText,
            prefixIcon: Icon(Icons.search),
          ),
        ),
        list: ListView.builder(
          itemCount: 0,
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => Container(),
        ),
      );
}
