import 'dart:math';
import 'package:flutter/material.dart';

class GradientCircular extends StatelessWidget {
  //粗细
  final double strokeWidth;
  //圆的半径
  final double radius;
  //两端是否为圆角
  final bool strokeCapRound;
  // 取值范围[0.0,1.0]
  final double value;
  //进度条背景颜色
  final Color backgroundColor;
  //渐变色数组
  final List<Color> colors;
  //渐变色的终止点，对应的colors属性
  final List<double> stops;
  //进度条的总弧度，2*pi位整圆，小于2*pi则不是整圆
  final double totalAngle;

  const GradientCircular({
    Key? key,
    this.strokeWidth = 2.0,
    required this.radius,
    this.strokeCapRound = false,
    this.value = 0.5,
    this.backgroundColor = const Color(0xFFEEEEEE),
    required this.colors,
    required this.stops,
    this.totalAngle = 2 * pi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _offset = 0.0;
    // 如果两端为圆角，则需要对起始位置进行调整，否则圆角部分会偏离起始位置
    if(strokeCapRound){
      _offset = asin(strokeWidth / (radius*2 - strokeWidth));
    }
    var _colors = colors;
    if(_colors == null){
      Color color = Theme.of(context).colorScheme.secondary;
      _colors = [color,color];
    }
    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: _GradientCircularProgressPainter(
          strokeWidth: strokeWidth,
          strokeCapRound: strokeCapRound,
          backgroundColor: backgroundColor,
          value: value,
          totalAngle: totalAngle,
          radius: radius,
          colors: _colors,
          stops: stops
        ),
      ),
    );
  }
}

//实现画笔
class _GradientCircularProgressPainter extends CustomPainter{
  _GradientCircularProgressPainter({
    this.strokeWidth = 10.0,
    required this.radius,
    this.strokeCapRound = false,
    this.value = 0.5,
    this.backgroundColor = const Color(0xFFEEEEEE),
    required this.colors,
    required this.stops,
    this.totalAngle = 2 * pi
  });
  //粗细
  final double strokeWidth;
  //圆的半径
  final double radius;
  //两端是否为圆角
  final bool strokeCapRound;
  // 取值范围[0.0,1.0]
  final double value;
  //进度条背景颜色
  final Color backgroundColor;
  //渐变色数组
  final List<Color> colors;
  //渐变色的终止点，对应的colors属性
  final List<double> stops;
  final double totalAngle;
  @override
  void paint(Canvas canvas, Size size) {
    if(radius != null){
      size = Size.fromRadius(radius);
    }
    double _offset = strokeWidth / 2.0;
    double _value = (value ?? 0.0);
    _value = _value.clamp(0.0, 1.0) * totalAngle;
    double _start = 0.0;
    if(strokeCapRound){
      _start = asin(strokeWidth/(size.width - strokeWidth));
    }
    Rect rect = Offset(_offset, _offset) & Size(size.width - strokeWidth, size.height - strokeWidth);

    var paint = Paint()
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    
    //先画背景
    if(backgroundColor != Colors.transparent){
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, totalAngle, false, paint);
    }
    //再画前景，应用渐变
    if(_value > 0){
      paint.shader = SweepGradient(
        startAngle: 0.0,
        endAngle: _value,
        colors: colors,
        stops: stops,
      ).createShader(rect);
      canvas.drawArc(rect, _start, _value, false, paint);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
