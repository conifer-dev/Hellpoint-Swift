import Raylib
import Seuwichi

struct MoveState: State {
    func update(deltaTime dt: Float) {
        
        Logic.player.update(deltaTime: Engine.deltaTime)

        if Logic.player.velocity.y == 0 && Logic.player.velocity.x == 0 {
            Logic.player.animation = Logic.player.idle
            Logic.stateManager.changeState(id: "idle")
        }
    }

    func render() {
        Logic.player.render()
    }

    func onEnter() {
        print("Entered Move State")
    }

    func onExit() {
    }
}