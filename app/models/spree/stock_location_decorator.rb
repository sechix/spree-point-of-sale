module Spree
  StockLocation.class_eval do

    scope :stores, -> { where(store: true) }
    scope :not_store, -> { where.not(store: true) }

    def can_supply?(quantity, variant)
      quantity <= stock_items.find_by(variant_id: variant.id).count_on_hand
    end

    def active_store?
      active? && store?
    end
  end
end
