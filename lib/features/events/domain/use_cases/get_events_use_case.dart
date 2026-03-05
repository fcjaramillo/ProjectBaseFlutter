part of 'use_cases.dart';

class GetEventsUseCase {
  GetEventsUseCase(this._repository);
  final IEventsRepository _repository;
  Future<ResultDef<List<CampaignEvent>>> call() => _repository.getEvents();
}
