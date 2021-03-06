//
//  UserViewController.swift
//  UserList
//
//  Created Apple on 4/7/20.
//  Copyright © 2020 VNPay. All rights reserved.
//
//  Template generated by @thetay
//

import UIKit
import Alamofire
final class UserViewController: BaseViewController {

  @IBOutlet weak var userTabelView: UITableView!
  var interactor: UserInteractable?
    var userEntity:[UserEntity] = []
    
    // MARK: IBOutlet
    
  override func initInteractor(with context: RouteContext?) {
        let router = UserRouter(viewController: self)
        interactor = UserInteractor(presenter: self)
        interactor?.setContext(to: context)
        interactor?.router = router
    }
  
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
      
      interactor?.fetchUser(username: "kevin")
      userTabelView.delegate = self
      userTabelView.dataSource = self
      userTabelView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }
       
    // MARK: Setup UI
    private func setupView() {
           
    }
    
    func validate() -> Bool {
        return true
    }
}

// MARK: UserPresentable
extension UserViewController: UserPresentable {
  func set(viewModel: [UserEntity]) {
    DispatchQueue.main.async {
      self.userEntity = viewModel
      self.userTabelView.reloadData()
    }
    
  }
  
}

//MARK: Extending UITableViewDelegate

extension UserViewController:UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return userEntity.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? UITableViewCell else {
      return UITableViewCell()
    }
    
    let item = userEntity[indexPath.row]
    
    Alamofire.request(item.avatar_url).responseData { (response) in
      
      if response.error == nil{
        if response.data != nil
        {
          DispatchQueue.main.async {
            cell.imageView?.image = UIImage(data: response.data!)
            cell.textLabel?.text = item.login
          }
        }
      }
    }
    
    return cell
  }
  
  
  

}

//MARK:Extending UITableViewDataSource

extension UserViewController:UITableViewDelegate{


}
