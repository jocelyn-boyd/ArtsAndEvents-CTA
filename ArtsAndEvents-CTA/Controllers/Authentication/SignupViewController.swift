//
//  SignupViewController.swift
//  ArtsAndEvents-CTA
//
//  Created by Jocelyn Boyd on 3/5/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {

  //MARK: - Variables and Properties
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var signupButton: UIButton!
  @IBOutlet weak var experiencePicker: UIPickerView!
  
  var pickerData = ["Ticketmaster", "Rijksmuseum"]
  var apiKeyworkHolder = "Ticketmaster"
  
  //MARK: - Lifecyle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
      setupPickerDelegates()
    }
  
  //MARK: - Private Methods
  private func setupPickerDelegates() {
    experiencePicker.dataSource = self
    experiencePicker.delegate = self
  }
  
  private func setupNavivationBar() {
    //code here
  }
  
  private func showCustomAlert(withTitle: String, withMessage: String) {
    let customAlert = UIAlertController(title: withTitle, message: withMessage, preferredStyle: .alert)
    customAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    present(self, animated: true, completion: nil)
  }
  
  private func handleCreateNewUserInFirebase(result: Result<(),Error>) {
    switch result {
    case .success:
      guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
        let sceneDelegate = windowScene.delegate as? SceneDelegate,
        let window = sceneDelegate.window else {return}
      
      UIView.transition(with: window, duration: 0.3, options: .transitionCurlDown, animations: {
          window.rootViewController = MainTabViewController()
      }, completion: nil)

      
    case .failure(let error):
      print(error)
    }
  }

  private func handleCreateAccountResponse(with result: Result<User,Error>) {
    DispatchQueue.main.async {
      switch result {
      case .success(let user):
        FirebaseFirestore.manager.createAppUser(user: AppUser(init: user, userExperience: self.apiKeyworkHolder)) { [weak self] (newResult) in
          self!.handleCreateNewUserInFirebase(result: newResult)
        }
      case .failure(let error):
        self.showCustomAlert(withTitle: "Error", withMessage: "An error occured while creating a new account. \(error)_")
      }
    }
  }
  
  //MARK: - IBAction Methods
  @IBAction func signupButtonPressed(_ sender: UIButton) {
    guard let newUserEmail = emailTextField.text, let newUserPassword = passwordTextField.text else {
      showCustomAlert(withTitle: "Error", withMessage: "Please fill out all fields")
      return
    }
    
    guard newUserEmail.isValidEmail else {
      showCustomAlert(withTitle: "Error", withMessage: "Please enter a vaild email address")
      return
    }
    
    guard newUserPassword.isValidPassword else {
      showCustomAlert(withTitle: "Error", withMessage: "Password must be at least 8 characters long")
      return
    }
    
    FirebaseAuthService.manager.createNewUser(email: newUserEmail.lowercased(), password: newUserPassword) { [weak self] (result) in
      self!.handleCreateAccountResponse(with: result)
    }
  }
    
}

//MARK: - UIPicker Data Source and Delegates
extension SignupViewController: UIPickerViewDelegate {
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerData[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    apiKeyworkHolder = pickerData[row]
  }
}

extension SignupViewController: UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    pickerData.count
  }
}
