module FriendlyParams
  extend ActiveSupport::Concern

  included do
    before_action :lookup_slugs, only: [:create, :update]
  end

  def lookup_slugs
    # Calculate param method name from class
    base_name = self.class.to_s.underscore.gsub("_controller","")
    attr_name = "#{base_name[0..-2]}_params"
    obj_params = self.send(attr_name.to_sym)
    ap obj_params
    # Translate slugs to id for associations
    # Works with params that end in _id or _ids
    obj_params.each do |k,v|
      n_key = k
      items = v
      collection = if k[-3..-1].eql?("ids")
        n_key = k.gsub "_ids", ""
        true
      elsif k[-3..-1].eql?("_id")
        n_key = k.gsub "_id", ""
        items = [v]
        false
      else
        nil
      end
      # Skip if no ids
      next if collection.nil?
      claz = n_key.camelcase.constantize
      new_items = items.inject([]) do |mem, item|
        if is_number? item
          mem << item
          mem
        else
          a = claz.friendly.find(item)
          mem << a.id unless a.nil?
          mem
        end
      end
      obj_params[k] = collection ? new_items : new_items.first
    end
    ap obj_params
    @friendly_params = obj_params
  end

  def is_number? string
    true if Float(string) rescue false
  end
end
