
class BankAccount {
    var accountBalance: Float
    var accountNumber: Int
    
    init(balance: Float, number: Int) {
        self.accountBalance = balance
        self.accountNumber = number
    }
    
    func displayBalance() {
        print("""
            Account number is \(accountNumber)
            Your balance is \(accountBalance)
        """)
    }
    
    class func getMaxBalance() -> Float {
        return 100000.00
    }
}

var account1: BankAccount = BankAccount(balance: 50000.00, number: 123456789)
account1.displayBalance()
print("Max balance is \(BankAccount.getMaxBalance())")
