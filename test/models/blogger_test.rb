require "test_helper"

class BloggerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'does not save when name is missing' do
    user = Blogger.new( level: 5)
    assert_not user.save
  end

  test 'does not save when level is missing' do
    user = Blogger.new( name: 'John')
    assert_not user.save
  end

  test 'has error when name is missing' do
    user = Blogger.create( level: 5)
    assert user.errors.any?
  end

  test 'has error when level is missing' do
    user = Blogger.create( name: "Emily")
    assert user.errors.any?
  end

  test 'should save when name and level is present' do
    user = Blogger.new( name: "Amy",level:2)
    assert user.save
  end
end
