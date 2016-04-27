get '/tags' do
  redirect_unless_logged_in
  @tags = Tag.all
  erb :'tags/index'
end

post '/tags' do
  redirect_unless_logged_in
  @tag = Tag.new(params[:tag])

  if @tag.save
    redirect '/tags'
  else
    erb :'tags/new'
  end
end

get '/tags/:id' do
  redirect_unless_logged_in
  @tag = Tag.find(params[:id])
  erb :'tags/show'
end

get '/tags/:id/edit' do
  @tag = Tag.find(params[:id])
  redirect_unless_current_user_owns(@tag)

  erb :'tags/edit'
end

put '/tags/:id' do
  @tag = Tag.find(params[:id])
  redirect_unless_current_user_owns(@tag)

  @tag.assign_attributes(params[:tag])
  if @tag.save
    redirect '/tags'
  else
    erb :'tags/edit'
  end
end


delete '/tags/:id' do
  @tag = Tag.find(params[:id])
  redirect_unless_current_user_owns(@tag)

  @tag.destroy
  redirect '/tags'
end
