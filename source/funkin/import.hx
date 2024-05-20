package;

#if !macro
// Only import these when we aren't in a macro.
import funkin.util.Constants;
import funkin.Paths;
import funkin.Preferences;
import flixel.FlxG; // This one in particular causes a compile error if you're using macros.
import flixel.system.debug.watch.Tracker;
import flixel.system.FlxAssets;
import flixel.sound.FlxSound;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.group.FlxSpriteGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import haxe.ds.IntMap;
import openfl.display.BitmapData;
import openfl.geom.Point;

// These are great.
using Lambda;
using StringTools;
using funkin.util.tools.ArraySortTools;
using funkin.util.tools.ArrayTools;
using funkin.util.tools.FloatTools;
using funkin.util.tools.Int64Tools;
using funkin.util.tools.IntTools;
using funkin.util.tools.IteratorTools;
using funkin.util.tools.MapTools;
using funkin.util.tools.SongEventDataArrayTools;
using funkin.util.tools.SongNoteDataArrayTools;
using funkin.util.tools.StringTools;
#end
