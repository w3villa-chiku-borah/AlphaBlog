
class ArticlesController < ApplicationController
  
  before_action  :set_article, only:[:show, :edit, :update, :destroy]


    def show
     
    
    end
    def index

        # @articles = Article.paginate(page: params[:page], per_page: 2)

        @articles = Article.paginate(page: params[:page], per_page: 6)

    end

    def edit
    end

    def new
        
     @article = Article.new

    end


    def create
        @article = Article.new(article_params)
        @article.user = current_user
     if @article.save
        flash[:notice] = "Article was created successfully"
     #to redirect show page
     redirect_to article_path(@article)
     
          #same efffect
          #redirect_to @article
          
    else

        return render(:new, status: :unprocessable_entity) unless @article.save      
    end
     
    end
    def update
        if @article.update(article_params)
            flash[:notice] = "Article was update successfully"
            redirect_to article_path(@article)
        else

            return render(:edit, status: :unprocessable_entity) unless @article.save      
        
        end
        end

        def destroy
            @article.destroy 
            redirect_to articles_path
        end

private

def set_article
    @article = Article.find(params[:id])
end

def article_params
  params.require(:article).permit(:title, :description)
end

end
