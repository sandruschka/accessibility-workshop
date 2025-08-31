import 'dart:async';

import 'package:accessibility_workshop/theme/theme.dart';
import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      goldenTestTheme:
          GoldenTestTheme.standard().copyWith(
                backgroundColor: Colors.white,
                borderColor: Colors.black,
                nameTextStyle: const TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
              )
              as GoldenTestTheme,
      theme: const MaterialTheme(TextTheme()).light(),
    ),
    run: testMain,
  );
}
