import 'package:accessibility_workshop/data/transactions.dart';
import 'package:accessibility_workshop/presentation/widgets/transaction_tile.dart';
import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

void main() {
  goldenTest(
    'TransactionTileSemantics',
    fileName: 'transaction_tile_semantics',
    pumpWidget: (tester, widget) async {
      await tester.pumpWidget(
        SemanticsDebugger(
          labelStyle: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontSize: 10,
          ),
          child: widget,
        ),
      );
    },
    builder: () {
      return GoldenTestGroup(
        children: [
          TransactionTile(
            title: 'Title',
            date: DateTime(2023, 12, 30),
            amount: 12,
            provider: 'Visa',
            type: TransactionType.reimbursement,
          ),
          TransactionTile(
            title: 'Title',
            date: DateTime(2023, 12, 30),
            amount: 12,
            provider: 'Visa',
            type: TransactionType.payment,
          ),
        ],
      );
    },
  );

  /*  testWidgets('Check accessibility guidelines', (tester) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(
      MaterialApp(
        theme: MaterialTheme(TextTheme()).light(),
        home: Material(
          child: TransactionTile(
            title: 'John D.',
            date: DateTime(2025, 2, 20),
            amount: 12.99,
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
  }); */
}
