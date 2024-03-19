import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/dimens.dart';
import '../../../utils/constants/strings.dart';
import '../../state/card/bloc.dart';
import '../../state/card/event.dart';
import '../../state/card/state.dart';
import 'settings_toggle.dart';

class CardSettings extends StatelessWidget {
  const CardSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardStackBloc, CardStackState>(
        builder: (context, state) {
      return Card(
        child: Padding(
          padding: EdgeInsets.all(Dimens.padding.normal),
          child: Column(
            children: [
              SettingsToggle(
                  title: Strings.cardPage.rotationText,
                  value: state.isRotated,
                  onChanged: (value) {
                    context.read<CardStackBloc>().add(ToggleCardRotation());
                  }),
              SettingsToggle(
                  title: Strings.cardPage.scrowIndicatorText,
                  value: state.showScrollBar,
                  onChanged: (value) {
                    context.read<CardStackBloc>().add(ToggleScrollBar());
                  }),
            ],
          ),
        ),
      );
    });
  }
}
