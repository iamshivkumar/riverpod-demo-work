import 'package:demo_fire/ui/auth/models/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() {
    return AuthState();
  }

  final _auth = FirebaseAuth.instance;

  void emailChanged(String v) {
    state = state.copyWith(email: v);
  }

  void passwordChanged(String v) {
    state = state.copyWith(password: v);
  }

  Future<void> login() async {
    try {
      state = state.copyWith(
        loading: true,
      );
      await _auth.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
    } catch (e) {
      state = state.copyWith(loading: false);
      return Future.error(e);
    }
  }
}
