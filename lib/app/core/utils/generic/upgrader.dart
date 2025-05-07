// coverage:ignore-file
class Upgrader {
  String version;

  Upgrader({required this.version});

  factory Upgrader.fromJson(Map<String, dynamic> json) {
    return Upgrader(
      version: json['version'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
    };
  }
}
