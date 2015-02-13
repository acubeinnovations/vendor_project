class Style
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps::Created
  field :stylename, type: String
  field :stylecode, type: String
  field :users, type: String
  
  
  has_mongoid_attached_file :image,
      :url => "/system/attachments/:id/:style/:basename.:extension", 
           :keep_old_files => true , 
          :keep_old_files => :version_condition_met?,
      :path => ":rails_root/public/system/attachments/:id/:style/:basename.:extension", 
      :styles => {
        :original => ['1920x1680>', :jpg],
        :small    => ['100x100#',   :jpg],
        :medium   => ['250x250',    :jpg],
        :large    => ['500x500>',   :jpg]
      },
      :convert_options => { :all => '-background white -flatten +matte' }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end