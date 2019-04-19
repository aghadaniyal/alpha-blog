class Tag < ApplicationRecord

	belongs_to :article , optional: true

end