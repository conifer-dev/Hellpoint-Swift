import Raylib
import Aeni

class Logic {
    // Player initialisation
    lazy var player = Player()

    func update() {
        player.update()
    }

    func render() {
        Raylib.drawTexture(Resources.manager.loadedResourcesDatabase["map"]!, 0, 0, .white)
        player.render()
    }
}