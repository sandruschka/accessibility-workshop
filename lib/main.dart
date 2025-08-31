import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:accessibility_workshop/presentation/home_page.dart';
import 'package:flutter/material.dart';

import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp(enableAccessibilityTool: false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.enableAccessibilityTool});
  final bool enableAccessibilityTool;

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    MaterialTheme theme = const MaterialTheme(TextTheme());

    return MaterialApp(
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      builder: (context, child) {
        if (enableAccessibilityTool) child = AccessibilityTools(child: child);
        return child!;
      },
      home: const HomePage(),
    );
  }
}
