//: Playground - noun: a place where people can play

import UIKit

//Question 1
func squaredSums(numbers: [Int])  -> Int {
    var result = 0;
    
    numbers.forEach { (element) in
        result += (element * element);
    }
    
    return result;
}

//Question 2
func squaredSums2(numbers: [Int]) -> Int {
    var result = 0;
    
    numbers.forEach { (element) in
        if(element != 0 && (element % 2 == 0)) {
            result += (element * element);
        }
    }
    return result;
}

//Question 3
func squaredSums3(numbers: Array<Int?>) -> Int {
    var result: Int = 0;
    
    numbers.compactMap({$0}).forEach{(element) in
        if(element != 0 && element % 2 == 0) {
            result += (element * element);
        }
    }

    return result;
}

//Question 4
func squaredSums4(numbers: Array<Int?>) -> Int? {
    var result: Int? = 0;
    
    numbers.compactMap({$0}).forEach{(element) in
        if(element != 0 && element % 2 == 0), let tempResult = result {
            result = tempResult + (element * element);
        }
    }
    
    return result;
}

//Question 5
func squaredSums5(numbers: Array<Int?>) -> Int {
    let result: Int = numbers.compactMap{ $0 }.filter { $0 > 0 && ($0 % 2 == 0) }.reduce(0) {
        (accumulation: Int, nextValue: Int) -> Int in
        return accumulation + (nextValue * nextValue)
    };
    return result;
}

//Question 6
func squaredSums6<T: Collection>(numbers: T) -> Int {
    var result : Int = 0;
    
    switch numbers {

    case is Array<Int> :
        let arrayOfInts = numbers as! Array<Int>;
        result = arrayOfInts.compactMap { $0 }.filter{ $0 > 0 && ($0 % 2 == 0) }.reduce(0) {
            (accumulation: Int, nextValue: Int) -> Int in
            return accumulation + (nextValue * nextValue)
        };
        return result;

    case is Set<Int> :
        let setOfInts = numbers as! Set<Int>;
        result = setOfInts.compactMap{ $0 }.filter{ $0 > 0 && ($0 % 2 == 0) }.reduce(0) {
            (accumulation: Int, nextValue: Int) -> Int in
            return accumulation + (nextValue * nextValue)
        };
        return result;
    case is Dictionary<Int, Int> :
        let dictionaryOfInts = numbers as! Dictionary<Int, Int>;
        result = dictionaryOfInts.compactMap { $0.value }.filter{ $0 > 0 && ($0 % 2 == 0)}.reduce(0) {
            (accumulation: Int, nextValue: Int) -> Int in
            return accumulation + (nextValue * nextValue)
        };
        return result;
    default:
        return result;
    }
}

//Question 7
struct Student {
    var name: String;
    var redid: Int;
    var units: Int;
    var gpa: Double;
    
    func priority() -> Double {
        return Double(self.units) * self.gpa;
    }
}

extension Student: Equatable {}

func ==(leftHandStudent: Student, rightHandStudent: Student) -> Bool {
    let areEqual = leftHandStudent.redid == rightHandStudent.redid;
    return areEqual
}

//Question 8
class PriorityQueue  {
    var students: Array<Student>;
    
    init(students: Array<Student>) {
        self.students = students;
    }
    
    func addStudent(student: Student) {
        self.students.append(student);
    }
    
    func first() -> Student? {
        return highestPriorityStudent();
    }
    
    func removeFirst() -> Student? {
        if let student = highestPriorityStudent(), let index = self.students.index(of: student) {
            self.students.remove(at: index);
            return student;
        }
        return nil;
    }

    private func highestPriorityStudent() -> Student? {
        return self.students.sorted(by: {$0.priority() > $1.priority()}).first;
    }
}
