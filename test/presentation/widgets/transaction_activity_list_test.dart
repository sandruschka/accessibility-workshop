import 'package:accessibility_workshop/presentation/widgets/transaction_activity_list.dart';
import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

import '../../utils/screens/testing_device.dart';

void main() {
  goldenTest(
    'TransactionActivityListSemantics',
    fileName: 'transaction_activity_list_semantics',
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
        children: [SizedBox.fromSize(size: TestingDevice.pixel3a.size, child: TransactionActivityList())],
      );
    },
  );
}
