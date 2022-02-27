import Raylib
import Aeni

class Resources {

    static let manager = Resources()

    //Initialisation of assets & retriving paths
    lazy var rawResourceDatabase: [String: URL?] = ["map": Bundle.module.url(forResource: "map", withExtension: "png"), "playerSprite": Bundle.module.url(forResource: "PlayerSheet", withExtension: "png")]
    // Loading textures
    lazy var loadedResourcesDatabase: [String: Texture2D] = ["playerSpriteSheet": Raylib.loadTexture(self.rawResourceDatabase["playerSprite"]!!.path), "map": Raylib.loadTexture(self.rawResourceDatabase["map"]!!.path)]

    deinit{
        for (key, _) in self.loadedResourcesDatabase {
            Raylib.unloadTexture(self.loadedResourcesDatabase[key]!)
        }
    }
}