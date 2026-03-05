part of 'use_cases.dart';

class GetEventByIdUseCase {
  GetEventByIdUseCase(this._repository);
  final IEventsRepository _repository;
  Future<ResultDef<CampaignEvent?>> call(String id) =>
      _repository.getEventById(id);
}
