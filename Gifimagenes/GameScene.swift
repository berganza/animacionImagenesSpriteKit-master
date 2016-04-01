//
//  GameScene.swift
//  Gifimagenes
//
//  Created by Luis Berganza on 1/4/16.
//  Copyright (c) 2016 Luis Berganza. All rights reserved.
//

import SpriteKit
import AVFoundation

class GameScene: SKScene {
    
    var texturasAtlas = SKTextureAtlas()
    var texturasArray = [SKTexture]()
    
    var batman = SKSpriteNode()
    
    var audioPlayer: AVAudioPlayer?
    
    override func didMoveToView(view: SKView) {
        
        texturasAtlas = SKTextureAtlas(named: "imagenes")
        
        for i in 1...texturasAtlas.textureNames.count {
            
            let gif = "\(i).png"
            texturasArray.append(SKTexture(imageNamed: gif))
        }
        
        batman = SKSpriteNode(imageNamed: texturasAtlas.textureNames[0] as String)
        
        batman.size = CGSize(width: 250, height: 322)
        batman.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.addChild(batman)
    }
    
    func playAudio() {
        do {
            self.audioPlayer =  try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("GANGNAM STYLE", ofType: "mp3")!))
            self.audioPlayer!.play()
            
        } catch {
            print("Error")
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        batman.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(texturasArray, timePerFrame: 0.075)))
        
        playAudio()
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
