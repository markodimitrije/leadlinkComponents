
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
//        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName: "LabelAndTextFieldCell", bundle: nil), forCellReuseIdentifier: "LabelAndTextFieldCell")
        self.tableView.register(UINib.init(nibName: "LabelAndTextFieldCell", bundle: nil), forCellReuseIdentifier: "LabelAndTextFieldCell")
        self.tableView.register(UINib.init(nibName: "LabelAndTextViewCell", bundle: nil), forCellReuseIdentifier: "LabelAndTextViewCell")
        self.tableView.register(UINib.init(nibName: "CheckboxViewCell", bundle: nil), forCellReuseIdentifier: "CheckboxViewCell")
        self.tableView.register(UINib.init(nibName: "DescriptionCell", bundle: nil), forCellReuseIdentifier: "DescriptionCell")
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelAndTextFieldCell", for: indexPath) as! LabelAndTextFieldCell
            cell.childView.update(headlineText: data[indexPath.row], inputTxt: data[indexPath.row], placeholderTxt: data[indexPath.row])
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelAndTextFieldCell", for: indexPath) as! LabelAndTextFieldCell
            cell.childView.update(headlineText: data[indexPath.row], inputTxt: data[indexPath.row], placeholderTxt: data[indexPath.row])
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as! DescriptionCell
            cell.txtLabel.text = data[indexPath.row]
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelAndTextViewCell", for: indexPath) as! LabelAndTextViewCell
            cell.childView.update(headlineText: data[indexPath.row], inputTxt: data[indexPath.row], placeholderTxt: "")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckboxViewCell", for: indexPath) as! CheckboxViewCell
            let option = CheckboxOption(id: 0, isOn: false, text: data[indexPath.row])
            cell.childView.update(option: option)
            return cell
        }
        
    }
    
}

//let data: [String] = ["",
//                      "dhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcahndhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcah",
//                      "dhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcah",
//                      "dhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcah"
//]
let data: [String] = [
                      "dfssfd sf d fds fds fds  dfs sfd fsd  sfv vs fdf v fvs sf vfsv f fs d  sd fds dfs  fds dffsfds sd f dfs df  df sd sdf sdf fds v  vfs s fsss f fds fds"
]

//let data: [String] = ["",
//                      "question.question.\nheadlineText\nquestion.question.inputTxt\nquestion.question.\nnputTxtnquestion \n.question. inputTxtquestion.\nquestion. inputTxt",
//                      "dhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcah",
//                      "dhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcah\ndhsabdbuudcah"
//]


//question.question.headlineText\nquestion.question.inputTxt\nquestion.question.inputTxtnquestion.question.inputTxt", inputTxt: "question.question.inputTxt
