import 'package:flutter/material.dart';
import 'package:products_app/providers/login_form_provider.dart';
import 'package:products_app/styles/input_decorations.dart';
import 'package:products_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const _TitleLogin(),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: const _LoginForm(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Text("Crear nueva cuenta"),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleLogin extends StatelessWidget {
  const _TitleLogin();

  @override
  Widget build(BuildContext context) {
    return Text(
      "Sign in",
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginFormProvider = Provider.of<LoginFormProvider>(context);

    return SizedBox(
      child: Form(
        key: loginFormProvider.loginFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                labelText: 'Email',
                hintText: 'example@domain.com',
                prefixIcon: const Icon(
                  Icons.alternate_email_sharp,
                  color: Colors.deepPurple,
                ),
              ),
              onChanged: (value) => loginFormProvider.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Valor ingresado incorrecto';
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: const Icon(
                  Icons.lock_outlined,
                  color: Colors.deepPurple,
                ),
              ),
              onChanged: (value) => loginFormProvider.password = value,
              validator: (value) {
                if (value != null && value.length >= 6) return null;
                return 'Cantidad de caracteres incorrectos';
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
              elevation: 0,
              color: Colors.deepPurple,
              disabledColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: loginFormProvider.isLoading
                  ? null
                  : () => callToActionButtonlogin(
                        loginFormProvider,
                        context,
                      ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 15,
                ),
                child: Text(
                  loginFormProvider.isLoading ? "Espere..." : "Login",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  callToActionButtonlogin(
    LoginFormProvider provier,
    BuildContext context,
  ) async {
    if (provier.isValidForm()) {
      provier.isLoading = true;
      FocusScope.of(context).unfocus();
      await Future.delayed(const Duration(seconds: 3));
      provier.isLoading = false;
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, 'home');
    }
  }
}
