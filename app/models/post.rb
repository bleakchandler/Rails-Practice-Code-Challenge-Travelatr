class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination
    default_scope {order('title ASC')}
end
