import 'package:flutter/material.dart';
import 'package:frontend/presentation/features/auth/viewmodels/login_viewmodel.dart';
import 'package:frontend/presentation/features/dashboard/viewmodels/dashboard_viewmodel.dart';
import 'package:frontend/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => DashboardViewModel()), // init token kosong dulu
      ],
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.login,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
