require 'rails_helper'

RSpec.describe Todo, type: :model do
  it 'should have a title' do
    todo = Todo.new(title: 'workout')
    expect(todo.title).to eq('workout')
  end
  it 'should have a description' do
    todo = Todo.new(description: 'Go to the gym on Monday at 6:15pm.')
    expect(todo.description).to eq('Go to the gym on Monday at 6:15pm.')
  end
  it 'belongs to a category' do
    cat = Category.create(name: 'personal')
    todo = Todo.new(category: cat)
    expect(todo.category).to eq(cat)
  end
end
