import Raylib
import Seuwichi

class IdleState: State {
    
// ======================================================================================================== 

    func update(deltaTime dt: Float) {
        Logic.player.update(deltaTime: Engine.deltaTime)

        if Logic.player.velocity.x == 1 || Logic.player.velocity.x == -1 {
            Logic.player.animation = Logic.player.running
            Logic.stateManager.changeState(id: "move")
        } else {
            Logic.player.animation = Logic.player.idle
        }

        if Logic.player.velocity.y == 1 || Logic.player.velocity.y == -1 {
            Logic.player.animation = Logic.player.running
            Logic.stateManager.changeState(id: "move")
        }
    }

    func render() {
        Logic.player.render()
    }

    func onEnter() {
        print("Entered Idle State")
    }

    func onExit() {

    }
}