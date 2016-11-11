get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by_email(params[:email])

  if @user && @user.password == params[:password]
    login(@user)
    redirect "/users/#{@user.id}"
  else
    @errors = ["Username && Password not found."]
    erb :'sessions/new'
  end
end

get '/sessions/delete' do
  logout 
  redirect '/'
end
