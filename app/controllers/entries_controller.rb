get '/entries' do
  redirect_unless_logged_in
  @entries = Entry.all
  erb :'entries/index'
end

get '/entries/new' do
  redirect_unless_logged_in
  erb :'entries/new'
end

post '/entries' do
  redirect_unless_logged_in
  tags = params[:tag][:tags].split(/\W+/).map do |tag_title|
    Tag.new(title: tag_title, user_id: current_user.id)
  end

  @entry = Entry.new(
    title: params[:entry][:title],
    body: params[:entry][:body],
    user_id: current_user.id,
    tags: tags)

  if @entry.save
    redirect '/entries'
  else
    erb :'entries/new'
  end
end

get '/entries/:id' do
  redirect_unless_logged_in
  @entry = Entry.find(params[:id])
  erb :'entries/show'
end

get '/entries/:id/edit' do
  @entry = Entry.find(params[:id])
  redirect_unless_current_user_owns(@entry)

  erb :'entries/edit'
end

put '/entries/:id' do
  @entry = Entry.find(params[:id])
  redirect_unless_current_user_owns(@entry)

  @entry.assign_attributes(params[:entry])

  if @entry.save
    redirect '/entries'
  else
    erb :'entries/edit'
  end
end

delete '/entries/:id' do
  @entry = Entry.find(params[:id])
  redirect_unless_current_user_owns(@entry)

  @entry.destroy
  redirect '/entries'
end
