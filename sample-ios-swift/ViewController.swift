//
//  ViewController.swift
//  sample-ios-swift
//
//  Created by noboru ishikura on 2018/03/05.
//  Copyright © 2018年 monstar-lab. All rights reserved.
//

import UIKit

import SVProgressHUD
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let observable: Observable<Int> = Observable.interval(1, scheduler: MainScheduler.instance)
        _ = observable
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { _ in
                if (SVProgressHUD.isVisible()) {
                    SVProgressHUD.dismiss()
                } else {
                    SVProgressHUD.show(withStatus: "Sample iOS app")
                }
            })
    }
}
