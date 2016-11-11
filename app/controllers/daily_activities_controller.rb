get '/daily_activities' do 
  @user = current_user
  @daily_activities = @user.daily_activities
  erb :'daily_activities/index'
end

get '/daily_activities/new' do 
  @user = current_user
  erb :'daily_activities/new' 
end 

post '/daily_activities' do 
  @user = current_user
  @daily_activity = DailyActivity.new({user_id: current_user.id, highs: params[:highs], lows: params[:lows]})

  if @daily_activity.save
    redirect "/daily_activities"
  else 
    erb :'daily_activities/new' 
  end 
end 

get '/daily_activities/:id/edit' do 
  @user = current_user
  @daily_activities = @user.daily_activities
  @daily_activity = DailyActivity.find(params[:id])

  erb :'daily_activities/edit'
end

put '/daily_activities/:id' do 
  @user = current_user
  @daily_activity = DailyActivity.find(params[:id])

  @daily_activity.highs = params[:highs]
  @daily_activity.lows = params[:lows]

  if @daily_activity.save
    redirect '/daily_activities' 
  else
    erb :'daily_activities/edit' 
  end
end