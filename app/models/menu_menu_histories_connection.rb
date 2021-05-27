class MenuMenuHistoriesConnection < ApplicationRecord
  belongs_to :menu, optional: true
  belongs_to :menu_history, optional: true
end
