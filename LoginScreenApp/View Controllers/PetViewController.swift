//
//  PetViewController.swift
//  LoginScreenApp
//
//  Created by temaveselov on 18.02.2023.
//

import UIKit

class PetViewController: UIViewController {

    @IBOutlet var petImageView: UIImageView!
    @IBOutlet var petNameLabel: UILabel!
    @IBOutlet var petFavHobbyLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = user.person.pet.name
        petNameLabel.text = user.person.pet.name
        petFavHobbyLabel.text = user.person.pet.favHobby
    }
    
    override func viewWillLayoutSubviews() {
        petImageView.layer.cornerRadius = petImageView.frame.width / 2
    }

}



