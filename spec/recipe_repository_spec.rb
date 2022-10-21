require "recipe_repository"

RSpec.describe RecipeRepository do
    def reset_recipes_table
        seed_sql = File.read('spec/seeds_recipes.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test'})
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_recipes_table
    end

    it 'returns list of the recipes' do 
        repo = RecipeRepository.new
        recipes = repo.all
        expect(recipes.length).to eq (2)
        expect(recipes.first.name).to eq ('Lasagne')
        expect(recipes.first.cooking_time).to eq ('45')
        expect(recipes.first.rating).to eq ('4')
    end 

    it 'returns the recipe for Lasagne' do 
        repo = RecipeRepository.new
        recipe = repo.find(1)
        expect(recipe.name).to eq ('Lasagne')
        expect(recipe.cooking_time).to eq ('45')
        expect(recipe.rating).to eq ('4')
    end

    it 'returns the recipe for Blueberry Muffin' do 
        repo = RecipeRepository.new
        recipe = repo.find(2)
        expect(recipe.name).to eq ('Blueberry Muffin')
        expect(recipe.cooking_time).to eq ('20')
        expect(recipe.rating).to eq ('5')
    end
end




# recipe.name => 'Lasagne'
# recipe.cooking_time => 45
# recipe.rating => 4

# recipes.length => 2
# recipes.first.name => 'Lasagne'
# recipes.first.cooking_time => 45
# recipes.first.rating => 4

