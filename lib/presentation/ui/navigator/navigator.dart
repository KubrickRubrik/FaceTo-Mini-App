import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/ui/pages/b_init/controller.dart';
import 'package:facetomini/presentation/ui/pages/c_home/controller.dart';
import 'package:go_router/go_router.dart';

abstract final class PagesNavigator {
  static RouterConfig<Object>? goRoutes(StateApp stateApp) {
    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/series',
      redirect: (context, state) {
        print("Сессия: $stateApp | Путь: ${state.path}");
        if (stateApp != StateApp.isAuth) return '/';
        if (stateApp == StateApp.isAuth && state.path == '/') return '/series';
        return null;
      },
      routes: [
        GoRoute(
          name: 'init',
          path: '/',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: _transitFade,
              child: const InitPage(),
            );
          },
        ),
        GoRoute(
          name: 'series',
          path: '/series',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: _transitFade,
              child: const HomePage(),
            );
          },
        ),
      ],
    );
  }

  /// Fade
  static Widget _transitFade(_, Animation<double> animation, Animation<double> secAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  /// Slide
  static Widget _transitSlide(_, Animation<double> animation, Animation<double> secAnimation, child) {
    const begin = Offset(1, 1);
    const end = Offset.zero;
    const curve = Curves.easeOut;

    final tween = Tween(begin: begin, end: end);
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );
    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }

  /// Scale
  static Widget _transitScale(_, Animation<double> animation, Animation<double> secAnimation, child) {
    return ScaleTransition(
      scale: animation,
      alignment: Alignment.bottomRight,
      child: child,
    );
  }
}
