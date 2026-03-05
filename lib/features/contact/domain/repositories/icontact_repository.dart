part of 'repositories.dart';

abstract class IContactRepository {
  Future<ResultDef<bool>> sendMessage(ContactMessage message);
}
