require 'spec_helper'

describe Admin::ContentController do

  describe 'merge as admin' do
    before do
      Factory(:blog)
      #TODO delete this after remove fixture
      Profile.delete_all
      @user = Factory(:user, :text_filter => Factory(:markdown), :profile => Factory(:profile_admin, :label => Profile::ADMIN))
      @user.editor = 'simple'
      @user.save
      @article = Factory(:article)
      request.session = { :user => @user.id }
    end

    describe 'calling the merge method' do
      before :each do
        @article1 = mock('Article')
	@fake_article = mock('Article')
        @fake_article.stub(:id).and_return('3')
	Article.stub(:find).and_return(@article1)
      end
      it 'should call the merge method' do
        @article1.should_receive(:merge_with).with('2').and_return(@fake_article)
        post :merge, :id => @article1, :merge_with => '2'
      end
      it 'should redirect to edit path with the new article id' do
        @article1.stub(:merge_with).and_return(@fake_article)
        post :merge, :id => @article1, :merge_with => '2'
        response.should redirect_to('/admin/content/edit/3')
      end
    end

#    describe 'once two articles merged' do
#      def base_article(options={})
#        { :title => "posted via tests!",
#          :body => "A good body",
#          :allow_comments => '1',
#          :allow_pings => '1' }.merge(options)
#      end
#        before :each do
#          @article1= Factory(:article, :title => 'Title 1', :body => 'This is the body of article 1')
#          @article2= Factory(:article, :title => 'Title 2', :body => 'This is the body of article 2')
#        end
#        it 'should select the Merge Results template for rendering' do
#          pending "TODO: Select the merge result template"
#        end
#        it 'should make the new article available to that template' do
#          pending "TODO: make new article available"
#        end





    end
  end
end
