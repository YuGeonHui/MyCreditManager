//
//  main.swift
//  MyCreditManager
//
//  Created by geonhui Yu on 2023/04/21.
//

import Foundation

enum CreditError: Error {
    
    case inputErr
    case noSearchStudent
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
    var subject: String?
    var grade: Grade?
}

private var totalStudent: [Student] = []

private func convertToGrade(_ grade: String) -> Grade? {
    
    switch grade {
    case "A+": return .Aplus
    case "A": return .A
    case "B+": return .Bplus
    case "B": return .B
    case "C+": return .Cplus
    case "C": return .C
    case "D+": return .Dplus
    case "D": return .D
    case "F": return .F
    default: do { return nil }
    }
}

// MARK: 학생추가
func addNewStudent() {
    
    print("추가할 학생의 이름을 입력해주세요")
    
    guard let name = readLine(), name != "" else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }
    
    if totalStudent.contains(where: { $0.name == name }) {
        
        print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        
    } else {
        
        let newStudent = Student(name: name, subject: nil, grade: nil)
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

// MARK: 성적추가
func changeScore() {
    
    print("성적을 추가할 학생의 이름, 과목이름, 성적(A+, A, F등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력예) Mickey Swift A+")
    print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
    
    guard let score = readLine(), score != "" else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }
    
    let seperators = CharacterSet(charactersIn: " ")
    let words = score.components(separatedBy: seperators)
    
    if words.count == 3 {
        
        let name = words[0]
        let subject = words[1]
        let upperGrade = words[2].uppercased()
        
        guard let grade = convertToGrade(upperGrade) else {
            print("올바른 성적을 입력해주세요.")
            return
        }
        
        var student = Student(name: name, subject: subject, grade: grade)
        totalStudent.append(student)
    }
    
    
    // 해당학생이 존재하지 않는 경우 (학생을 추가해준다? / 오류를 뱉는다)
    // 잘못 입력한 경우 (띄어쓰기 오류, 입력 안했을 오류)
    // 학점 입력이 잘 못된 경우 (알파벳)
    
    print(words)
}

// MARK: 성적삭제
func removeScore() {
    
    print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    
}

// MARK: 평점보기
func showScore() {
    
    print("평점을 알고 싶은 학생의 이름을 입력해주세요.")
    
    guard let name = readLine() else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }
    
    let studentScore = totalStudent.filter { $0.name == name }
    
    print(studentScore.count)
}

func exit() {
    return
}

func inputError() {
    
}

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

