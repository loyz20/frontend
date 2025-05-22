import 'package:flutter/material.dart';
import 'package:frontend/presentation/features/auth/views/login_page.dart';
import 'package:frontend/presentation/features/dashboard/views/dashboard_page.dart';
import 'package:frontend/presentation/features/product/view/product_list_page.dart';
import 'package:frontend/presentation/features/splash/view/splash_page.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const productList = '/products';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());

      case productList:
        return MaterialPageRoute(builder: (_) => const ProductListPage());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text('Page not found')),
                ));
    }
  }
}
