FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Some rationale"
    overtime_request 3.5
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Some rationale"
    overtime_request 0.5
    user
  end

  # factory :post_from_other_user, class: "Post" do
  #   date Date.yesterday
  #   rationale "Some more content in this thing"
  #   non_authorized_user
  # end
end
