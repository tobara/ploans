class ArticlesController < ApplicationController
  add_breadcrumb "Home", :root_path, :title => "Back to Doctor Loans IO Home Page"

  def show
    @article = Article.find(params[:id])
    add_breadcrumb "Mortgage Insights: #{@article.title}"
    set_meta_tags title: "Doctor Loans IO - Mortgage Insights: #{@article.title}"

  end
end
