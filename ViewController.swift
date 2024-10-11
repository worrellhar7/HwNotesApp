import UIKit
import RealmSwift

class Note: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let realm = try! Realm()
    var notes: Results<Note>?

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Notes"

        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)

        notes = realm.objects(Note.self)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "noteCell")
        if let note = notes?[indexPath.row] {
            cell.textLabel?.text = note.title
            cell.detailTextLabel?.text = note.content
        }
        return cell
    }
}