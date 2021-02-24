require "test_helper"

class BlogControllerTest < ActionDispatch::IntegrationTest
  #PATCH /blog/:id  || bloggers#update
  #PUT   /blog/:id  || bloggers#update
  test "Success when request gog/home" do
    new_blogger = Blogger.new(name:"TesterMan", level: 10)
    new_blogger.save

    patch blogger_path(new_blogger), params: { blogger: { name: "Legolas", level: 30 } }
    assert_response :redirect
  end

  #GET /blog/home  || blog#home
  test "Success when request goes to GET /blog/home" do
    get blog_home_path
    assert_response :success
  end

  #GET /blog/about  || blog#about
  test "Success on GET /blog/about" do
    get blog_about_path
    assert_response :success
  end

  #GET /bloggers/:id/edit  || bloggers#about
  test "should respond with home" do
    new_blogger = Blogger.new(name:"TesterMan", level: 10)
    new_blogger.save

    get edit_path(new_blogger)
    assert_response :success
  end

  #GET /bloggers/everything  || bloggers#everything
  test "should respond with succes when request goes to GET /bloggers/everything" do
    get bloggers_everything_path
    assert_response :success
  end

  #POST /bloggers/everything  || bloggers#create || Success
  test "should respond with redirect when any request goes to POST /bloggers/everything" do
    post bloggers_everything_path, params: { blogger: { name: "Legolas", level: 30 } }
    assert_response :success
  end

  #POST /bloggers/everything  || bloggers#create || Fail
  test "should respond with redirect when " do
    post bloggers_everything_path, params: { blogger: { level: 30 } }
    assert_response :success
  end

  #DELETE /bloggers/everything  || bloggers#delete
  test "should respond with redirect wto POST /bloggers/everything" do
    new_blogger = Blogger.new(name:"TesterMan", level: 10)
    new_blogger.save
    
    delete bloggers_everything_path(new_blogger)
    assert_response :redirect
  end
end
