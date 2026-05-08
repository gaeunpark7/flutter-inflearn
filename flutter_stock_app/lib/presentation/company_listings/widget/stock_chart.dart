import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_stock_app/domain/model/intraday_info.dart';

class StockChart extends StatelessWidget {
  final List<IntradayInfo> infos;

  const StockChart({super.key, required this.infos});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: CustomPaint(painter: ChartPainter(infos)),
    );
  }
}

class ChartPainter extends CustomPainter {
  final List<IntradayInfo> infos;
  late int upperValue = infos.map((e) => e.close).fold<double>(0.0, max).ceil();

  late int lowerValue = infos.map((e) => e.close).reduce(min).toInt();

  ChartPainter(this.infos);

  @override
  void paint(Canvas canvas, Size size) {
    if (infos.isEmpty) return;

    const spacing = 50.0;

    final closes = infos.map((e) => e.close);
    final upperValue = closes.reduce(max).ceilToDouble();
    final lowerValue = closes.reduce(min).floorToDouble();

    final priceRange = (upperValue - lowerValue);
    final safeRange = priceRange == 0 ? 1.0 : priceRange;

    final chartHeight = size.height - spacing * 2;
    final chartWidth = size.width - spacing * 2;

    final spacePerPoint = infos.length <= 1
        ? 0.0
        : chartWidth / (infos.length - 1);

    // 1) y축 라벨 6개(0~5)
    final priceStep = safeRange / 5.0;
    for (var step = 0; step <= 5; step++) {
      final price = lowerValue + priceStep * step;

      final tp = TextPainter(
        text: TextSpan(
          text: price.round().toString(),
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      final y =
          spacing + chartHeight - (step / 5.0) * chartHeight - tp.height / 2;
      tp.paint(canvas, Offset(0, y));
    }

    // 2) x축 시간 라벨(12칸마다)
    for (var index = 0; index < infos.length; index += 12) {
      final hour = infos[index].date.hour;

      final tp = TextPainter(
        text: TextSpan(
          text: '$hour',
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      final x = spacing + index * spacePerPoint - tp.width / 2;
      tp.paint(canvas, Offset(x, spacing + chartHeight + 4));
    }

    // 3) 라인 차트 path
    final path = Path();
    for (var i = 0; i < infos.length; i++) {
      final close = infos[i].close;
      final ratio = (close - lowerValue) / safeRange; // 0~1
      final x = spacing + i * spacePerPoint;
      final y = spacing + chartHeight - ratio * chartHeight;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    final linePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant ChartPainter oldDelegate) {
    //전 상태의 info와 현재 info가 다를때
    return oldDelegate.infos != infos;
  }
}
