// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:finan/app/features/home/infra/models/commodities/metrics/graph_response.dart';
import 'package:finan/app/features/home/infra/models/commodities/metrics/history_response.dart';
import 'package:finan/app/features/home/infra/models/commodities/metrics/last_quotation_response.dart';

class MetricsResponse {
  final List<Graph> graph;
  final LastQuotation lastQuotation;
  final List<History> history;
  final String message;

  MetricsResponse({
    required this.graph,
    required this.lastQuotation,
    required this.history,
    this.message = '',
  });

  MetricsResponse copyWith({
    List<Graph>? graph,
    LastQuotation? lastQuotation,
    List<History>? history,
    String? message,
  }) {
    return MetricsResponse(
      graph: graph ?? this.graph,
      lastQuotation: lastQuotation ?? this.lastQuotation,
      history: history ?? this.history,
      message: message ?? this.message,
    );
  }

  factory MetricsResponse.mocked({
    List<Graph>? graph,
    LastQuotation? lastQuotation,
    List<History>? history,
    String? message,
  }) {
    return MetricsResponse(
      graph: graph ?? [],
      lastQuotation: lastQuotation ?? LastQuotation.mocked(),
      history: history ?? [],
      message: message ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'graph': graph.map((x) => x.toMap()).toList(),
      'lastQuotation': lastQuotation.toMap(),
      'history': history.map((x) => x.toMap()).toList(),
    };
  }

  factory MetricsResponse.fromMap(Map<String, dynamic> map) {
    return MetricsResponse(
      graph: map['graph'] != null
          ? List<Graph>.from(
              (map['graph'] as List<dynamic>).map<Graph>(
                (x) => Graph.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      lastQuotation: map['lastQuotation'] != null
          ? LastQuotation.fromMap(map['lastQuotation'] as Map<String, dynamic>)
          : LastQuotation.empty(),
      history: map['history'] != null
          ? List<History>.from(
              (map['history'] as List<dynamic>).map<History>(
                (x) => History.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      message: map['message'] != null ? map['message'] as String : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MetricsResponse.fromJson(String source) =>
      MetricsResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MetricsResponse(graph: $graph, lastQuotation: $lastQuotation, history: $history , message: $message)';
}
