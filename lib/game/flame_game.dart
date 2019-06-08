import 'dart:ui';
import 'dart:math';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import '../components/baseComponent.dart';
import 'package:flutter/gestures.dart';

class FlameGame extends Game {
  Size screenSize;
  double tileSize;
  List<BaseComponent> components;
  Random random;

  FlameGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    components = List<BaseComponent>();
    random = Random();
    spawnComponent();
  }

  @override
  void render(Canvas canvas) {
    renderBackground(canvas);
    components.forEach((BaseComponent component) => component.render(canvas));
  }

  // Base renders a random value, subclass can override
  void renderBackground(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
  }

  @override
  void update(double t) {
    components.forEach((BaseComponent component) => component.update(t));
    // TODO: Seeing exception:
    // flutter: Another exception was thrown: Concurrent modification during iteration: Instance(length:14) of '_GrowableList'.
    // Need a way to removeWhere only if not updating?
    components.removeWhere((BaseComponent component) => component.isOffScreen);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9; // maintain aspect ratio 9:x
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    components.forEach((BaseComponent component) {
      if (component.componentRect.contains(d.globalPosition)) {
        component.onTapDown();
      }
    });
  }

  //TODO: How to make these methods required in DART
  void spawnComponent() {}
}
