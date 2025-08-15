import 'package:accessibility_workshop/presentation/widgets/home_search_header.dart';
import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  goldenTest(
    'HomeSearchHeaderSemantics',
    fileName: 'home_search_header_semantics',
    pumpWidget: (tester, widget) async {
      await tester.pumpWidget(
        SemanticsDebugger(
          labelStyle: const TextStyle(fontFamily: 'Montserrat', color: Colors.black, fontSize: 10),
          child: widget,
        ),
      );
    },
    builder: () {
      return GoldenTestGroup(children: [HomeSearchHeader()]);
    },
  );
}
