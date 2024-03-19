import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'dart:math' as math;

import '../../../utils/constants/dimens.dart';
import '../../state/card/bloc.dart';
import '../../state/card/state.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final SwiperController _swiperController = SwiperController();
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];
  final List<double> rotationAngles = [0, 5, 10, 15];
  int _currentIndex = 0;

  Matrix4 _cardRotation1(int index) {
    int positionDifference =
        ((index - _currentIndex + colors.length) % colors.length);

    if (positionDifference > 0 && positionDifference <= 3) {
      double rotationDegrees = 5.0 * positionDifference;
      double radians = rotationDegrees * (math.pi / 180);
      return Matrix4.identity()..rotateZ(radians);
    }

    return Matrix4.identity();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _swiperController.addListener(() {
      print("Dragging");
      setState(() {
        _currentIndex = _swiperController.index!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardStackBloc, CardStackState>(
      builder: (context, state) {
        return Expanded(
          child: Stack(
            children: [
              Swiper(
                allowImplicitScrolling: true,
                itemCount: colors.length,
                controller: _swiperController,
                itemWidth: 250.0,
                itemHeight: 400.0,
                axisDirection: AxisDirection.right,
                layout: SwiperLayout.STACK,
                itemBuilder: (BuildContext context, int index) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: !state.isRotated
                        ? Matrix4.identity()
                        : _cardRotation1(index),
                    child: Container(
                      width: 250,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colors[index],
                      ),
                    ),
                  );
                },
                onIndexChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
