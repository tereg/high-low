get '/sessions/new' do
  if request.xhr? 
    erb :'sessions/partials/_login_form', { layout: false } 
  else
    erb :'sessions/new'
  end 
end

post '/sessions' do
  @user = User.find_by_email(params[:email])

  if @user && @user.password == params[:password]
    login(@user)
    redirect "/daily_activities"
  else
    @errors = ["Username && Password not found."]
    erb :'sessions/new'
  end
end

get '/sessions/delete' do
  logout 
  redirect '/'
end
