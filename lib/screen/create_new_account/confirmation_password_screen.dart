import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../initialize.dart';
import '../../provider.dart';

class ConfirmationPasswordScreen extends StatefulHookConsumerWidget {
  const ConfirmationPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfirmationPasswordScreenState();
}

class _ConfirmationPasswordScreenState extends ConsumerState<ConfirmationPasswordScreen> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller1 = useTextEditingController();
    final TextEditingController controller2 = useTextEditingController();
    final bool isLoading = ref.watch(loadingProvider);
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      //
    });
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Password'),
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 96,
              ),
              Form(
                key: key,
                child: Column(
                  children: [
                    TextFormField(
                      maxLength: 32,
                      obscureText: true,
                      controller: controller1,
                      decoration: InputDecoration(
                        errorMaxLines: 5,
                        hintText: 'Password',
                        border: const OutlineInputBorder(),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some password';
                        } else if (!regex.hasMatch(value)) {
                          return 'password should contain at least one upper case, one lower case, one digit, 8 characters in length';
                        } else if (controller1.text.trim() != controller2.text.trim()) {
                          return 'password not match';
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
                      controller: controller2,
                      decoration: InputDecoration(
                        errorMaxLines: 5,
                        hintText: 'Confirm password',
                        border: const OutlineInputBorder(),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some password';
                        } else if (!regex.hasMatch(value)) {
                          return 'password should contain at least one upper case, one lower case, one digit, 8 characters in length';
                        } else if (controller1.text.trim() != controller2.text.trim()) {
                          return 'password not match';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          if (key.currentState!.validate()) {
                            //
                            FocusScope.of(context).unfocus();
                            ref.read(loadingProvider.notifier).toggle(true);
                            // context.go('/myhomepage');
                          }
                        },
                  child: Text('Ok')),
            ],
          ),
        ),
      ),
    );
  }
}
