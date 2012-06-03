
FactoryGirl.define do
  factory :object, :class => Refinery::Objects::Object do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

