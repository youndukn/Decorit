json.array!(@publishes) do |publish|
  json.extract! publish, :publishTitle
  json.url publish_url(publish, format: :json)
end
