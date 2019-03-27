
import UIKit
import SDWebImage
import ProgressHUD


class ViewController: UIViewController,serviceCalls {
   
    let first = FirstView()
    let cellObj = CollectionViewCell()
    let parse = JsonParser()
    var obj = Objects()
    let webIns = WebService()
    var spinner : UIActivityIndicatorView!
    
    var collectedArray:Array<Any> = []
    var height:CGFloat!
    var rowHeightArray :Array<CGFloat> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        height = 100
        webIns.service = self
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = UIColor.lightGray
        let button1 = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(ViewController.webCallInitiated))
        self.navigationItem.rightBarButtonItem  = button1
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        self.webCallInitiated()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        first.collectionview.collectionViewLayout.invalidateLayout()
    }
    
    func addConstraints() {
        
        first.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                self.view.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
                guide.bottomAnchor.constraint(equalToSystemSpacingBelow: self.view.bottomAnchor, multiplier: 1.0)
                ])
            
        } else {
            let standardSpacing: CGFloat = 8.0
            NSLayoutConstraint.activate([
                self.view.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: standardSpacing),
                bottomLayoutGuide.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: standardSpacing)
                ])
        }
        
        let x = NSLayoutConstraint(item: first, attribute:.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute:.leading, multiplier: 1, constant: 0)
        let y = NSLayoutConstraint(item: first, attribute:.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute:.trailing, multiplier: 1, constant: 0)
        let width = NSLayoutConstraint(item: first, attribute:.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute:.width, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: first, attribute:.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute:.height, multiplier: 1, constant: 0)
        self.view.addConstraints([x, y, width, height])
        
        first.collectionview.translatesAutoresizingMaskIntoConstraints = false
        let collectionview_x = NSLayoutConstraint(item: first.collectionview, attribute:.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: first, attribute:.leading, multiplier: 1, constant: 0)
        let collectionview_y = NSLayoutConstraint(item: first.collectionview, attribute:.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: first, attribute:.trailing, multiplier: 1, constant: 0)
        let collectionview_width = NSLayoutConstraint(item: first.collectionview, attribute:.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: first, attribute:.width, multiplier: 1, constant: 0)
        let collectionview_height = NSLayoutConstraint(item: first.collectionview, attribute:.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: first, attribute:.height, multiplier: 1, constant: 0)
        self.view.addConstraints([collectionview_x, collectionview_y, collectionview_width, collectionview_height])
        
    }
    
    @objc func webCallInitiated(){
        
         self.presentAlert()
        // Web Call Initiated
        webIns.webCall(webUrl: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
        
    }
    
    func presentAlert(){
           ProgressHUD.show()
    }
    
    func dismissAlert(){
          ProgressHUD.dismiss()
    }
    
    
    func calculateHeight(array:Array<Any>)-> Array<CGFloat>{
        var rowHeight:Array<CGFloat> = []
        for i in 0..<array.count {
             obj = (collectedArray[i] as? Objects)!
            if let url = URL(string: obj.image!){
                if let data = try? Data(contentsOf: url)
                {
                    let image: UIImage = UIImage(data: data)!
                    rowHeight.append(image.size.height)
                }else{
                rowHeight.append(150)
                }
            }else{
                rowHeight.append(150)
            }
            print(obj.image!,i,rowHeight)
        }
        
        return rowHeight
    }
    
    
    //protocol method
    func serviceDict(dict: Dictionary<AnyHashable, Any>) {
        self.title = (dict["title"] as! String)
        collectedArray = parse.parseObj(dict: dict)
        rowHeightArray = calculateHeight(array: collectedArray)
        self.dismissAlert()
        first.collectionview.dataSource = self
        first.collectionview.delegate = self
        first.collectionview.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        self.view.addSubview(first)
        self.addConstraints()
    }
    
    
    
}

extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = first.collectionview.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.white
        obj = (collectedArray[indexPath.row] as? Objects)!
        let url = URL(string: obj.image!)
            // SdwebImage
            cell.showCaseImage.sd_setImage(with: url, placeholderImage: UIImage(named: ""),options: SDWebImageOptions(rawValue: 0), completed: { image, error, cacheType, imageURL in
                print(imageURL as Any,image?.size.height as Any)
            })
        cell.nameLabel.text = obj.name
        cell.descri.text = obj.descrip
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: self.view.frame.width, height:self.rowHeightArray[indexPath.row])
    }
    

}

