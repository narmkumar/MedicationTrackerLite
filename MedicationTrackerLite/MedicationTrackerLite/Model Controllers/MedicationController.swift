//
//  MedicationController.swift
//  MedicationTrackerLite
//
//  Created by Dennis Rudolph on 10/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class MedicationController {
    
    var delegate: MedicationTableViewController?
    
    var medications: [Medication] = [] 
    
    var today: String {
        getToday()
    }
    
//    var userDate = UserDefaults.standard.set(Date(), forKey: "DateKey")
    
    var sundaySelected: [Medication] {
        return medications.filter { $0.takenSunday == true}
    }
    var mondaySelected: [Medication] {
        return medications.filter { $0.takenMonday == true}
    }
    var tuesdaySelected: [Medication] {
        return medications.filter { $0.takenTuesday == true}
    }
    var wednesdaySelected: [Medication] {
        return medications.filter { $0.takenWednesday == true}
    }
    var thursdaySelected: [Medication] {
        return medications.filter { $0.takenThursday == true}
    }
    var fridaySelected: [Medication] {
        return medications.filter { $0.takenFriday == true}
    }
    var saturdaySelected: [Medication] {
        return medications.filter { $0.takenSaturday == true}
    }
    
    init() {
           loadFromPersistenceStore()
       }
    // MARK: - Methods:
    
    func create(medName: String, medInstruction: String, medPillCount: Int, takenSunday: Bool, takenMonday: Bool, takenTuesday: Bool, takenWednesday: Bool, takenThursday: Bool, takenFriday: Bool, takenSaturday: Bool) {
        let medication = Medication(name: medName, medicationInstructions: medInstruction, pillCount: medPillCount, takenSunday: takenSunday, takenMonday: takenMonday, takenTuesday: takenTuesday, takenWednesday: takenWednesday, takenThursday: takenThursday, takenFriday: takenFriday, takenSaturday: takenSaturday)
        medications.append(medication)
        saveToPersistentStore()
        delegate?.tableView.reloadData()
    }
        
    func update(_ medication: Medication, medName: String, medInstruction: String, medPillCount: Int, takenSunday: Bool, takenMonday: Bool, takenTuesday: Bool, takenWednesday: Bool, takenThursday: Bool, takenFriday: Bool, takenSaturday: Bool) {
          guard let index = medications.firstIndex(of: medication) else { return }
          medications[index].name = medName
          medications[index].pillCount = medPillCount
          medications[index].medicationInstructions = medInstruction
          medications[index].takenSunday = takenSunday
          medications[index].takenMonday = takenMonday
          medications[index].takenTuesday = takenTuesday
          medications[index].takenWednesday = takenWednesday
          medications[index].takenThursday = takenThursday
          medications[index].takenFriday = takenFriday
          medications[index].takenSaturday = takenSaturday
          saveToPersistentStore()
              
          }
    
    func updateHasBeenTaken(for medication: Medication) {
        if let index = medications.firstIndex(of: medication) {
            if medications[index].hasBeenTaken == false {
                medications[index].hasBeenTaken.toggle()
                medications[index].pillCount -= 1
            } else {
                medications[index].hasBeenTaken.toggle()
            }
            saveToPersistentStore()
        }
    }
    
    // MARK: - Persistence
    
    private var medicationListURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("MedicineList.plist")
    }
    
        func saveToPersistentStore() {
            guard let url = medicationListURL else { return }
            
            do {
                let encoder = PropertyListEncoder()
                let medicineData = try encoder.encode(medications)
                try  medicineData.write(to: url)
            } catch {
                print("Error loading medicine item data: \(error)")
                
            }
        }
        
         func loadFromPersistenceStore(){
            guard let url = medicationListURL else { return }
            do {
                let decoder = PropertyListDecoder()
                let data = try Data(contentsOf: url)
                let decodedItems = try decoder.decode([Medication].self, from: data)
                medications = decodedItems
            } catch {
                print("Error loading medicine item data: \(error)")
            }
        }
    
    // MARK: - Helper Methods

    func todaysDate() -> String {
        let date = Date()
        let format = DateFormatter()
        format.timeZone = TimeZone(abbreviation: "PST")
        format.dateFormat = "MM-dd-yyyy"
        let formattedDate = format.string(from: date)
        return formattedDate
     }
    func getDayOfWeek(_ today:String) -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        formatter.timeZone = TimeZone(abbreviation: "PST")
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    }

    func getToday() -> String {
       let today = todaysDate()
        let numberDay = getDayOfWeek(today)
        switch numberDay {
        case 1:
            return "Sunday"
        case 2:
            return "Monday"
        case 3:
            return "Tuesday"
        case 4:
            return "Wednesday"
        case 5:
            return "Thursday"
        case 6:
            return "Friday"
        default:
            return "Saturday"
        }
    
    }
}
