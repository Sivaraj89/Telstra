
import UIKit
import SDWebImage


class ViewController: UIViewController,serviceCalls {
   
    let first = FirstView()
    let cellObj = CollectionViewCell()
    let parse = JsonParser()
    var obj = Objects()
    let webIns = WebService()
    var spinner : UIActivityIndicatorView!
    
    var collectedArray:Array<Any> = []
    var height:CGFloat!
    var imgArray :Array<Any> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        height = 100
        webIns.service = self
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.webCallInitiated()
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
        let collectionview_height = NSLayoutConstraint(item: first.collectionview, attribute:.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: first, attribute:.height, multiplier: 0.87, constant: 0)
        self.view.addConstraints([collectionview_x, collectionview_y, collectionview_width, collectionview_height])
        
        
        first.refressButton.translatesAutoresizingMaskIntoConstraints = false
        let butt_x = NSLayoutConstraint(item: first.refressButton, attribute:.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: first.collectionview, attribute:.bottomMargin, multiplier: 1, constant: 0)
        let butt_y = NSLayoutConstraint(item: first.refressButton, attribute:.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: first, attribute:.left, multiplier: 1, constant: 0)
        let butt_width = NSLayoutConstraint(item: first.refressButton, attribute:.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: first, attribute:.width, multiplier: 1, constant: 0)
        let butt_height = NSLayoutConstraint(item: first.refressButton, attribute:.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: first, attribute:.height, multiplier: 0.10, constant: 0)
        self.view.addConstraints([butt_x, butt_y, butt_width, butt_height])
        
        
        
    }
    
    @objc func webCallInitiated(){
         self.presentAlert()
        // Web Call Initiated
        webIns.webCall(webUrl: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
        
    }
    
    func presentAlert(){
        // Added Loading Alert
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        alert.view.tintColor = UIColor.black
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        //loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func dismissAlert(){
        dismiss(animated: false, completion: nil)
    }
    
    
    //protocol method
    func serviceDict(dict: Dictionary<AnyHashable, Any>) {
        self.title = (dict["title"] as! String)
        collectedArray = parse.parseObj(dict: dict)
        self.dismissAlert()
        first.collectionview.dataSource = self
        first.collectionview.delegate = self
        first.collectionview.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        first.refressButton.addTarget(self, action: #selector(self.webCallInitiated), for: .touchDown)
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
            
            if let image = image{
                self.height = (image.size.height)
            }
            
        })
        cell.showCaseImage.frame.height == self.height
        cell.nameLabel.text = obj.name
        cell.descri.text = obj.descrip
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
         obj = (collectedArray[indexPath.row] as? Objects)!
        if let url = URL(string: obj.image!){
            if let data = try? Data(contentsOf: url)
            {
                let image: UIImage = UIImage(data: data)!
                self.height = image.size.height
            }
        }
        
        return CGSize(width: self.view.frame.width, height: height)
    }


}

