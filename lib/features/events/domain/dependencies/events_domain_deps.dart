part of 'dependencies.dart';

@riverpod
GetEventsUseCase getEventsUseCase(Ref ref) =>
    GetEventsUseCase(ref.read(eventsRepositoryProvider));

@riverpod
GetEventByIdUseCase getEventByIdUseCase(Ref ref) =>
    GetEventByIdUseCase(ref.read(eventsRepositoryProvider));

@riverpod
GetFeaturedEventsUseCase getFeaturedEventsUseCase(Ref ref) =>
    GetFeaturedEventsUseCase(ref.read(eventsRepositoryProvider));
