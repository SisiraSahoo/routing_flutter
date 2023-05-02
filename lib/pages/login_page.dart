import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_flutter/pages/controller/login_controller.dart';
import 'package:routing_flutter/pages/home_page.dart';

class LoginPage extends GetResponsiveView<LoginController> {
  static const routeName = '/login';
  static String getPath(String? redirectUrl) =>
      '$routeName?redirectUrl=${Uri.encodeQueryComponent(redirectUrl ?? HomePage.routeName)}';

  LoginPage({super.key});

  @override
  Widget? desktop() {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
        body: Center(
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: formKey,
          autovalidateMode: controller.autoValidateMode.value,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 22),
              const Text(
                'Advanced Routing',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 22),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  hintText: 'your@example.com',
                  labelText: 'Email',
                ),
                onSaved: controller.emailSaved,
                validator: (String? value) {
                  if (value!.isEmpty) return 'Email is required.';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  hintText: '*******',
                  labelText: 'Password',
                ),
                onSaved: controller.passwordSaved,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Password is required.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () => controller.login(formKey),
                child: const Text("Login"),
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
      )),
    ));
  }

  @override
  Widget? phone() {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            "assets/icons/login_bg.jpeg",
            fit: BoxFit.cover,
            alignment: const Alignment(0.0, -0.5),
          )),
          Center(
            child: Card(
                margin: const EdgeInsets.all(32),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  padding: const EdgeInsets.all(32),
                  child: Form(
                    key: formKey,
                    autovalidateMode: controller.autoValidateMode.value,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(height: 22),
                        const Text(
                          'Advanced Routing',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 22),
                        TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                            hintText: 'your@example.com',
                            labelText: 'Email',
                          ),
                          onSaved: controller.emailSaved,
                          validator: (String? value) {
                            if (value!.isEmpty) return 'Email is required.';
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                            hintText: '*******',
                            labelText: 'Password',
                          ),
                          onSaved: controller.passwordSaved,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Password is required.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 35),
                        ElevatedButton(
                          onPressed: () => controller.login(formKey),
                          child: const Text("Login"),
                        ),
                        const SizedBox(height: 22),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget? tablet() {
    return phone();
  }
}
