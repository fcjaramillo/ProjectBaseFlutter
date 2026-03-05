part of 'repositories.dart';

class ContactRepository implements IContactRepository {
  @override
  Future<ResultDef<bool>> sendMessage(ContactMessage message) =>
      ContactDataSource.sendMessage(message);
}
