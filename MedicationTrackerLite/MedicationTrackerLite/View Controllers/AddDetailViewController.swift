//
//  AddDetailViewController.swift
//  MedicationTrackerLite
//
//  Created by Dennis Rudolph on 10/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

//protocol MedicationDetailDelegate {
////    updateViews()
//}

class AddDetailViewController: UIViewController {

    @IBOutlet weak var medicationName: UITextField!
    
    @IBOutlet weak var numberofPills: UITextField!
    
    @IBOutlet weak var sundayButton: UIButton!
    
    @IBOutlet weak var mondayButton: UIButton!
    @IBOutlet weak var tuesdayButton: UIButton!
    @IBOutlet weak var wednesdayButton: UIButton!
    @IBOutlet weak var thursdayButton: UIButton!
    @IBOutlet weak var fridayButton: UIButton!
    @IBOutlet weak var saturdayButton: UIButton!

    var medicationController: MedicationController?
    var medication: Medication?

    @IBOutlet weak var instructionsTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    private func clicked(button: UIButton) -> Bool {
        let wasClicked: Bool
        if button.isSelected == true {
                   wasClicked = true
               } else {
                   wasClicked = false
               }
        return wasClicked
    }
    
    
    @IBAction func savebuttonTapped(_ sender: UIBarButtonItem) {
        guard let name = medicationName.text, !name.isEmpty else { return }
        guard let numberString = numberofPills.text, !numberString.isEmpty else { return }
        guard let number = Int(numberString) else { return }
        guard let instructions = instructionsTextField.text else { return }
        let sunday = clicked(button: sundayButton)
        let monday = clicked(button: mondayButton)
        let tuesday = clicked(button: tuesdayButton)
        let wednesday = clicked(button: wednesdayButton)
        let thursday = clicked(button: thursdayButton)
        let friday = clicked(button: fridayButton)
        let saturday = clicked(button: saturdayButton)
        
        
        if let medication = medication {
            
        } else {
            medicationController?.create(medName: name, medInstruction: instructions, medPillCount: number, takenSunday: sunday, takenMonday: monday, takenTuesday: tuesday, takenWednesday: wednesday, takenThursday: thursday, takenFriday: friday, takenSaturday: saturday)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sundayTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            let circleFillImage = UIImage(systemName: "checkmark.circle")
            sender.setImage(circleFillImage, for: .selected)
        } else {
            let circleImage = UIImage(systemName: "circle")
            sender.setImage(circleImage, for: .normal)
        }
    }
    @IBAction func mondayTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            let circleFillImage = UIImage(systemName: "checkmark.circle")
            sender.setImage(circleFillImage, for: .selected)
        } else {
            let circleImage = UIImage(systemName: "circle")
            sender.setImage(circleImage, for: .normal)
        }
        
    }
    @IBAction func tuesdayTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            let circleFillImage = UIImage(systemName: "checkmark.circle")
            sender.setImage(circleFillImage, for: .selected)
        } else {
            let circleImage = UIImage(systemName: "circle")
            sender.setImage(circleImage, for: .normal)
        }
    }
    @IBAction func wednesdayTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            let circleFillImage = UIImage(systemName: "checkmark.circle")
            sender.setImage(circleFillImage, for: .selected)
        } else {
            let circleImage = UIImage(systemName: "circle")
            sender.setImage(circleImage, for: .normal)
        }
    }
    @IBAction func thursdayTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            let circleFillImage = UIImage(systemName: "checkmark.circle")
            sender.setImage(circleFillImage, for: .selected)
        } else {
            let circleImage = UIImage(systemName: "circle")
            sender.setImage(circleImage, for: .normal)
        }
    }
    @IBAction func fridayTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            let circleFillImage = UIImage(systemName: "checkmark.circle")
            sender.setImage(circleFillImage, for: .selected)
        } else {
            let circleImage = UIImage(systemName: "circle")
            sender.setImage(circleImage, for: .normal)
        }
    }
    @IBAction func saturdayTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            let circleFillImage = UIImage(systemName: "checkmark.circle")
            sender.setImage(circleFillImage, for: .selected)
        } else {
            let circleImage = UIImage(systemName: "circle")
            sender.setImage(circleImage, for: .normal)
        }
    }
    
    
    private func updateViews() {
        if let medication = medication {
            self.navigationItem.title = medicationName.text
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
