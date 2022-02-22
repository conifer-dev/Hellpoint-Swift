import Raylib

class Logic {
    var resourcesManager = Resources.manager

    // deltaTime singleton --> Outgoing
    static let deltaTime = Raylib.getFrameTime()

    // Player initialisation
    // TODO:

    func update() {

    }

    func render() {
        Raylib.drawTexture(resourcesManager.loadedResourcesDatabase["map"]!, 0, 0, .white)
    }
}