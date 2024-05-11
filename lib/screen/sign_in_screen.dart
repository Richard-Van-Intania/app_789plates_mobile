import 'package:app_789plates_mobile/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'create_new_account/check_availability_email_screen.dart';
import 'reset_password/forgot_password_screen.dart';

class SignInScreen extends StatefulHookConsumerWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dynamicRouteConfig = ref.watch(dynamicRouteConfigProvider);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final pendingFetch = useState<Future<void>?>(null);
    final snapshot = useFuture(pendingFetch.value);
    final isErrored = snapshot.hasError && snapshot.connectionState != ConnectionState.waiting;
    // WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
    //   switch (dynamicRouteConfig) {
    //     case AsyncValue(:final error?):
    //       print(error.toString());
    //     case AsyncValue(:final valueOrNull?):
    //       if (valueOrNull == 200) {
    //         // context.go('/home');
    //       } else {
    //         print(valueOrNull);
    //       }
    //     default:
    //   }
    // });
    return dynamicRouteConfig.when(
      data: (data) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  Form(
                    key: key,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: const OutlineInputBorder(),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter  emailAddress';
                            } else if (!EmailValidator.validate(value.trim().toLowerCase())) {
                              return 'emailAddress not correct';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          maxLength: 32,
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            errorMaxLines: 5,
                            hintText: 'Password',
                            border: const OutlineInputBorder(),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter  password';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                      onPressed: (snapshot.connectionState == ConnectionState.waiting)
                          ? null
                          : () {
                              if (key.currentState!.validate()) {
                                pendingFetch.value = ref.read(dynamicRouteConfigProvider.notifier).fetch(emailController.text.trim().toLowerCase(), passwordController.text.trim());
                                FocusScope.of(context).unfocus();
                              }
                            },
                      child: Text('signin')),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('sign in with google'),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('sign in with facebook'),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                    },
                    child: Text('forgot password'),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CheckAvailabilityEmailScreen()));
                    },
                    child: Text('create new account'),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
            // floatingActionButton: FloatingActionButton(onPressed: () {
            //   context.go('/error');
            // }),
          ),
        );
      },
      error: (error, stackTrace) => const Center(child: Text('Uh oh. Something went wrong!')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
