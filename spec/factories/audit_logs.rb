FactoryGirl.define do
  factory :audit_log do
    user nil
    status 1
    start_date "2017-01-03"
    end_date "2017-01-03"
  end
end