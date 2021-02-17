require_relative 'bank_account'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      false
    end
  end

#  def execute_transaction
#     if @sender.balance > @amount && valid? && @status == "pending"
#       @receiver.balance += @amount
#       @sender.balance -= @amount
#       @status = "complete"
#     else
#       @status = "rejected"
#       return "Transaction rejected. Please check your account balance."
#     end
#   end

  # def execute_transaction
  #   if valid? && @sender.balance > self.amount && self.status == "pending"
  #     @sender.balance -= self.amount
  #     receiver.balance += self.amount
  #     self.status = "complete"
  #   else
  #     self.status = "rejected"
  #     "Transaction rejected. Please check your account balance."
  #   end
  # end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if @status == "complete"
    @receiver.balance -= @amount
    @sender.balance += @amount
    @status = "reversed"
    end
  end
end
