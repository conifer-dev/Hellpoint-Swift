import Raylib
import Aeni
import Seuwichi

class Logic {

    // Player initialisation
    static var player = Player()

    static var stateManager = StateMachine()

    func initStates() {
        Logic.stateManager.insertState(IdleState(), withID: "idle")
        Logic.stateManager.insertState(MoveState(), withID: "move")
        Logic.stateManager.changeState(id: "idle")
    }

    func update(deltaTime dt: Float) {
        Logic.stateManager.update()
    }

    func render() {
        Raylib.drawTexture(Resources.manager.loadedResourcesDatabase["map"]!, 0, 0, .white)
        Logic.stateManager.render()
    }
}