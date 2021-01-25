//: [Previous](@previous)

/*
 # [Chain of Responsibility - Example](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/03-Behavioral-PatternsPt.1/assignments/chain-example.md)
 */

class Expenditure {
    private var _amount = Int()
    var amount : Int{
        get{
            return _amount
        }
        set {
            _amount = newValue
        }
    }
    init(amount : Int) {
        self.amount = amount
    }
}

protocol Chain {
    var nextManagementLevel : Chain { get set } //help with he
    func shouldApproveExpenditure(expenditure : Expenditure)
}

class StudentCouncil : Chain {

    private var _nextManagementLevel : Chain?
    var nextManagementLevel : Chain { //it will have a link to another class in the chain
        set{
            _nextManagementLevel = newValue
        }
        get{
            return _nextManagementLevel!
        }
    }

    func shouldApproveExpenditure(expenditure : Expenditure) {
        if expenditure.amount > 0 && expenditure.amount < 100 {
            print("A student from the Student Council (Ariane) can approve this expenditure")
        } else {
            if _nextManagementLevel != nil{
                nextManagementLevel.shouldApproveExpenditure(expenditure: expenditure)
            }
        }
    }
}

class StudentExp : Chain {

    private var _nextManagementLevel : Chain?
    var nextManagementLevel : Chain{
        set{
            _nextManagementLevel = newValue
        }
        get{
            return _nextManagementLevel!
        }
    }

    func shouldApproveExpenditure(expenditure : Expenditure) {
        if expenditure.amount > 101 && expenditure.amount < 1000 {
            print("Megan or Lisa can approve this expenditure.")
        } else {
            if _nextManagementLevel != nil{
                nextManagementLevel.shouldApproveExpenditure(expenditure: expenditure)
            }
        }
    }
}

class Dean : Chain {

    private var _nextManagementLevel : Chain?
    var nextManagementLevel : Chain{
        set{
            _nextManagementLevel = newValue
        }
        get{
            return _nextManagementLevel!
        }
    }

    func shouldApproveExpenditure(expenditure : Expenditure) {
        if expenditure.amount > 1001 && expenditure.amount < 10000 {
            print("Anne can approve this expenditure.")
        } else {
            print("$\(expenditure.amount) expenditure is too large and won't get approved, sorry.")
        }
    }
}


let studentCouncil = StudentCouncil()
let studentExp = StudentExp()
let dean = Dean()

studentCouncil.nextManagementLevel = studentExp
studentExp.nextManagementLevel = dean

let expenditure = Expenditure(amount: 5)
studentCouncil.shouldApproveExpenditure(expenditure: expenditure)

expenditure.amount = 500
studentCouncil.shouldApproveExpenditure(expenditure: expenditure)

expenditure.amount = 5000
studentCouncil.shouldApproveExpenditure(expenditure: expenditure)

expenditure.amount = 50000
studentCouncil.shouldApproveExpenditure(expenditure: expenditure)

//: [Next](@next)
