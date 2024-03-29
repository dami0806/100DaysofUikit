//
//  ViewController.swift
//  Project2Test
//
//  Created by 박다미 on 2023/01/23.
//

import UIKit


class ViewController: UIViewController {
    

    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
   
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
        
    }
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
      
        title = countries[correctAnswer].uppercased() + "\t \(score)"
        
        count += 1
    }
    
    //challenge
    

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        // //challenge 3
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: [], animations: {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        })
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: []) {
            sender.transform = .identity
        }
        var title: String
       
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong, That's the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        if count == 10 {
            let ac = UIAlertController(title: title, message: "Game Over!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "RESTART", style: .default, handler: askQuestion))
            present(ac, animated: true)
            score = 0
            count = 0
        } else {
            //uyarı ekranı yaratma
            
            let ac = UIAlertController(title: title, message: "\(count)/10", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
        

    }
    


}

