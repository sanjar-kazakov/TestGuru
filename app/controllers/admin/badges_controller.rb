class Admin::BadgesController < Admin::BaseController

  before_action :authenticate_user!
  before_action :find_badge, only: [:edit, :update, :destroy]

  def index
    @badges = Badge.kept
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = current_user.author_badges.new(badge_params)

    if params[:badge][:image_file].present?
      # Handle file upload
      uploaded_file = params[:badge][:image_file]
      file_name = uploaded_file.original_filename
      file_path = Rails.root.join('public', 'uploads', 'badges', file_name)

      # Save file to disk
      File.open(file_path, 'wb') do |file|
        file.write(uploaded_file.read)
      end

      # Save file path to the database
      @badge.path = "/uploads/badges/#{file_name}"
    end

    if @badge.save
      redirect_to admin_badges_path, notice: 'Badge was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: 'Badge was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @badge.soft_delete
    redirect_to admin_badges_path, notice: 'Badge was successfully deleted.'
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :description, :rule_value, :path)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

end