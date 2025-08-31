import 'package:accessibility_workshop/presentation/widgets/home_search_header.dart';
import 'package:accessibility_workshop/theme/theme.dart';
import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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

  testWidgets('Check accessibility guidelines', (tester) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(
      MaterialApp(
        theme: MaterialTheme(TextTheme()).light(),
        home: Material(child: HomeSearchHeader()),
      ),
    );

    await expectLater(tester, meetsGuideline(textContrastGuideline));
    await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));

    handle.dispose();
  });
}
