// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchProfileHash() => r'4b33f470a97a1990e3b83aa56c316405f93fde62';

/// See also [fetchProfile].
@ProviderFor(fetchProfile)
final fetchProfileProvider = AutoDisposeFutureProvider<UnwrapResponse<Profile>>.internal(
  fetchProfile,
  name: r'fetchProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$fetchProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchProfileRef = AutoDisposeFutureProviderRef<UnwrapResponse<Profile>>;
String _$editNameHash() => r'7d2e6e745802cd9a80bd16f188e64dd5208a48d5';

/// See also [EditName].
@ProviderFor(EditName)
final editNameProvider = AutoDisposeAsyncNotifierProvider<EditName, int>.internal(
  EditName.new,
  name: r'editNameProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$editNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EditName = AutoDisposeAsyncNotifier<int>;
String _$editInformationHash() => r'568a680715f87ac7c25af3dca6c388238c4e7249';

/// See also [EditInformation].
@ProviderFor(EditInformation)
final editInformationProvider = AutoDisposeAsyncNotifierProvider<EditInformation, int>.internal(
  EditInformation.new,
  name: r'editInformationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$editInformationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EditInformation = AutoDisposeAsyncNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
