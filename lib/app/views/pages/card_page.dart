import 'package:flutter/material.dart';
import 'package:week2/app/views/widgets/cards.dart';
import 'package:week2/app/views/widgets/settings_toggle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/dimens.dart';
import '../../../utils/constants/strings.dart';
import '../../state/card/bloc.dart';

import '../../state/card/event.dart';
import '../widgets/card_settings.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardStackBloc()..add(InitializeStack()),
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(Dimens.padding.medium).copyWith(
              top: Dimens.padding.extremePadding,
              bottom: Dimens.padding.extremePadding,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    Strings.cardPage.titleText,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: Dimens.padding.medium),
                  const Cards(),
                  SizedBox(height: Dimens.padding.large),
                  const CardSettings()
                ]),
          ),
        ),
      ),
    );
  }
}
