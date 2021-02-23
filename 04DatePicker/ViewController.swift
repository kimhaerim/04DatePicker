//
//  ViewController.swift
//  04DatePicker
//
//  Created by 김해림 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    //타이머가 구동되면 실행할 함수를 지정
    //#selector의 인자로 사용될 메서드를 선언할 때는 @objc 키워드가 필요함
    let interval = 1.0
    //타이머의 간격 값, 1초
    var count = 0
    //타이머가 설정한 간격대로 실행되는지 확인
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPikerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    @IBAction func changeDatePiker(_ sender: UIDatePicker) {
        let datePickerView = sender
        //sender를 datePickerView라는 상수에 저장함
        
        let formatter = DateFormatter()
        //날짜 출력을 위한 DateFormatter라는 클래스 상수를 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        //format을 설정
        lblPikerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
        //string메서드를 이용하여 문자열로 변환함
    }
    
    @objc func updateTime(){ //timeSelector에서 정의한 이름과 동일
        //@objc 키워드로 오브젝티브-C와 호환
//        lblCurrentTime.text = String(count)
//        count = count + 1
        
        let date = NSDate()
        //현재 시간을 가져옴
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
    }
    
}

