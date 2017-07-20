require 'rails_helper'

RSpec.describe Todo, type: :model do

  before :each do
    @cat = Category.create(name: 'personal')
    @todo = Todo.create(
    title: 'workout',
    description: 'Go to the gym on Monday at 6:15pm.',
    category: @cat
    )
  end

  it 'should have a title' do
    expect(@todo.title).to eq('workout')
  end
  it 'should have a description' do
    expect(@todo.description).to eq('Go to the gym on Monday at 6:15pm.')
  end
  it 'belongs to a category' do
    expect(@todo.category).to eq(@cat)
  end
end
