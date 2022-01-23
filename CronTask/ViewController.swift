//
//  ViewController.swift
//  CronTask
//
//  Created by Eldar on 23.01.2022.
//

import UIKit

class ViewController: UIViewController {
    

    
    let networkDataFetcher = NetworkDataFetcher()
    var personsModel: PersonModel? = nil
    let urlString = "http://app.cre.ru/api8/PlayersPersonList"
    
    @IBOutlet weak var tableView: UITableView!
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTableView()
        getData()
        
        
        
        
    }
    
    private func getData() {
        self.networkDataFetcher.fetchPerson(urlString: urlString) { (personsModel) in
            guard let personsModel = personsModel else { return }
            self.personsModel = personsModel
            self.tableView.reloadData()
        }
    }
    
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsModel?.data.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PersonsTableViewCell
        let persons = personsModel?.data[indexPath.row]
        cell.configure(with: persons)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let persons = personsModel?.data[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        detailVC.person = persons
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

