//
//  RMCharacterViewController.swift
//  Rick&Morthy
//
//  Created by Mukhammademin Eminov on 27/04/23.
//

import UIKit

final class RMCharacterViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(
            endpoint: .character,
            //pathComponents: [""],
            queryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive" )]
        )
        print(request.url)

        RMService.shared.execute(request, expecting: RMCharacter.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure( let error):
                print(String(describing: error))
            }
        }
    }
}
