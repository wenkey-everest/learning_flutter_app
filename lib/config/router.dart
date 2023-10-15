import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_flutter_app/presentation/screens/details_screen.dart';
import 'package:learning_flutter_app/presentation/screens/home_screen.dart';
import 'package:learning_flutter_app/utils/constants.dart';

final GoRouter router = GoRouter(initialLocation: "/", routes: <RouteBase>[
  GoRoute(
    path: homeScreenPath,
    name: homeScreen,
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: detailsScreenPath,
    name: detailsScreen,
    builder: (context, state) =>
        DetailsScreen(extra: state.extra! as Map<String, Widget>),
  ),
]);
