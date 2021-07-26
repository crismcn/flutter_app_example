import 'package:app_example/logic/home_searching_store.dart';
import 'package:app_example/utils/ui_texts.dart';
import 'package:app_example/view/atoms/enterprises_tile.dart';
import 'package:app_example/view/template/home_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatelessWidget {
  final _store = Modular.get<HomeSearchingStore>();

  HomePage() {
    _store.fetchEnterprises();
  }

  @override
  build(_) => Observer(
      builder: (_) => HomeTemplate(
            result: _store.enterprises?.length,
            searchBar: TextField(
              decoration: InputDecoration(
                hintText: UITexts.searchForCompaniesHintText,
                prefixIcon: Icon(Icons.search),
              ),
            ),
            list: Builder(builder: (_) {
              switch (_store.asyncEnterprises?.status ?? FutureStatus.pending) {
                case FutureStatus.pending:
                case FutureStatus.rejected:
                  return Container(); // TODO: RefreshIndicatorErrorFeedbackWidget
                case FutureStatus.fulfilled:
                  return ListView.builder(
                    itemCount: _store.enterprises?.length ?? 0,
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        EnterprisesTile(_store.enterprises![index]),
                  );
              }
            }),
          ));
}
