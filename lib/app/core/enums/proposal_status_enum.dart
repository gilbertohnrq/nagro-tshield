// coverage:ignore-file
enum ProposalStatusEnum implements Comparable<ProposalStatusEnum> {
  preApproved(name: 'pre-approved', animation: 'pre-approved.riv', asset: 'pre_aprovado.svg'),
  proposalApproved(name: 'approved-proposal', animation: 'approved-proposal.riv', asset: 'proposta_aprovada.svg');

  const ProposalStatusEnum({
    required this.name,
    required this.animation,
    required this.asset
  });

  final String name;
  final String animation;
  final String asset;

  @override
  int compareTo(ProposalStatusEnum other) => name.compareTo(other.name);

  static List<String> get allAssets =>
      ProposalStatusEnum.values.map((icon) => icon.asset).toList();
}