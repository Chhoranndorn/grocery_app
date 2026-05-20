import 'package:flutter/material.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Color(0xFFF4FFFA), Color(0xFFFFF5F5)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 110, 24, 42),
            child: Column(
              children: [
                const SizedBox(width: 280, height: 280, child: _SuccessMark()),
                const SizedBox(height: 78),
                const Text(
                  'Your Order has been\naccepted',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF181725),
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Your items has been placed and is on\nit's way to being processed",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    height: 1.45,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 68,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF53B175),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Track Order',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: const Text(
                    'Back to home',
                    style: TextStyle(
                      color: Color(0xFF181725),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> showOrderFailedDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.38),
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 26),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFF181725),
                    size: 34,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const SizedBox(width: 230, height: 230, child: _GroceryBagMark()),
              const SizedBox(height: 40),
              const Text(
                'Oops! Order Failed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF181725),
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Something went tembly wrong.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF7C7C7C),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 74),
              SizedBox(
                width: double.infinity,
                height: 68,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF53B175),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Please Try Again',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 26),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text(
                  'Back to home',
                  style: TextStyle(
                    color: Color(0xFF181725),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _SuccessMark extends StatelessWidget {
  const _SuccessMark();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _SuccessPainter());
  }
}

class _GroceryBagMark extends StatelessWidget {
  const _GroceryBagMark();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _GroceryBagPainter());
  }
}

class _SuccessPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final green = Paint()..color = const Color(0xFF53B175);
    final outline = Paint()
      ..color = const Color(0xFFD9F2E3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    final check = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 24
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawCircle(center, size.width * 0.34, green);
    canvas.drawCircle(center, size.width * 0.29, outline);

    final path = Path()
      ..moveTo(size.width * 0.33, size.height * 0.52)
      ..lineTo(size.width * 0.45, size.height * 0.64)
      ..lineTo(size.width * 0.68, size.height * 0.42);
    canvas.drawPath(path, check);

    final accent = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    accent.color = const Color(0xFF6B7CF5);
    canvas.drawArc(Rect.fromLTWH(28, 150, 70, 50), 0.2, 3.8, false, accent);
    accent.color = const Color(0xFFFFA726);
    canvas.drawArc(Rect.fromLTWH(198, 170, 46, 60), -1.2, 1.5, false, accent);
    accent.color = const Color(0xFFFF5B45);
    canvas.drawArc(Rect.fromLTWH(210, 40, 42, 60), 0.2, 1.7, false, accent);

    final dot = Paint()..style = PaintingStyle.fill;
    for (final item in [
      (Offset(102, 48), const Color(0xFF53B175), 14.0),
      (Offset(145, 72), const Color(0xFFFF5B45), 7.0),
      (Offset(190, 220), const Color(0xFF6B7CF5), 13.0),
      (Offset(150, 205), const Color(0xFF53B175), 7.0),
    ]) {
      dot.color = item.$2;
      canvas.drawCircle(item.$1, item.$3, dot);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _GroceryBagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = const Color(0xFFE6F8EE);
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width * 0.48,
      bg,
    );

    final itemPaint = Paint()..style = PaintingStyle.fill;
    itemPaint.color = const Color(0xFF58B889);
    canvas.drawRect(Rect.fromLTWH(45, 82, 30, 72), itemPaint);
    itemPaint.color = const Color(0xFF6FC3E8);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(78, 62, 36, 96),
        const Radius.circular(8),
      ),
      itemPaint,
    );
    itemPaint.color = const Color(0xFFE5763D);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(118, 76, 34, 82),
        const Radius.circular(10),
      ),
      itemPaint,
    );
    itemPaint.color = const Color(0xFF8D4A9E);
    canvas.drawOval(Rect.fromLTWH(150, 48, 34, 92), itemPaint);
    itemPaint.color = const Color(0xFFE9C068);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(180, 44, 38, 108),
        const Radius.circular(18),
      ),
      itemPaint,
    );
    itemPaint.color = const Color(0xFFFFCF33);
    canvas.drawOval(Rect.fromLTWH(210, 98, 34, 72), itemPaint);

    itemPaint.color = const Color(0xFFE2BD78);
    final bag = Path()
      ..moveTo(56, 112)
      ..lineTo(206, 112)
      ..lineTo(206, 210)
      ..lineTo(56, 210)
      ..close();
    canvas.drawPath(bag, itemPaint);

    itemPaint.color = const Color(0xFFD5AB63);
    final side = Path()
      ..moveTo(56, 112)
      ..lineTo(78, 132)
      ..lineTo(78, 210)
      ..lineTo(56, 210)
      ..close();
    canvas.drawPath(side, itemPaint);

    itemPaint.color = const Color(0xFFECC784);
    final fold = Path()
      ..moveTo(78, 132)
      ..lineTo(206, 210)
      ..lineTo(78, 210)
      ..close();
    canvas.drawPath(fold, itemPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
