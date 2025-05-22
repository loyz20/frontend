import 'package:flutter/material.dart';
import 'package:frontend/presentation/features/auth/viewmodels/login_viewmodel.dart';
import 'package:frontend/presentation/features/auth/widgets/login_form.dart';
import 'package:frontend/presentation/features/dashboard/views/dashboard_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final vm = Provider.of<LoginViewModel>(context, listen: false);

    Future<bool> handleLogin(String email, String password) async {
      final success = await vm.login(email, password);
      if (success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => DashboardPage()),
        );
      }
      return success;
    }


    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo atau judul
                Icon(Icons.medical_information, size: 80, color: theme.colorScheme.primary),
                const SizedBox(height: 16),
                Text(
                  'PBF System',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 32),
                LoginForm(onSubmit: handleLogin),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
