part of 'data_sources.dart';

class ContactDataSource {
  ContactDataSource._();

  static Future<ResultDef<bool>> sendMessage(ContactMessage message) async {
    try {
      await SupabaseDataSource.insert(
        SupabaseTables.contacts,
        message.toInsertJson(),
      );
      return ResultDef<bool>.success(true);
    } catch (e) {
      return FailDef<bool>(
        BackError(statusCode: 500, description: e.toString()),
      );
    }
  }
}
