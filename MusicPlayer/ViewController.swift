//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Archimedes Angeles on 18/7/17.
//  Copyright © 2017 Archimedes Angeles. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {

    
    var audioPlayer = AVAudioPlayer()
    
    //let audioPath = NSURL(fileURLWithPath: Bundle().mainBundle.PathResource())
    
    //let audioPath  = Bundle.main.path(forResource: "Prelude", ofType: "mp3")
    
    //let audioPath = Bundle.main.url(forAuxiliaryExecutable: "Prelude")!
    
    
    var playPauseBtn = UIBarButtonItem()
    var musicPaused:Bool = false
    
    @IBOutlet var toolbar: UIToolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        do
        {
            //let url = URL(fileURLWithPath: audioPath)
            //audioPlayer = try AVAudioPlayer(contentsOf: url)
            let audioPath = Bundle.main.path(forResource: "abc", ofType: "mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch{
            
            print("Audio file not found.")
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func playPause(_ sender: UIBarButtonItem) {
        
        var items = toolbar.items!
        
//        if musicPaused == false
//        {
//            playPauseBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.pause, target: self, action: "playPause:")
//        
//            items[0] = playPauseBtn
//            toolbar.setItems(items, animated: true)
//        }
        
        
        
        do {
            
            
            
            var items = toolbar.items!
            
            if musicPaused == false
            {
                playPauseBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.pause, target: self, action: "playPause:")
                
                items[0] = playPauseBtn
                
                toolbar.setItems(items, animated: true)
                
                audioPlayer.play()
                
                musicPaused = true

            }
            else
            {
                playPauseBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.play, target: self, action: "playPause:")
                
                items[0] = playPauseBtn
                
                toolbar.setItems(items, animated: true)
                
                audioPlayer.pause()
                
                musicPaused = false

            }
            
            
            
            
        } catch {
            print(error)
        }
    }
    
    
    @IBAction func stopButton(_ sender: UIBarButtonItem) {
        
        //audioPlayer.stop()
        
        
        var items = toolbar.items!
        
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        
//        playPauseBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.play, target:self, action: "playPause:")
        
        playPauseBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.play, target: self, action: "playPause:")
        

        
        items[0] = playPauseBtn
        
        toolbar.setItems(items, animated: true)
        
        
        musicPaused = false
    }
    
    
   }

