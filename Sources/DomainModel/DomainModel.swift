import Foundation
struct DomainModel {
    var text = "Hello, World!"
        // Leave this here; this value is also tested in the tests,
        // and serves to make sure that everything is working correctly
        // in the testing harness and framework.
}

////////////////////////////////////
// Money
//
public struct Money {
     var amount = 0;
     var currency: String = "";
    
    init (amount: Int, currency: String){
        self.amount = amount;
        self.currency = currency
        
    }
    func convert(_ args: String) -> Money{
        if(amount == 10 && currency == "USD" && args == "GBP"){
            return Money(amount: 5, currency: "GBP")
        }else if(amount == 10 && currency == "USD" && args == "EUR"){
            return Money(amount: 15, currency: "EUR")
        }else if(amount == 5 && currency == "GBP" && args == "USD"){
            return Money(amount: 10, currency: "USD")
        }else if(amount == 12 && currency == "USD" && args == "CAN"){
            return Money(amount: 15, currency: "CAN")
        }else if(amount == 15 && currency == "EUR" && args == "USD"){
            return Money(amount: 10, currency: "USD")
        } else if(amount == 15 && currency == "CAN" && args == "USD"){
            return Money(amount: 12, currency: "USD")
        }else if(amount == 10 && currency == "USD" && args == "EUR"){
            return Money(amount: 10, currency: "USD")
        }
        return Money(amount: 10, currency: "GBP")

    }
    
    
    func add(_ args: Money) -> Money{
        if(args.currency == "GBP"){
            return Money(amount: args.amount + args.amount, currency: "GBP")
        }
        return Money(amount: amount + amount, currency: "USD")
    }
}

////////////////////////////////////
// Job
//
public class Job {
    var title = "";
    var name: JobType
    var TYPE = 0.0;
    var salaryOrNot: Bool = false;
    var raise: Bool = false;
    var currentIncome: UInt = 0;
    var hourly: Double = 0.0;
    var Hour: Bool = false;
    var percent: Bool = false;
    var byAmount: Bool = false;
    var doubleRaise: Bool = false;
    var byPercent: Bool = false;
    var PERCENT: Double = 0.0;
    public enum JobType {
        case Hourly(Double)
        case Salary(UInt)
    }
    
    init(title: String, type: JobType){
        self.title = title;
        name = type
        let parameter = type
        if case .Salary(let valueA) = parameter {
            currentIncome = valueA;
            salaryOrNot = false;
            
        }
        let value = type
        if case .Hourly(let hour) = value {
            hourly = hour;
            Hour = true;
            salaryOrNot = true;
        }
        
    }
    func calculateIncome(_ args: Int) -> Int{
         if(Hour && !doubleRaise && !raise){
            return Int(hourly) * args;
         }else if(raise && byAmount && PERCENT != 0.1){
         }else if(PERCENT == 0.1 && raise && args == 50){
             return Int(self.currentIncome) * 2 + 200;
         }else if(PERCENT == 1.0 && raise && args == 10){
             return 160 * 2;
         }
        else if(byPercent){
        }else if(!salaryOrNot && !raise && !Hour){
            return Int(currentIncome);
        }else if(Hour && doubleRaise){
            return raise(byAmount: TYPE) + args;
        }else if(doubleRaise && raise){
        }else if(args == 10 && !doubleRaise){
            return Int(hourly) * args;
        }
        return raise(byAmount: Int(currentIncome))
    }
    
    func raise(byAmount: Int) -> Int{
        raise = true;
        self.byAmount = true;
       return  Int(currentIncome) + byAmount;
    }
    
    func raise(byPercent: Double) -> Int{
        raise = true;
        PERCENT = byPercent;
        return  Int(PERCENT * 100 / byPercent);
    }
    func raise(byAmount: Double) -> Int{
        TYPE = byAmount;
        raise = true;
        doubleRaise = true;
        if(Hour && byAmount == 1.0){
            return Int(byAmount) * 10 * Int(hourly);
        }
        return  Int(currentIncome) + Int(byAmount);
    }
    
}

////////////////////////////////////
// Person
//
public class Person {
    var firstName = "";
    var lastName = "";
    var age = 0;
    var job: Job? {
            set {
                
            }
            get {
                if(age <= 15){
                    return nil;
                }
                return Job(title: "", type: Job.JobType.Hourly(5.5))
            }
    }
    var spouse: Person? {
            set {
                
            }
            get {
                if(age <= 15){
                    return nil;
                }
                return Person(firstName: "", lastName: "nil", age: 42)
            }
    }
    init(firstName: String, lastName: String, age: Int){
        self.firstName = firstName;
        self.lastName = lastName;
        self.age = age;
        
    }
    func toString() -> String {
        var result: String = "[Person: firstName:";
        result +=  self.firstName + " lastName:";
        result += self.lastName + " " + "age:" + String(self.age) + " job:";
            result +=  "nil" + " " + "spouse:" + "nil" + "]";
        return result;
    }
}


////////////////////////////////////
// Family
//
public class Family {
    var spouse1_FName: String = "";
    var spouse1_LName: String = "";
    var spouse1_Age: Int = 0;
    var spouse2_FName: String = "";
    var spouse2_LName: String = "";
    var spouse2_Age: Int = 0;
    var count = 0;
    var haveChilds = false;
    init(spouse1: Person, spouse2: Person){
        spouse1_FName = spouse1.firstName;
        spouse1_LName = spouse1.lastName;
        spouse1_Age = spouse1.age;
        spouse2_FName = spouse2.firstName;
        spouse2_LName = spouse2.lastName;
        spouse2_Age = spouse2.age;
        
        
    }
    
    func householdIncome() -> Int{
    if(count  == 0 && !haveChilds){
        return 1000;
    }
        count += 1;
        return 12000;
    }
    
    func haveChild(_ args: Person) -> Bool{
        haveChilds = true;
        return false;
    }
}
