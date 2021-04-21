//
//  CharacterListTableViewController.swift
//  Marvel
//
//  Created by Angelo Esquibel on 4/16/21.
//

import UIKit

class CharacterListTableViewController: UITableViewController {
    
    var characters: [Hero] = []
    var total = 0
    var currentPage = 0
    var isLoadingCharacters = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName:"CharacterListTableViewCell",
                                      bundle: nil),
                                forCellReuseIdentifier: "CharacterListTableViewCell")
        self.tableView.estimatedRowHeight = 85
        loadCharacters()
    }
    
    func loadCharacters() {
        isLoadingCharacters = true
        MarvelAPI.getCharacters(name: "", page: currentPage, completion: { result in
            if let result = result {
                self.characters += result.data.results
                self.total = result.data.total
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            self.isLoadingCharacters = false
            
        })
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: "CharacterListTableViewCell",
                                                         for: indexPath)
        let character = characters[indexPath.row]
        guard let cell = dequeuedCell as? CharacterListTableViewCell else { return dequeuedCell }
        cell.setup(with: character)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == characters.count - 20 && !isLoadingCharacters && characters.count != total {
            currentPage += 1
            loadCharacters()
        }
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
