require 'rails_helper'

describe 'Todos', type: :request do
  context 'creating, getting, showing, and deleting todos' do

    before do
      post '/api/v1/todos', params: {todo: {title: "workout", description: "must go to the gym"}}
      post '/api/v1/todos', params: {todo: {title: "learn code", description: "I must learn so much coding!"}}
      post '/api/v1/todos', params: {todo: {title: 'sleep', description: "I really am not getting enough"}}
    end

    it 'should get list the todos with a get request' do
      # todos = Todo.create([{title: "workout", description: "must go to the gym"}, {title: "learn code", description: "I must learn so much coding!"}, {title: 'sleep', description: "I really am not getting enough"}])
      get '/api/v1/todos'
      json = JSON.parse(response.body)
      expect(json.length).to eq(3)
    end

    it 'should get a specific todo with a get request' do
      todo_id = Todo.last.id
      get "/api/v1/todos/#{todo_id}"
      json = JSON.parse(response.body)
      expect(json["title"]).to eq("sleep")
    end

    it 'should create a new todo with a post request' do
      todo = Todo.last
      expect(todo.title).to eq("sleep")
    end

    it 'should delete a specific todo with a delete request' do
      todo_id = Todo.last.id
      delete "/api/v1/todos/#{todo_id}"
      new_todo_id = Todo.last.id
      expect(new_todo_id).to eq(todo_id - 1)
    end

  end



end


# todos = Todo.create([{title: "workout", description: "must go to the gym"}, {title: "learn code", description: "I must learn so much coding!"}, {title: 'sleep', description: "I really am not getting enough"}])
