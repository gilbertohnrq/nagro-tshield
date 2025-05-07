// coverage:ignore-file
import 'package:finan/app/features/home/infra/models/commodities/metrics/metrics_response.dart';

class CommodityMetrics {
  final MetricsResponse metrics;
  final String city;
  final String state;

  CommodityMetrics({
    required this.metrics,
    required this.city,
    required this.state,
  });
}
