import 'package:accessibility_workshop/presentation/widgets/balance_card.dart';
import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

import '../../utils/screens/testing_device.dart';

void main() {
  goldenTest(
    'BalanceCardSemantics',
    fileName: 'balance_card_semantics',
    pumpBeforeTest: (tester) {
      return tester.pump(Durations.medium1);
    },
    builder: () {
      return GoldenTestGroup(
        children: [
          SemanticsDebugger(
            labelStyle: const TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontSize: 10,
            ),
            child: SizedBox.fromSize(
              size: TestingDevice.pixel3a.size,
              child: BalanceCard(
                seeAll: false,
              ),
            ),
          ),
          ExcludeSemantics(
            child: GoldenTestScenario(
              name: 'Default',
              child: BalanceCard(),
            ),
          ),
          ExcludeSemantics(
            child: GoldenTestScenario(
              name: 'Expanded',
              child: BalanceCard(seeAll: true),
            ),
          ),
        ],
      );
    },
  );
}
