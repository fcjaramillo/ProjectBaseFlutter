part of 'dependencies.dart';

@riverpod
SendContactMessageUseCase sendContactMessageUseCase(Ref ref) =>
    SendContactMessageUseCase(ref.read(contactRepositoryProvider));
