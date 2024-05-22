// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$autoRenewTokenHash() => r'b892525b1601bb638fc8c28878ece1f52e577aa2';

/// See also [autoRenewToken].
@ProviderFor(autoRenewToken)
final autoRenewTokenProvider = FutureProvider<int>.internal(
  autoRenewToken,
  name: r'autoRenewTokenProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$autoRenewTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AutoRenewTokenRef = FutureProviderRef<int>;
String _$credentialHash() => r'672b4a56a3c1d8d2be46a7b44f46635dc36ac2f5';

/// See also [Credential].
@ProviderFor(Credential)
final credentialProvider = AsyncNotifierProvider<Credential, Map<String, String>>.internal(
  Credential.new,
  name: r'credentialProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$credentialHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Credential = AsyncNotifier<Map<String, String>>;
String _$checkAvailabilityEmailHash() => r'fd80b6eec8864bfb05f9f67a0cc2ffee5e6fc69d';

/// See also [CheckAvailabilityEmail].
@ProviderFor(CheckAvailabilityEmail)
final checkAvailabilityEmailProvider = AutoDisposeAsyncNotifierProvider<CheckAvailabilityEmail, UnwrapResponse<Authentication>>.internal(
  CheckAvailabilityEmail.new,
  name: r'checkAvailabilityEmailProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$checkAvailabilityEmailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CheckAvailabilityEmail = AutoDisposeAsyncNotifier<UnwrapResponse<Authentication>>;
String _$checkVerificationCodeHash() => r'a3bbb034318df9f85cca32aa35c19e3e54737ad7';

/// See also [CheckVerificationCode].
@ProviderFor(CheckVerificationCode)
final checkVerificationCodeProvider = AutoDisposeAsyncNotifierProvider<CheckVerificationCode, UnwrapResponse<Authentication>>.internal(
  CheckVerificationCode.new,
  name: r'checkVerificationCodeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$checkVerificationCodeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CheckVerificationCode = AutoDisposeAsyncNotifier<UnwrapResponse<Authentication>>;
String _$createNewAccountHash() => r'82ea44deb25ab3f4be5f6b5f320c28c6b55d067b';

/// See also [CreateNewAccount].
@ProviderFor(CreateNewAccount)
final createNewAccountProvider = AutoDisposeAsyncNotifierProvider<CreateNewAccount, UnwrapResponse<Authentication>>.internal(
  CreateNewAccount.new,
  name: r'createNewAccountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$createNewAccountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CreateNewAccount = AutoDisposeAsyncNotifier<UnwrapResponse<Authentication>>;
String _$forgotPasswordHash() => r'8d7e022caeb84688174c434a9c96affbdfdf81dd';

/// See also [ForgotPassword].
@ProviderFor(ForgotPassword)
final forgotPasswordProvider = AutoDisposeAsyncNotifierProvider<ForgotPassword, UnwrapResponse<Authentication>>.internal(
  ForgotPassword.new,
  name: r'forgotPasswordProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$forgotPasswordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ForgotPassword = AutoDisposeAsyncNotifier<UnwrapResponse<Authentication>>;
String _$checkVerificationCodeForgotHash() => r'3f3b0c440cf94287e56634ceb4bcb2f0da56c2ae';

/// See also [CheckVerificationCodeForgot].
@ProviderFor(CheckVerificationCodeForgot)
final checkVerificationCodeForgotProvider = AutoDisposeAsyncNotifierProvider<CheckVerificationCodeForgot, UnwrapResponse<Authentication>>.internal(
  CheckVerificationCodeForgot.new,
  name: r'checkVerificationCodeForgotProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$checkVerificationCodeForgotHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CheckVerificationCodeForgot = AutoDisposeAsyncNotifier<UnwrapResponse<Authentication>>;
String _$resetPasswordHash() => r'c0542764019f43d27efd7d6d51233508886e029d';

/// See also [ResetPassword].
@ProviderFor(ResetPassword)
final resetPasswordProvider = AutoDisposeAsyncNotifierProvider<ResetPassword, UnwrapResponse<Authentication>>.internal(
  ResetPassword.new,
  name: r'resetPasswordProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$resetPasswordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ResetPassword = AutoDisposeAsyncNotifier<UnwrapResponse<Authentication>>;
String _$autoSignInHash() => r'f34eefe422a64205617a10bcd65777868f657ea9';

/// See also [AutoSignIn].
@ProviderFor(AutoSignIn)
final autoSignInProvider = AsyncNotifierProvider<AutoSignIn, int>.internal(
  AutoSignIn.new,
  name: r'autoSignInProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$autoSignInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AutoSignIn = AsyncNotifier<int>;
String _$changePasswordHash() => r'bc38acd702dddd7317a170362cf9ece6f3bdb943';

/// See also [ChangePassword].
@ProviderFor(ChangePassword)
final changePasswordProvider = AutoDisposeAsyncNotifierProvider<ChangePassword, int>.internal(
  ChangePassword.new,
  name: r'changePasswordProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$changePasswordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChangePassword = AutoDisposeAsyncNotifier<int>;
String _$deleteAccountHash() => r'5c34a64b9cee77930856a7eef2be669345e48e3a';

/// See also [DeleteAccount].
@ProviderFor(DeleteAccount)
final deleteAccountProvider = AutoDisposeAsyncNotifierProvider<DeleteAccount, int>.internal(
  DeleteAccount.new,
  name: r'deleteAccountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$deleteAccountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DeleteAccount = AutoDisposeAsyncNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
