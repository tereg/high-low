get '/users/:user_id/daily_activities' do 
  @user = User.find(params[:user_id])
  @daily_activities = @user.daily_activities
  erb :'daily_activities/index'
end

get '/users/:user_id/daily_activities/new' do 
  @user = User.find(params[:user_id])
  erb :'daily_activities/new' 
end 

post '/users/:user_id/daily_activities' do 
  @user = User.find(params[:user_id])
  @daily_activity = DailyActivity.new({user_id: current_user.id, highs: params[:highs], lows: params[:lows]})

  if @daily_activity.save
    redirect "/users/#{@user.id}"
  else 
    erb :'daily_activities/new' 
  end 
end 

get '/users/:user_id/daily_activities/:id' do 
  @user = User.find(params[:user_id])
  @daily_activities = @user.daily_activities

  erb :'users/show'
end