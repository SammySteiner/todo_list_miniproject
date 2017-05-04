require 'rails_helper'

RSpec.describe Category, type: :model do

  it 'should have a name' do
    cat = Category.new(name: 'work')
    expect(cat.name).to eq('work')
  end
  it 'should have many todos' do
    cat = Category.create(name: 'work')
    todo_one = Todo.create(category: cat)
    todo_two = Todo.create(category: cat)
    expect(cat.todos.count).to eq(2)
  end
end
