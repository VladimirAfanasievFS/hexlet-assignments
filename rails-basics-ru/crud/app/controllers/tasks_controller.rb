# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(article_params)

    if @task.save
      # Flash сообщение
      # Сообщение рендерится в базовом шаблоне app/views/layouts/application.html.erb
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:success] = 'New article was successfully created'
      # Выполняется новый полноценный запрос

      redirect_to task_path(@task)
    else
      flash[:failure] = 'Article cannot be created'
      # Отрисовывается форма создания, все параметры остаются
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      # Flash сообщение
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:success] = 'task was successfully deleted'
      # Выполняется новый полноценный запрос

      redirect_to root_path
    else
      flash[:failure] = 'task cannot be deleted'
      # Отрисовывается форма создания, все параметры остаются
      redirect_to task_path(@task)
    end
  end


  private

  def article_params
    # Требуем наличия ключа :article в params. Разрешаем использовать только некоторые ключи
    params.required(:task).permit(:name, :description, :status, :creator, :performer, :completed)
  end
end
