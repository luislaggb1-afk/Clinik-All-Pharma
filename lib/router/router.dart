
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/layout/persistent_layout.dart';
import 'package:myapp/screens/compendium_screen.dart';
import 'package:myapp/screens/dashboard_screen.dart';
import 'package:myapp/screens/dose_calculator_screen.dart';
import 'package:myapp/screens/interactions_screen.dart';

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
          builder: (context, state) => const DoseCalculatorScreen(),
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
