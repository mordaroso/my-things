module LoansHelper
  def loan_class(loan)
    return 'new_loan' if loan.new_record?
    "loan_#{loan.id}"
  end
end
