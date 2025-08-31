import 'package:accessibility_workshop/presentation/home_page.dart';
import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/screens/testing_device.dart';

void main() {
  goldenTest(
    'HomeSearchHeaderSemantics',
    fileName: 'home_search_page_semantics',
    pumpWidget: (tester, widget) async {
      await tester.pumpWidget(
        SemanticsDebugger(
          labelStyle: const TextStyle(fontFamily: 'Montserrat', color: Colors.black, fontSize: 10),
          child: widget,
        ),
      );
    },
    whilePerforming: press(find.byType(ListTile)),
    builder: () {
      return GoldenTestGroup(
        children: [SizedBox.fromSize(size: TestingDevice.pixel3a.size, child: HomePage())],
      );
    },
  );
}
