import 'package:accessibility_workshop/presentation/widgets/transaction_activity_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Transaction Activity List Accessibility Test', (tester) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(),
        builder: (context, child) {
          return const TransactionActivityList();
        },
      ),
    );
    await accessibilityGuidelineChecker(tester);
    handle.dispose();
  });
}

Future<void> accessibilityGuidelineChecker(WidgetTester tester) async {
  await expectLater(tester, meetsGuideline(textContrastGuideline));
  await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
  await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
  await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
}
