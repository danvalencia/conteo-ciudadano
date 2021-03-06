class CasillaPresenter < SimpleDelegator

  def self.human_attribute_name(attribute_key_name, options = {})
    Box.human_attribute_name attribute_key_name, options
  end

  def initialize(casilla = Box.new, current_user = nil)
    @current_user = current_user
    super(casilla)
  end

  def complete_address
    "#{self.location}; #{self.address} #{self.references}"
  end

  def kind_and_number
    "#{self.kind} #{self.number}"
  end

  def editable?
    @current_user && self.has_results?
  end

  def results_partial
    editable? ? 'results_form' : 'results'
  end

  def map_reported?
    !get_map_tickets.blank?
  end
end