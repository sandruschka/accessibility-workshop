import 'package:accessibility_workshop/data/transactions.dart';
import 'package:accessibility_workshop/presentation/widgets/transaction_tile.dart';
import 'package:accessibility_workshop/theme/theme.dart';
import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
  });

  /* testWidgets('pumpAndSettle hangs at flushSemantics with SemanticsDebugger', (WidgetTester tester) async {
    // Wrap anything with SemanticsDebugger
    await tester.pumpWidget(
      const MaterialApp(
        home: SemanticsDebugger(child: Scaffold(body: Text('Hello semantics!'))),
      ),
    );

    // This will TIME OUT because we never reach sendSemanticsUpdate
    expect(
      () async => await tester.pumpAndSettle(Durations.extralong4, EnginePhase.flushSemantics, Durations.extralong4),
      throwsA(isA<TestFailure>()),
    );
  });

  testWidgets('pumpAndSettle works at sendSemanticsUpdate', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SemanticsDebugger(child: Scaffold(body: Text('Hello semantics!'))),
      ),
    );

    // This works because semantics are fully sent to the engine
    await tester.pumpAndSettle(Durations.extralong4, EnginePhase.sendSemanticsUpdate, Durations.extralong4);
  });

  testWidgets('pumpAndSettle works at compositing (skips semantics)', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SemanticsDebugger(child: Scaffold(body: Text('Hello semantics!'))),
      ),
    );

    // Works because semantics are skipped entirely
    await tester.pumpAndSettle(Durations.extralong4, EnginePhase.composite, Durations.extralong4);
  });
 */
  goldenTest(
    'TransactionTileSemantics',
    fileName: 'transaction_tile_semantics',
    pumpWidget: (tester, widget) async {
      await tester.pumpWidget(
        SemanticsDebugger(
          labelStyle: const TextStyle(fontFamily: 'Montserrat', color: Colors.black, fontSize: 10),
          child: widget,
        ),
      );
    },
    builder: () {
      return GoldenTestGroup(
        children: [
          TransactionTile(
            title: 'Title',
            date: DateTime(2025, 2, 20),
            amount: 12,
            provider: 'MasterCard',
            type: TransactionType.payment,
            onTap: () {},
          ),
          TransactionTile(
            title: 'Title',
            date: DateTime(2023, 12, 30),
            amount: 12,
            provider: 'Visa',
            type: TransactionType.reimbursement,
          ),
        ],
      );
    },
  );

  testWidgets('Check accessibility guidelines', (tester) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(
      MaterialApp(
        theme: MaterialTheme(TextTheme()).light(),
        home: Material(
          child: TransactionTile(
            title: 'Title',
            date: DateTime(2025, 2, 20),
            amount: 12,
            provider: 'MasterCard',
            type: TransactionType.payment,
            onTap: () {},
          ),
        ),
      ),
    );

    await expectLater(tester, meetsGuideline(textContrastGuideline));
    await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));

    handle.dispose();
  });
}
