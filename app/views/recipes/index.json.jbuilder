json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :clicks, :user_id, :ingredients, :steps, :prep_time, :cook_time, :show
  json.url recipe_url(recipe, format: :json)
end
