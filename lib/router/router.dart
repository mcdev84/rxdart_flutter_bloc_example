import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/blocs/authentication/sigup/sign_up_bloc.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';
import 'package:rx_dart/presentation/authentication/signin/sign_in_view.dart';
import 'package:rx_dart/presentation/authentication/signup/sign_up_view.dart';
import 'package:rx_dart/presentation/home/view/home.dart';
import 'package:rx_dart/presentation/splash/splash_screen.dart';
import 'package:rx_dart/presentation/templates/page_template.dart';
import 'package:rx_dart/presentation/widgets/products/widgets/single_product/single_product_page.dart';
import 'package:rx_dart/presentation/widgets/products/widgets/standard/standard_transition.dart';
import 'package:rx_dart/router/transitions/single_product_transition.dart';
// Create keys for `root` & `section` navigator avoiding unnecessary rebuilds

final _rootNavigatorKey = GlobalKey<NavigatorState>();
//final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: SplashScreen.routeName,
    routes: <RouteBase>[
      GoRoute(
          name: SplashScreen.name,
          path: SplashScreen.routeName,
          pageBuilder: (context, state) =>
              StandardTransition(child: SplashScreen())),
      GoRoute(
          name: HomePage.name,
          path: HomePage.routeName,
          pageBuilder: (context, state) =>
              StandardTransition(child: const PageTemplate(child: HomePage()))),
      GoRoute(
          name: SignInPage.name,
          path: SignInPage.routeName,
          pageBuilder: (context, state) =>
              StandardTransition(child: const SignInPage())),
      GoRoute(
          name: SignUpPage.name,
          path: SignUpPage.routeName,
          pageBuilder: (context, state) => StandardTransition(
              child: BlocProvider<SignUpBloc>(
                  create: (_) => GetIt.instance.get<SignUpBloc>(),
                  child: const SignUpPage()))),
      GoRoute(
          name: SingleProductPage.name,
          path: SingleProductPage.routeName,
          pageBuilder: (context, state) => SingleProductSlideTransition(
              child: SingleProductPage(product: state.extra as ProductEntity)))
    ]);
