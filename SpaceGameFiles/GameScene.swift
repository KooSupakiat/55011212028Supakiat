
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player:SKSpriteNode! = SKSpriteNode()
    var lastYieldTimeInterval:NSTimeInterval = NSTimeInterval()
    var lastUpdateTimeInterval:NSTimeInterval = NSTimeInterval()
    
    var aliens:NSMutableArray = NSMutableArray()
    var aliensDestroyed:Int = 0
    
    
    let alienCategory:UInt32 = 0x1 << 1
    let photonTorpedoCategory:UInt32 = 0x1 << 0
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = SKColor.blackColor()
        player = SKSpriteNode(imageNamed: "shuttle")
       
        player.position = CGPointMake(self.frame.size.width/2, player.size.height/2 + 20)
        
        self.addChild(player)
        
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        self.physicsWorld.contactDelegate = self
        

    }
    
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    func addAlien(){
    
        // Create alien sprite
        var alien:SKSpriteNode = SKSpriteNode(imageNamed: "alien")
        alien.frame
        alien.physicsBody = SKPhysicsBody(rectangleOfSize: alien.size)
        alien.physicsBody.dynamic = true
        alien.physicsBody.categoryBitMask = alienCategory
        alien.physicsBody.contactTestBitMask = photonTorpedoCategory
        alien.physicsBody.collisionBitMask = 0
        
        // Where to create aliens along the x-axis
        let minX = alien.size.width/2
        let maxX = self.frame.size.width - alien.size.width/2
        let rangeX = maxX - minX
        let position:CGFloat = CGFloat(Int(arc4random_uniform(UInt32(UInt(rangeX ))))) + minX
        
        // Bring aliens of screen
        alien.position = CGPointMake(position, self.frame.size.height+alien.size.height)
        
        self.addChild(alien)
        aliens.addObject(alien)
        
        // Alien Animation Duration
        
        let minDuration = 2
        let maxDurcation = 4
        let rangeDuration = maxDurcation - minDuration
        let duration = (Int(arc4random()) % Int(rangeDuration)) + Int(minDuration)
        
        
        // Create actions to animate
        
        var actionArray:NSMutableArray = NSMutableArray()
        
        actionArray.addObject(SKAction.moveTo(CGPointMake(position, -alien.size.height), duration: NSTimeInterval(duration)))
        actionArray.addObject((SKAction.runBlock({
            var transition:SKTransition = SKTransition.flipHorizontalWithDuration(0.5)
            var gameOverScene:SKScene = GameOverScene(size: self.size, won: false)
            self.view.presentScene(gameOverScene, transition: transition)
            })))

        actionArray.addObject(SKAction.removeFromParent())
        
        alien.runAction(SKAction.sequence(actionArray))
        
        
    }
    
    func updateWithTimeSinceLastUpdate(timeSinceLastUpdate:CFTimeInterval){
        lastYieldTimeInterval += timeSinceLastUpdate
        if (lastYieldTimeInterval > 1){
            lastYieldTimeInterval = 0
            self.addAlien()
        }
        
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        // < 60fps, we still want everything to move the ssame distance
        var timeSinceLastUpdate = currentTime - lastUpdateTimeInterval
        lastUpdateTimeInterval = currentTime
        if (timeSinceLastUpdate > 1){// More than a second since last update
            timeSinceLastUpdate = 1/60
            lastUpdateTimeInterval = currentTime
        }
        self.updateWithTimeSinceLastUpdate(timeSinceLastUpdate)
        
    }

  
    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!) {
        self.runAction(SKAction.playSoundFileNamed("torpedo.mp3", waitForCompletion: false))
        
        
        // chose one of the touches to work with
        var touch:UITouch = touches.anyObject() as UITouch
        var location:CGPoint = touch.locationInNode(self)
        
        // Set up initial location for torpedo
        var torpedo:SKSpriteNode = SKSpriteNode(imageNamed: "torpedo")
        torpedo.position = player.position
        
        torpedo.physicsBody = SKPhysicsBody(circleOfRadius: torpedo.size.width/2)
        torpedo.physicsBody.dynamic = true
        
        // BOTH TIMES BIT MASK NECESSARY
        torpedo.physicsBody.categoryBitMask = photonTorpedoCategory
        torpedo.physicsBody.contactTestBitMask = alienCategory
        torpedo.physicsBody.collisionBitMask = 0
        torpedo.physicsBody.usesPreciseCollisionDetection = true
        
        // Determine offset of location to torpedo
        var offSet:CGPoint = vecSub(location, b: torpedo.position)
        
        // dont add torpedo if shooting backwards
        if (offSet.y < 0){
            return
        }
        
        self.addChild(torpedo)
        
        // Whre to shoot?
        var direction:CGPoint = vecNoramlize(offSet)
        
        // Shoot off screen
        var shotLength:CGPoint = vecMulti(direction, b: 1000)
        
        // Add Length to current position
        var finalDestination:CGPoint = vecAdd(shotLength, b: torpedo.position)
        
        // create action
        let velocity = 568/1
        let moveDuration:Float = Float(self.size.width) / Float(velocity)
        
        var actionArray:NSMutableArray = NSMutableArray()
        actionArray.addObject(SKAction.moveTo(finalDestination, duration: NSTimeInterval(moveDuration)))
        actionArray.addObject(SKAction.removeFromParent())
        
        torpedo.runAction(SKAction.sequence(actionArray))
        
        
        
    }
    
    func didBeginContact(contact: SKPhysicsContact!){
       
        // Body1 and 2 depend on the categoryBitMask << 0 und << 1
        var firstBody:SKPhysicsBody
        var secondBody:SKPhysicsBody
        
        if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask){
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        torpedoDidCollideWithAlien(contact.bodyA.node as SKSpriteNode, alien: contact.bodyB.node as SKSpriteNode)

        
    }
    
    func torpedoDidCollideWithAlien(torpedo:SKSpriteNode, alien:SKSpriteNode){
        println("HIT")
        torpedo.removeFromParent()
        alien.removeFromParent()
        aliensDestroyed++
        
        if (aliensDestroyed > 30){
            var transition:SKTransition = SKTransition.flipHorizontalWithDuration(0.5)
            var gameOverScene:SKScene = GameOverScene(size: self.size, won: true)
            self.view.presentScene(gameOverScene, transition: transition)
        }
    }
   
    
    func vecAdd(a:CGPoint,b:CGPoint)->CGPoint{
        return CGPointMake(a.x + b.x, a.y + b.y);
    }
    
    func vecSub(a:CGPoint, b:CGPoint)->CGPoint{
        return CGPointMake(a.x - b.x, a.y - b.y);
    }
    
    func vecMulti(a:CGPoint,b:CGFloat)->CGPoint{
        return CGPointMake(a.x * b, a.y * b);
    }
    
    func vecLength (a:CGPoint)->CGFloat{
        return CGFloat(sqrtf(CFloat(a.x) * CFloat(a.x) + CFloat(a.y) * CFloat(a.y)));
    }
    
    //vector has a lenght of 1
    func vecNoramlize (a:CGPoint)->CGPoint{
        var length:CGFloat = self.vecLength(a)
        return CGPointMake(a.x / length, a.y / length);
    }
    
    
}
