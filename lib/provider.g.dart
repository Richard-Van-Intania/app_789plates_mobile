// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$autoSignInHash() => r'4b4c1b53ce7926d2fc16f6c3fddec78ef416858b';

/// See also [autoSignIn].
@ProviderFor(autoSignIn)
final autoSignInProvider = FutureProvider<UnwrapResponse<Authentication>>.internal(
  autoSignIn,
  name: r'autoSignInProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$autoSignInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AutoSignInRef = FutureProviderRef<UnwrapResponse<Authentication>>;
String _$localeUpdateHash() => r'ecfb82dc371b6f83400840c8a6a4a1050dbab199';

/// See also [LocaleUpdate].
@ProviderFor(LocaleUpdate)
final localeUpdateProvider = AutoDisposeNotifierProvider<LocaleUpdate, Locale>.internal(
  LocaleUpdate.new,
  name: r'localeUpdateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$localeUpdateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocaleUpdate = AutoDisposeNotifier<Locale>;
String _$tabIndexHash() => r'94c85a9090a1843123f5e566f8b967538c3c5b69';

/// See also [TabIndex].
@ProviderFor(TabIndex)
final tabIndexProvider = AutoDisposeNotifierProvider<TabIndex, int>.internal(
  TabIndex.new,
  name: r'tabIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$tabIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TabIndex = AutoDisposeNotifier<int>;
String _$drawerIndexHash() => r'a09012e30c1335159b5e2eb1a29bf036d42bd255';

/// See also [DrawerIndex].
@ProviderFor(DrawerIndex)
final drawerIndexProvider = AutoDisposeNotifierProvider<DrawerIndex, int>.internal(
  DrawerIndex.new,
  name: r'drawerIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$drawerIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DrawerIndex = AutoDisposeNotifier<int>;
String _$themeModeUpdateHash() => r'dabfd75d393239efa938cb4d1a28a4224c892c78';

/// See also [ThemeModeUpdate].
@ProviderFor(ThemeModeUpdate)
final themeModeUpdateProvider = AutoDisposeNotifierProvider<ThemeModeUpdate, ThemeMode>.internal(
  ThemeModeUpdate.new,
  name: r'themeModeUpdateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$themeModeUpdateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeModeUpdate = AutoDisposeNotifier<ThemeMode>;
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
String _$signInHash() => r'7092e23b9d2eb7a6fd674bb7ae0cf33c261f8476';

/// See also [SignIn].
@ProviderFor(SignIn)
final signInProvider = AutoDisposeAsyncNotifierProvider<SignIn, UnwrapResponse<Authentication>>.internal(
  SignIn.new,
  name: r'signInProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$signInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignIn = AutoDisposeAsyncNotifier<UnwrapResponse<Authentication>>;
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
String _$renewTokenHash() => r'234e090690ceb0eb76f181a735d827dea1e69044';

/// See also [RenewToken].
@ProviderFor(RenewToken)
final renewTokenProvider = AutoDisposeAsyncNotifierProvider<RenewToken, UnwrapResponse<Authentication>>.internal(
  RenewToken.new,
  name: r'renewTokenProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$renewTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RenewToken = AutoDisposeAsyncNotifier<UnwrapResponse<Authentication>>;
String _$searchHash() => r'38efee8581af7ee1767822837f6a390959b43a77';

/// See also [Search].
@ProviderFor(Search)
final searchProvider = AutoDisposeAsyncNotifierProvider<Search, String>.internal(
  Search.new,
  name: r'searchProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$searchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Search = AutoDisposeAsyncNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
