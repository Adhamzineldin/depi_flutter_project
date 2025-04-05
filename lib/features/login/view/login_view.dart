import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/routes/app_router.dart';
import '../view_model/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LoginViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Text('Hello', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const Text('Again!', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 8),
              const Text('Welcome back you\'ve\nbeen missed', style: TextStyle(fontSize: 16, color: Colors.grey)),
              const SizedBox(height: 40),
              _buildUsernameField(vm),
              const SizedBox(height: 16),
              _buildPasswordField(vm),
              const SizedBox(height: 16),
              _buildRememberMeRow(vm),
              const SizedBox(height: 24),
              _buildLoginButton(context, vm),
              const SizedBox(height: 16),
              const Center(child: Text('or continue with')),
              const SizedBox(height: 16),
              _buildSocialLoginButtons(),
              const Spacer(),
              _buildSignUpRow(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameField(LoginViewModel vm) {
    return TextField(
      onChanged: vm.setUsername,
      decoration: const InputDecoration(
        labelText: 'Username*',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPasswordField(LoginViewModel vm) {
    return TextField(
      obscureText: true,
      onChanged: vm.setPassword,
      decoration: InputDecoration(
        labelText: 'Password*',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.visibility_off),
          onPressed: () {}, // Toggle visibility in advanced version
        ),
      ),
    );
  }

  Widget _buildRememberMeRow(LoginViewModel vm) {
    return Row(
      children: [
        Checkbox(
          value: vm.rememberMe,
          onChanged: vm.toggleRememberMe,
        ),
        const Text('Remember me'),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text('Forgot the password?', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context, LoginViewModel vm) {
    return ElevatedButton(
      onPressed: vm.isFormValid
          ? () {
        Navigator.pushReplacementNamed(context, AppRouter.exploreRoute);
      }
          : null,
      child: const Text('Login', style: TextStyle(fontSize: 16)),
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.facebook, color: Colors.blue),
            label: const Text('Facebook'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Image.asset('assets/images/google_icon.png', height: 24),
            label: const Text('Google'),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("don't have an account?"),
        TextButton(
          onPressed: () {},
          child: const Text('Sign Up', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
