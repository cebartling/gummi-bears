class AddInvestmentTransactionTypeEnum < ActiveRecord::Migration[6.0]

  def up
    execute <<-SQL
    CREATE TYPE investment_transaction_type AS ENUM ('buy', 'sell');
    SQL
  end

  def down
    execute <<-SQL
    DROP TYPE investment_transaction_type;
    SQL
  end

end
