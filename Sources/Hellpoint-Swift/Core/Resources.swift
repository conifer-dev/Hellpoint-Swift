import Raylib

class Resources {

    //Initialisation of assets & retriving paths
    lazy private(set) var rawResourceDatabase: [String: URL?] = ["map": Bundle.module.url(forResource: "map", withExtension: "png"), "playerSprite": Bundle.module.url(forResource: "PlayerSheet", withExtension: "png")]
    // Loading textures
    lazy private (set) var loadedResourcesDatabase: [String: Texture2D] = ["playerSpriteSheet": Raylib.loadTexture(rawResourceDatabase["playerSprite"]!!.path), "map": Raylib.loadTexture(rawResourceDatabase["map"]!!.path)]

    

    deinit{
        for (key, _) in loadedResourcesDatabase {
            Raylib.unloadTexture(loadedResourcesDatabase[key]!)
        }
        print("INFO: Resources Manager has successfully unloaded all data... 🌲")
    }
}