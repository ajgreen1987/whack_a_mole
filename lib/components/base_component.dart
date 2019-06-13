import 'dart:ui';
import 'package:flame/sprite.dart';
import '../game/flame_game.dart';

class BaseComponent {
  Rect componentRect;
  Paint componentPaint;
  Sprite backgroundSprite;
  final FlameGame game;
  bool isDead = false;
  bool isOffScreen = false;

  BaseComponent(this.game,
      [Rect baseRect, bgColor = const Color(0xff6ab04c), bgSpriteFileName]) {

    if (baseRect == null) {
      baseRect = Rect.fromLTWH(0, 0, 25, 25);
    }
    if(bgColor == null){
      bgColor = Color(0xff217574);
    }
    componentRect = baseRect;
    componentPaint = Paint();
    
    componentPaint.color = bgColor;

    if (bgSpriteFileName != null) {
      backgroundSprite = Sprite(bgSpriteFileName);
    }
  }

  void render(Canvas canvas) {
    canvas.drawRect(componentRect, componentPaint);
  }

  void update(double t) {
    // Is dead logic belongs in the subclass -
    // An optional paramter could be added to toggle the isDead -> isOffScreen requirement?
    if (isDead) {
      // generalize into a method that checks the objets rect against all sides of the screen
      isOffScreen = checkOffScreen();
      print("Are we off the screen yet?:" + isOffScreen.toString());
    }
  }

  // Create a tappable subclass to handle taps?
  void onTapDown() {}

  bool checkOffScreen() {
    Rect bgRect =
        Rect.fromLTWH(0, 0, game.screenSize.width, game.screenSize.height);
    return !bgRect.contains(componentRect.center);
  }
}
