class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true, presence: true
    validates :age, numericality: true, presence: true, numericality: {greater_than: 0}
    validates :bio, presence: true, length: {minimum: 30}
    default_scope {order('name ASC')}


    def total_likes
        total_likes = 0
        self.posts.each do |post|
        total_likes += post.likes
    end
    total_likes
end

    def most_liked_post
        posts_array = self.posts.map do |post|
            post.likes
        end
    most_liked = posts_array.max
    post = Post.find_by(likes:most_liked)
    post.title
    end   

    def most_liked_post_id
        posts_array = self.posts.map do |post|
            post.likes
        end     
        most_liked = posts_array.max
        post = Post.find_by(likes:most_liked)
    post.id
end

end

