require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test 'route test' do
  	assert_generates 'articles/1', { :controller => 'articles', :action => 'show', :id => '1' }
  	assert_generates 'about', { :controller => 'pages', :action => 'about'}
  	assert_generates 'contact', { :controller => 'pages', :action => 'contact'}
  end
end