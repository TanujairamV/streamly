import 'package:flutter/material.dart';

import 'screens/ai_chat_screen.dart';
import 'screens/subscription_screen.dart';
import 'theme/app_theme.dart';
import 'widgets/app_navigation_bar.dart';

void main() {
  runApp(const StreamlyApp());
}

class StreamlyApp extends StatefulWidget {
  const StreamlyApp({super.key});

  @override
  State<StreamlyApp> createState() => _StreamlyAppState();
}

class _StreamlyAppState extends State<StreamlyApp> {
  int _currentIndex = 0;

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: JeevSwasthTheme.light,
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            SubscriptionScreen(
              onOpenAiChat: () => _changeTab(1),
            ),
            const AiChatScreen(),
          ],
        ),
        bottomNavigationBar: AppNavigationBar(
          currentIndex: _currentIndex,
          onDestinationSelected: _changeTab,
        ),
      ),
    );
  }
}