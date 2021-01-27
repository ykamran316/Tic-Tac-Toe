//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Student on 1/21/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var gridLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    var labelsArray = [GridLabel]()
    var xTurn = true
    var gameOver = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsArray.append(gridLabel0)
        labelsArray.append(gridLabel1)
        labelsArray.append(gridLabel2)
        labelsArray.append(gridLabel3)
        labelsArray.append(gridLabel4)
        labelsArray.append(gridLabel5)
        labelsArray.append(gridLabel6)
        labelsArray.append(gridLabel7)
        labelsArray.append(gridLabel8)
    }

    @IBAction func onTappedGridLabel(_ sender: UITapGestureRecognizer) {
        if gameOver {
            return
        }
        for label in labelsArray {
            if label.frame.contains(sender.location(in: backgroundView)) {
                if label.canTap {
                    if xTurn {
                        label.text = "X"
                    }
                    else {
                        label.text = "O"
                    }
                    xTurn = !xTurn
                    label.canTap = false
                    checkForWinner()
                }
            }
        }
    }
    func checkForWinner() {
        checkLine(a: 0, b: 1, c: 2) //check first row
        checkLine(a: 3, b: 4, c: 5) //check second row
        checkLine(a: 6, b: 7, c: 8) //check third row
        checkLine(a: 0, b: 3, c: 6) //check first column
        checkLine(a: 1, b: 4, c: 7) //check second column
        checkLine(a: 2, b: 5, c: 8) //check third column
        checkLine(a: 0, b: 4, c: 8) //check top left to bottom right
        checkLine(a: 2, b: 4, c: 6) //check top right to bottom left
    }
    
    func checkLine(a: Int, b: Int, c: Int)
    {
        if labelsArray[a].text != "" &&
        labelsArray[a].text == labelsArray[b].text &&
        labelsArray[b].text == labelsArray[c].text {
                displayWinningMessage(message: "\(labelsArray[a].text!) is the winner")
        }
    }
    func displayWinningMessage(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default) {
            (action) in self.resetGame()
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        gameOver = true
    }
    func resetGame() {
        for label in labelsArray {
            label.text = ""
            label.canTap = true
        }
        xTurn = true
        gameOver = false
    }
    
}

