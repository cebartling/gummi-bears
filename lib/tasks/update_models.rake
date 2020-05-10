namespace :update_models do

  desc "Updates the user stock transaction, ensuring calculations are run."
  task :user_stock_transaction => :environment do
    user_stock_transactions = UserStockTransaction.all
    user_stock_transactions.each do |user_stock_transaction|
      puts "===> Updating user stock transaction - #{user_stock_transaction.id}..."
      user_stock_transaction.save!
    end
  end

end
