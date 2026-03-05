part of 'dependencies.dart';

@riverpod
GetLifeMilestonesUseCase getLifeMilestonesUseCase(Ref ref) =>
    GetLifeMilestonesUseCase(ref.read(lifeStoryRepositoryProvider));
