part of 'use_cases.dart';

class SendContactMessageUseCase {
  final IContactRepository _repository;

  SendContactMessageUseCase(this._repository);

  Future<ResultDef<bool>> call(ContactMessage message) =>
      _repository.sendMessage(message);
}
