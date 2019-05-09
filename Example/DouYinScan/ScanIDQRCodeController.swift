
import UIKit
import DouYinScan

class ScanIDQRCodeController: ScanViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
  
    var libraryClickHandler:(()-> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func photoBtnClick(_ sender: UIButton) {
        libraryClickHandler?()
        navigationController?.popViewController(animated: false)
    }
}

