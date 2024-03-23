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
String _$credentialHash() => r'e854265711a1daa49bd386c436ec0f8536098be2';

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
String _$createNewAccountHash() => r'fbf009d0b725389bb1326da0ef4f3b11b6ab1c35';

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
String _$signInHash() => r'78fee32387a06d3c17b394bf6b6f2ade87e94d14';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
