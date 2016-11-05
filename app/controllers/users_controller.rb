
# USERS INDEX
# get '/users' do
#   @users = User.all
#   erb :'users/index'
# end

# # USERS NEW
get '/users/new' do

  @user = User.new
  erb :'users/new'
end

# USERS CREATE
post '/users' do
  @user = User.new(params[:user])
  @user.save
  @errors = @user.errors.full_messages

  if params[:password_confirmation] == params[:user][:password] && params[:user][:password].length > 6
    if @user.save
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    end
  else
    erb :'users/new'
  end
end

# # USERS SHOW
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

# # USERS EDIT
# get '/users/:id/edit' do
#   @user = User.find(params[:id])
#   erb :'users/edit'
# end


# # USERS UPDATE
# put '/users/:id' do
#   @user = User.find(params[:id])
#   @user.update(params[:user])
#   redirect "/users/#{@user.id}"
# end

# # USERS DESTROY
# delete '/users/:id' do
#   @user = User.find(params[:id])
#   @user.destroy
#   redirect "/users"
# end