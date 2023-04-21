//
//  main.swift
//  MyCreditManager
//
//  Created by geonhui Yu on 2023/04/21.
//

import Foundation

//- 학생추가
//- 학생삭제
//- 성적추가(변경)
//- 성적삭제
//- 평점보기
//- 종료

//- 사용자가 종료 메뉴를 선택하기 전까지는 계속해서 사용자의 입력을 받습니다
//- 메뉴선택을 포함한 모든 입력은 숫자 또는 영문으로 받습니다

//- A+ (4.5점) / A (4점)
//- B+ (3.5점) / B (3점)
//- C+ (2.5점) / C (2점)
//- D+ (1.5점) / D (1점)
//- F (0점)


//## 평점
//
//- 각 과목의 점수 총 합 / 과목 수
//- 최대 소수점 2번째 자리까지 출력
//    - 예)
//        - 3.75
//        - 4.1
//        - 2

enum CreditError: Error {
    
    case inputErr
    case noSearchStudent
//    case
}

enum Grade: Double {
    case Aplus = 4.5
    case A = 4.0
    case Bplus = 3.5
    case B = 3.0
    case Cplus = 2.5
    case C = 2.0
    case Dplus = 1.5
    case D = 1.0
    case F = 0.0
}

struct Student {
    
    let name: String
    let score: [Double]?
    let average: Double?
}

struct StudetManager {
    
    private var student: Student?
}

private var totalStudent: [Student] = []

// MARK: 학생추가
func addNewStudent() {
    
    print("추가할 학생의 이름을 입력해주세요")
    
    guard let name = readLine(), name != "" else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }
    
    if totalStudent.contains(where: { $0.name == name}) {
        
        print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        
    } else {
        
        let newStudent = Student(name: name, score: nil, average: nil)
        totalStudent.append(newStudent)
        
        print("\(name) 학생을 추가했습니다.")
    }
}

// MARK: 학생삭제
func removeStudent() {
    
    print("삭제할 학생의 이름을 입력해주세요")
    
    guard let name = readLine(), name != "" else { return }
    
    if let index = totalStudent.firstIndex(where: { $0.name == name }) {
        
        totalStudent.remove(at: index)
        print("\(name)학생을 삭제하였습니다.")
        
    } else {
        
        print("\(name)학생을 찾지 못했습니다.")
    }
}

func changeScore() {
    print(#function)
}

func removeScore() {
    print(#function)
}

func showScore() {
    print(#function)
}

func exit() {
    return
}

func inputError() {
    
}

let students: [Student] = []

while true { // 종료되는 로직추가
    
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")

    let input = readLine()
    
    switch input {
    case "1": addNewStudent()
    case "2": removeStudent()
    case "3": changeScore()
    case "4": removeScore()
    case "5": showScore()
    case "X": break
    default: print("뭔가 입력이 잘못되었습니다. 1 ~ 5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}

