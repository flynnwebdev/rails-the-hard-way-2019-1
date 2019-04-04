class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def new
        @article = Article.new
    end
    def index
        @articles = Article.all
        # render plain: @articles.inspect
    end
    def create
        # Get the permitted parameters and
        # create a new instance of Article (in memory) with them.
        # Store the instance in @article
        @article = Article.new(article_params)
        # Commit the new article to the database
        if @article.save # validation happens here
            redirect_to @article
        else
            render 'new'  # render the new article form
        end
        # Redirect the client browser to the page to
        # view the newly created article
    end
    def show
        # Get the id from the URL and use it
        # to look up the Article with that id.
        # If found, store a new instance of that Article
        # in @article
        # render plain: @article.inspect
    end
    def edit
    end
    def update
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
        # render plain: params.inspect
    end
    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private

    def article_params
        params.require(:article).permit(:title, :content)
    end
    def set_article
        @article = Article.find(params[:id])
    end
end
