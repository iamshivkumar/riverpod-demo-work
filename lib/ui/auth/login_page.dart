import 'package:demo_fire/ui/auth/providers/auth_provider.dart';
import 'package:demo_fire/ui/root.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(authProvider);
    final notifier = ref.read(authProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: model.email,
              onChanged: notifier.emailChanged,
            ),
            SizedBox(height: 16),
            TextFormField(
              initialValue: model.password,
              onChanged: notifier.passwordChanged,
            ),
            SizedBox(
              height: 16,
            ),
            model.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed:
                        model.email.isNotEmpty && model.password.isNotEmpty
                            ? () async {
                                try {
                                  await notifier.login();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Root(),
                                    ),
                                  );
                                } catch (e) {}
                              }
                            : null,
                    child: Text(
                      'Login',
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
