class ArticlesController < ApplicationController
    # Tell Rails to call set_article method before
    # starting execution of show, edit, update or destroy actions.
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def new
        # The new view depends on @article existing,
        # so create a new, empty article.
        @article = Article.new
    end
    def index
        # Retrieve all the articles from the database.
        # Will return an array of Article model instances.
        @articles = Article.all
    end
    def create
        # Get the permitted parameters and
        # create a new instance of Article (in memory) with them.
        # Store the instance in @article
        @article = Article.new(article_params)
        # Commit the new article to the database
        # (will validate first)
        # If it works, redirect to the detail page for the article,
        # otherwise re-render the form.
        if @article.save # validation happens here
            redirect_to @article
        else
            render 'new'  # render the new article form
        end
        # Redirect the client browser to the page to
        # view the newly created article
    end
    def show
    end
    def edit
    end
    def update
        # Update the article with the params from the
        # edit form, then validate and save to the database.
        # If it works, redirect to the page showing article details,
        # otherwise re-render the form
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    def destroy
        # Delete the article from the database, then 
        # redirect to the list of articles
        @article.destroy
        redirect_to articles_path
    end

    private

    def article_params
        # Rails rejects all incoming parameters by default,
        # so we need to tell it which ones to accept.
        # Here we say that an array called 'article' must be present,
        # and that the only permitted params within that array
        # are title and content.
        params.require(:article).permit(:title, :content)
    end
    def set_article
        # Get the id from the URL and use it
        # to look up the Article with that id.
        # If found, store a new instance of that Article
        # in @article
        @article = Article.find(params[:id])
    end
end
