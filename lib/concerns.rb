module Concerns
 module Findable

   def find_by_name(name)
      s = self.all.select{|a| a.name == name}
      s[0]
   end


   def find_or_create_by_name(name)
      self.create(name) unless self.find_by_name(name)
   end
   
end
end