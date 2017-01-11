get '/users/new' do
  @user = User.new

  if request.xhr? 
     erb :'users/partials/_registration_form', { layout: false } 
  else 
    erb :'users/new'
  end 
end

post '/users' do
  @user = User.new(params[:user])
  @user.save
  @errors = @user.errors.full_messages

  if params[:password_confirmation] == params[:user][:password] && params[:user][:password].length > 6
    if @user.save 
      login(@user)
      redirect "/daily_activities/recent"
    end
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
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