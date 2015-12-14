json.array!(@tests) do |test|
  json.extract! test, :id, :hello
  json.url test_url(test, format: :json)
end
