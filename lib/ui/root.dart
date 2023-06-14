import 'package:demo_fire/ui/auth/login_page.dart';
import 'package:demo_fire/ui/auth/providers/user_provider.dart';
import 'package:demo_fire/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';



class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final user = ref.read(userProvider).asData?.value;
    return user == null? LoginPage(): HomePage();
  }
}