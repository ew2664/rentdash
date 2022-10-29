FactoryBot.define do
    factory :rental_request do
      pick_up_date { "2022-10-28 00:00:00 UTC" }
      return_date {"2022-10-29 00:00:00 UTC"}
      association :listing_id, factory: :listing
      association :requester, factory: :requester
    end
end