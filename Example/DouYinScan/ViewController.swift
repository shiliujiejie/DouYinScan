//
//  ViewController.swift
//  DouYinScan
//
//  Created by shiliujiejie on 05/08/2019.
//  Copyright (c) 2019 shiliujiejie. All rights reserved.
//

import UIKit
import DouYinScan

class ViewController: UIViewController {

    @IBOutlet weak var codeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func scanQRCode(_ sender: UIButton) {
        scanQRCode()
    }
    
    @IBAction func createQRcode(_ sender: UIButton) {
        createQrCode()
    }
    
    @IBAction func getInfoFromQRCode(_ sender: UIButton) {
        
        let arrayResult = ScanWrapper.recognizeQRImage(image: UIImage(named: "Unknown")!)
        if arrayResult.count > 0 {
            let result = arrayResult[0]
            print("result = \(result)")
            if let resultString = result.strScanned, !resultString.isEmpty {
               showAlert(resultString)
            } else {
                showAlert("没有识别到。。。。。。")
            }
        }
    }
    
    // MARK: - 扫描身份二维码
    private func scanQRCode() {
        //设置扫码区域参数
        var style = ScanViewStyle()
        style.centerUpOffset = 44
        style.photoframeAngleStyle = ScanViewPhotoframeAngleStyle.Inner
        style.photoframeLineW = 2
        style.photoframeAngleW = 18
        style.photoframeAngleH = 18
        style.isNeedShowRetangle = false
        style.anmiationStyle = ScanViewAnimationStyle.LineMove
        style.colorAngle = UIColor.green
        
        style.animationImage = UIImage(named: "qrcode_Scan_weixin_Line")
        
        let vc = ScanIDQRCodeController()
        vc.scanStyle = style
        vc.scanResultDelegate = self
       
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createQrCode() {
        let qrImg = ScanWrapper.createCode(codeType: "CIQRCodeGenerator", codeString: "http://www.baidu.com", size: CGSize(width: 200, height: 200), qrColor: UIColor.black, bkColor: UIColor.lightGray)
        
        /// 不加logol
        // codeImage.image = qrImg
        
        /// 加 logol
        let logoImg = UIImage(named: "iconShare")
        codeImage.image = ScanWrapper.addImageLogo(srcImg: qrImg!, logoImg: logoImg!, logoSize: CGSize(width: 30, height: 30))
    }
    
    private func showAlert(_ result: String?) {
        let alert = UIAlertController.init(title: "扫描/识别 结果", message: result, preferredStyle: .alert)
        let cancleAct = UIAlertAction.init(title: "知道了", style: .cancel, handler: nil)
        alert.addAction(cancleAct)
        self.present(alert, animated: true, completion: nil)
    }
    

}

// MARK: - ScanViewControllerDelegate
extension ViewController: ScanViewControllerDelegate {
    
    func scanFinished(scanResult: ScanResult, error: String?) {
        print("scanResult: -----> \(scanResult)")
        showAlert(scanResult.strScanned)
    }
}
