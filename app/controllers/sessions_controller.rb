enable :sessions

get '/login' do
  erb :'sessions/login'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:id] = user.id

    redirect "/users"
  else
    erb :'sessions/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
