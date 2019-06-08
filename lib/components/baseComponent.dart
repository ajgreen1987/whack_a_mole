import 'dart:ui';
import '../flame_game.dart';

class BaseComponent {
  Rect componentRect;
  Paint componentPaint;
  final FlameGame game;
  bool isDead = false;
  bool isOffScreen = false;

  BaseComponent(this.game, double x, double y, [bgColor = const Color(0xff6ab04c)]) {
    componentRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    componentPaint = Paint();
    componentPaint.color = bgColor;
  }

  void render(Canvas canvas) {
    canvas.drawRect(componentRect, componentPaint);
  }

  void update(double t) {
    // Is dead logic belongs in the subclass
    if(isDead){
      componentRect = componentRect.translate(0, game.tileSize*12*t);

      // generalize into a method that checks the objets rect against all sides of the screen
      isOffScreen = checkOffScreen();
      print("Are we off the screen yet?:" + isOffScreen.toString());
    }
  }

  // Tap logic belongs in subclass
  void onTapDown(){
    componentPaint.color = Color(0xffff4757);
    isDead = true;
    game.spawnComponent();
  }

  
  bool checkOffScreen(){
    Rect bgRect = Rect.fromLTWH(0, 0, game.screenSize.width, game.screenSize.height);
    return !bgRect.contains(componentRect.center);
  }
}
