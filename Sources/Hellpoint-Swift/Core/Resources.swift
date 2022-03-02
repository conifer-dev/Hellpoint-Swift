import Raylib
import Aeni

class Resources {

    static let manager = Resources()

    //Initialisation of assets & retriving paths
    lazy var rawResourceDatabase: [String: URL?] = ["map": Bundle.module.url(forResource: "map", withExtension: "png"),
                                                    "playerSprite": Bundle.module.url(forResource: "PlayerSheet", withExtension: "png"),
                                                    "playButton": Bundle.module.url(forResource:"playButton", withExtension: "png"),
                                                    "playButtonOnPress": Bundle.module.url(forResource:"playButtonOnPress", withExtension: "png")]
    // Loading textures
    lazy var loadedResourcesDatabase: [String: Texture2D] = ["playerSpriteSheet": Raylib.loadTexture(self.rawResourceDatabase["playerSprite"]!!.path),
                                                             "map": Raylib.loadTexture(self.rawResourceDatabase["map"]!!.path),
                                                             "playButton": Raylib.loadTexture(self.rawResourceDatabase["playButton"]!!.path),
                                                             "playButtonOnPress": Raylib.loadTexture(self.rawResourceDatabase["playButtonOnPress"]!!.path)]

    deinit{
        for (key, _) in self.loadedResourcesDatabase {
            Raylib.unloadTexture(self.loadedResourcesDatabase[key]!)
        }
    }
}