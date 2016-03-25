json.array!(@publications) do |publication|
  json.extract! publication, :id, :name, :abstract, :keywords
  json.url publication_url(publication, format: :json)
end
