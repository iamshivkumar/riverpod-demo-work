import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
   factory AuthState({
   @Default('')  String email,
   @Default('')  String password,
   @Default(false)  bool loading,
  }) = _AuthState;
}




