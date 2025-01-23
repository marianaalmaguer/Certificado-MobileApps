//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Mariana Almaguer Gonzalez on 22/04/24.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    var athlete: Athlete?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    
    init?(coder: NSCoder, athlete: Athlete?){
        super.init(coder: coder)
        self.athlete = athlete
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        self.athlete = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    func updateView(){
        guard let existingAthlete = athlete else {return}
        nameTextField.text = existingAthlete.name
        ageTextField.text = existingAthlete.age
        leagueTextField.text = existingAthlete.league
        teamTextField.text = existingAthlete.team
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text,
              let age = ageTextField.text,
              let league = leagueTextField.text,
              let team = teamTextField.text else {return}
        athlete = Athlete(name: name, age: age, league: league, team: team)
        performSegue(withIdentifier: "UnwindToAthleteTable", sender: self)
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
