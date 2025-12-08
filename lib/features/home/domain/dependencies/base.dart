part of 'dependencies.dart';

@riverpod
BaseRepository baseapiUnRepository(Ref ref) => BaseRepository(
      ref.read(baseapiUnDataSourceProvider),
    );

@riverpod
GetExampleUseCase getExampleUseCase(Ref ref) => GetExampleUseCase(
      ref.read(baseapiUnRepositoryProvider),
    );
