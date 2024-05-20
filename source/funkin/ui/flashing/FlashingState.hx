package funkin.ui.flashing;

import flixel.FlxSubState;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import funkin.save.Save;
import funkin.ui.title.TitleState;

class FlashingState extends MusicBeatState
{
  var save:Save = Save.instance;

  public static var leftState:Bool = false;

  var warnText:FlxText;

  override function create()
  {
    super.create();

    var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
    add(bg);

    warnText = new FlxText(0, 0, FlxG.width, "Disclaimer:\n
			This game contains flashing lights!\n
			Press ENTER to disable them now.\n
			Press ESCAPE to ignore this message.\n
			You've been warned!", 32);
    warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
    warnText.screenCenter(Y);
    add(warnText);
  }

  override function update(elapsed:Float)
  {
    if (!leftState)
    {
      var back:Bool = controls.BACK;
      if (controls.ACCEPT || back)
      {
        leftState = true;
        FlxTransitionableState.skipNextTransIn = true;
        FlxTransitionableState.skipNextTransOut = true;
        if (!back)
        {
          save.options.flashingLights = false;
          save.options.flashingLightsWarnShown = true;
          save.flush();
          FlxG.sound.play(Paths.sound('confirmMenu'));
          FlxFlicker.flicker(warnText, 1, 0.1, false, true, function(flk:FlxFlicker) {
            new FlxTimer().start(0.5, function(tmr:FlxTimer) {
              FlxG.switchState(new TitleState());
            });
          });
        }
        else
        {
          save.options.flashingLights = true;
          save.options.flashingLightsWarnShown = true;
          save.flush();
          FlxG.sound.play(Paths.sound('cancelMenu'));
          FlxTween.tween(warnText, {alpha: 0}, 1,
            {
              onComplete: function(twn:FlxTween) {
                FlxG.switchState(new TitleState());
              }
            });
        }
      }
    }
    super.update(elapsed);
  }
}
