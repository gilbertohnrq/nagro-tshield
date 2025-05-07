// ignore_for_file: public_member_api_docs, sort_constructors_first

class LocationRequest {
  String? state;
  String? commodity;

  LocationRequest({
    required this.state,
    required this.commodity,
  });

  factory LocationRequest.mocked({
    String? state,
    String? commodity,
  }) {
    return LocationRequest(state: state ?? 'MG', commodity: 'Milho');
  }

  @override
  String toString() => 'LocationRequest(state: $state, commodity: $commodity)';

  @override
  bool operator ==(covariant LocationRequest other) {
    if (identical(this, other)) return true;

    return other.state == state && other.commodity == commodity;
  }

  @override
  int get hashCode => state.hashCode ^ commodity.hashCode;
}
