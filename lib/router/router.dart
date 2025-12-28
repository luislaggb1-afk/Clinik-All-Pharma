
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:clinik_all_pharma/layout/persistent_layout.dart';
import 'package:clinik_all_pharma/screens/calculator_screen.dart';
import 'package:clinik_all_pharma/screens/compendium_screen.dart';
import 'package:clinik_all_pharma/screens/dashboard_screen.dart';
import 'package:clinik_all_pharma/screens/interactions_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/dashboard',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return PersistentLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/calculator',
          builder: (context, state) => const CalculatorScreen(),
        ),
        GoRoute(
          path: '/compendium',
          builder: (context, state) => const CompendiumScreen(),
        ),
        GoRoute(
          path: '/interactions',
          builder: (context, state) => const InteractionsScreen(),
        ),
      ],
    ),
  ],
);
