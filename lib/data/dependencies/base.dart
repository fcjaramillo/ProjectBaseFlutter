part of 'dependencies.dart';

@riverpod
ApiUtils baseapiUn(Ref ref) => ApiUtils(
      client: ref.watch(clientProvider),
      host: 'kRootPathTrapi',
    );

@riverpod
BaseDataSource baseapiUnDataSource(Ref ref) => BaseDataSource(
      ref.read(baseapiUnProvider),
    );
