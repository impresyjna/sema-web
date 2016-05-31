class DashboardController < FrontController
  def index
    @questions_count = Question.all.count
    @cards_count = Card.all.count
    @categories_count = Category.all.count
    @unconfirmed_questions_count = Question.where(confirmed: false).count
    @users_count = User.where(admin: false).count
    @rooms_count = Room.all.count
  end
end
