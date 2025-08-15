import 'package:accessibility_workshop/presentation/home_page.dart';
import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/screens/testing_device.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  goldenTest(
    'HomeSearchHeaderSemantics',
    fileName: 'home_search_page_semantics',
    pumpBeforeTest: (tester) => tester.pump(Durations.extralong1),
    builder: () {
      return GoldenTestGroup(
        children: [
          SizedBox.fromSize(
            size: TestingDevice.pixel3a.size,
            child: const SemanticsDebugger(
              labelStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.black),
              child: HomePage(),
            ),
          ),
          SizedBox.fromSize(
            size: TestingDevice.pixel3a.size,
            child: ExcludeSemantics(child: HomePage()),
          ),
        ],
      );
    },
  );
}
