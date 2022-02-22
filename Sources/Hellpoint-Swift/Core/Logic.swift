import Raylib

class Logic {
    var resourceManager = Resources()
    // deltaTime singleton --> Outgoing
    static let deltaTime = Raylib.getFrameTime()

    // Player initialisation
    // TODO:

    func update() {

    }

    func render() {
        Raylib.drawTexture(resourceManager.loadedResourcesDatabase["map"]!, 0, 0, .white)
    }
}