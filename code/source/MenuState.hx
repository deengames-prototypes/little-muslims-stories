package;

import helix.core.HelixSprite;
import helix.core.HelixSpriteFluentApi;
import helix.core.HelixState;
import helix.data.Config;
import openfl.Assets;

class MenuState extends HelixState
{
    private static inline var STORIES_PER_ROW:Int = 2;
    private static inline var STORIES_PER_COLUMN:Int = 3;
    private static inline var PADDING:Int = 10;

    override public function create():Void
    {
        var stories:Array<String> = cast(Config.get("stories"));
        var storyNumber = 0;

        for (storyName in stories) {
            // assumption: story name is a slug
            var button:HelixSprite;
            var storyImageName = 'assets/images/stories/${storyName}.png';
            if (Assets.exists(storyImageName)) {
                button = new HelixSprite(storyImageName);
            } else {
                trace('Warning: missing story cover ${storyImageName}');
                button = new HelixSprite('assets/images/stories/story-generic.jpg');
            }
            
            button.x = (storyNumber % STORIES_PER_ROW) * (button.width + PADDING) + (PADDING * (storyNumber + 1));
            button.y = ((storyNumber / STORIES_PER_COLUMN) * button.height) + (PADDING * (storyNumber + 1));

            storyNumber++;
        }
    }
}