import 'package:adstacks_media/core/contants/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const AdStacksApp());
}

class AdStacksApp extends StatelessWidget {
  const AdStacksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AdStacks Dashboard',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const DashboardScreen(),
    );
  }
}
