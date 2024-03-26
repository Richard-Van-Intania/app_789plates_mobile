// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
String _$credentialHash() => r'c28d721fc6df56cdd8478fde02600bf0babb1b22';

/// See also [Credential].
@ProviderFor(Credential)
final credentialProvider = AsyncNotifierProvider<Credential, Authentication>.internal(
  Credential.new,
  name: r'credentialProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$credentialHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Credential = AsyncNotifier<Authentication>;
String _$checkAvailabilityEmailHash() => r'42c8e6d932b9a71a9bd62e99ec60564745207298';

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
String _$checkVerificationCodeHash() => r'037753dcc681781da1bd4b737e07d2a88fab431e';

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
String _$createNewAccountHash() => r'2bc889803434359938c55cbabd473d14db7b965a';

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
String _$signInHash() => r'fd45aea2acd91426389782a95b9b13df6cc61d97';

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
String _$forgotPasswordHash() => r'd31f1c367e310fa59ec5bf4d9b2e2b4df008d297';

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
String _$checkVerificationCodeForgotHash() => r'68b2733afbd079ea77a5df74ae81c636be046eb9';

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
String _$resetPasswordHash() => r'59483782dd9a20f0ad6fdbc23e81d80756f8e26b';

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
String _$renewTokenHash() => r'e8a1e3ceb95fe1c707a0ec73caeeb325b0841013';

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
String _$searchHash() => r'a35c2c6fb178907b57d087fdc5b649fb6096b90e';

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
