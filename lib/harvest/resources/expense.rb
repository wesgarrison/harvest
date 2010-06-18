module Harvest
  module Resources
    class Expense < Harvest::HarvestResource
      
      self.element_name = "expense"
      
      class << self
      
        def person_id=(id)
          @person_id = id
          self.site = self.site + "/people/#{@person_id}"
        end
        
        def person_id
          @person_id
        end
        
        def project_id=(id)
          @project_id = id
        end
        
        def project_id
          @project_id
        end
      end
      
      alias_method :save_without_project_id, :save
                  
      def save
        self.attributes[:project_id] = self.class.project_id
        save_without_project_id
      end
    end
  end
end