class ArticlesController < ApplicationController
    def new
    end
    def create
        # Get the permitted parameters and
        # create a new instance of Article (in memory) with them.
        # Store the instance in @article
        @article = Article.new(article_params)
        # Commit the new article to the database
        @article.save
        # Redirect the client browser to the page to
        # view the newly created article
        redirect_to @article
    end
    def show
        # Get the id from the URL and use it
        # to look up the Article with that id.
        # If found, store a new instance of that Article
        # in @article
        @article = Article.find(params[:id])
        # render plain: @article.inspect
    end

    private

    def article_params
        params.require(:article).permit(:title, :content)
    end
end
