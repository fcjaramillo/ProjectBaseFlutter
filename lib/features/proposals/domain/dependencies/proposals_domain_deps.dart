part of 'dependencies.dart';

@riverpod
GetProposalsUseCase getProposalsUseCase(Ref ref) =>
    GetProposalsUseCase(ref.read(proposalsRepositoryProvider));

@riverpod
GetProposalsByAxisUseCase getProposalsByAxisUseCase(Ref ref) =>
    GetProposalsByAxisUseCase(ref.read(proposalsRepositoryProvider));

@riverpod
GetProposalByIdUseCase getProposalByIdUseCase(Ref ref) =>
    GetProposalByIdUseCase(ref.read(proposalsRepositoryProvider));
