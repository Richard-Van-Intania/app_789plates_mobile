import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../initialize.dart';
import '../../main.dart';
import '../../provider.dart';

class CreateNewAccountScreen extends StatefulHookConsumerWidget {
  const CreateNewAccountScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateNewAccountScreenState();
}

class _CreateNewAccountScreenState extends ConsumerState<CreateNewAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final createNewAccount = ref.watch(createNewAccountProvider);
    final controller1 = useTextEditingController();
    final controller2 = useTextEditingController();
    final pendingFetch = useState<Future<void>?>(null);
    final snapshot = useFuture(pendingFetch.value);
    final isErrored = snapshot.hasError && snapshot.connectionState != ConnectionState.waiting;
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      switch (createNewAccount) {
        case AsyncValue(:final error?):
          print(error.toString());
        case AsyncValue(:final valueOrNull?):
          if (valueOrNull.statusCode == 200) {
            ref.invalidate(routingConfigProvider);
            // Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MyHomePage()), (Route<dynamic> route) => false);
          } else {
            print(valueOrNull.statusCode);
          }
        default:
      }
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
                key: _formKey,
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
                  onPressed: (snapshot.connectionState == ConnectionState.waiting)
                      ? null
                      : () {
                          if (_formKey.currentState!.validate() && (controller1.text.trim() == controller2.text.trim())) {
                            pendingFetch.value = ref.read(createNewAccountProvider.notifier).fetch(controller1.text.trim());
                            FocusScope.of(context).unfocus();
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
