// ignore_for_file: public_member_api_docs

import 'package:flutter/widgets.dart' hide Image;

class Painter extends StatefulWidget {
  // ignore: prefer_const_constructor_declarations
  Painter(this.painterController)
      : super(key: ValueKey<PainterController>(painterController));

  final PainterController painterController;

  @override
  State<Painter> createState() => _PainterState();
}

class _PainterState extends State<Painter> {
  @override
  Widget build(BuildContext context) => SizedBox.expand(
        child: GestureDetector(
          onPanStart: _onPanStart,
          onPanUpdate: _onPanUpdate,
          onPanEnd: _onPanEnd,
          child: CustomPaint(
            willChange: true,
            painter: _PainterPainter(
              widget.painterController._pathHistory,
              repaint: widget.painterController,
            ),
          ),
        ),
      );

  void _onPanStart(DragStartDetails start) {
    final pos = (context.findRenderObject()! as RenderBox)
        .globalToLocal(start.globalPosition);
    widget.painterController._pathHistory.add(pos);
    widget.painterController._notifyListeners();
  }

  void _onPanUpdate(DragUpdateDetails update) {
    final pos = (context.findRenderObject()! as RenderBox)
        .globalToLocal(update.globalPosition);
    widget.painterController._pathHistory.updateCurrent(pos);
    widget.painterController._notifyListeners();
  }

  // ignore: avoid_unused_parameters
  void _onPanEnd(DragEndDetails end) {
    widget.painterController._pathHistory.endCurrent();
    widget.painterController._notifyListeners();
  }
}

class _PainterPainter extends CustomPainter {
  const _PainterPainter(
    this._path, {
    super.repaint,
  });

  final _PathHistory _path;

  @override
  void paint(Canvas canvas, Size size) {
    _path.draw(canvas, size);
  }

  @override
  bool shouldRepaint(_PainterPainter oldDelegate) => true;
}

class _PathHistory {
  _PathHistory()
      : _paths = <MapEntry<Path, Paint>>[],
        _inDrag = false,
        currentPaint = Paint();

  final List<MapEntry<Path, Paint>> _paths;
  Paint currentPaint;
  bool _inDrag;

  void undo() {
    if (!_inDrag && _paths.isNotEmpty) {
      _paths.removeLast();
    }
  }

  void clear() {
    if (!_inDrag) {
      _paths.clear();
    }
  }

  void add(Offset startPoint) {
    if (_inDrag) {
      return;
    }
    _inDrag = true;
    final path = Path()..moveTo(startPoint.dx, startPoint.dy);
    _paths.add(MapEntry<Path, Paint>(path, currentPaint));
  }

  void updateCurrent(Offset nextPoint) {
    if (!_inDrag) {
      return;
    }
    _paths.last.key.lineTo(nextPoint.dx, nextPoint.dy);
  }

  void endCurrent() {
    _inDrag = false;
  }

  // ignore: avoid_unused_parameters
  void draw(Canvas canvas, Size size) {
    for (final path in _paths) {
      canvas.drawPath(path.key, path.value);
    }
  }
}

class PainterController extends ChangeNotifier {
  PainterController() : _pathHistory = _PathHistory();

  Color _drawColor = const Color.fromARGB(255, 0, 0, 0);

  double _thickness = 1;
  final _PathHistory _pathHistory;

  Color get drawColor => _drawColor;
  set drawColor(Color color) {
    _drawColor = color;
    _updatePaint();
  }

  double get thickness => _thickness;
  set thickness(double thickness) {
    _thickness = thickness;
    _updatePaint();
  }

  void _updatePaint() {
    final paint = Paint()
      ..color = drawColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;
    _pathHistory.currentPaint = paint;
    notifyListeners();
  }

  void undo() {
    _pathHistory.undo();
    notifyListeners();
  }

  void _notifyListeners() {
    notifyListeners();
  }

  void clear() {
    _pathHistory.clear();
    notifyListeners();
  }

  int getStepCount() => _pathHistory._paths.length;

  @visibleForTesting
  void addMockStep() {
    _pathHistory._paths.add(MapEntry<Path, Paint>(Path(), Paint()));
  }
}
