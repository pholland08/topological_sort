

package topological_inheritance is


   type car_type is (gmc,chevy,ford,buick,jeep,dodge);
   type food_type is (apple,banana,orange,pear);
   type names is (bennet,burris,cooper,joe);
   type person_class is (warrior,sorcerer,wizard);


   type parent;
   type parent_link is access all parent;
   type parent is tagged
      record
         next : parent_link;
      end record;

   type integer_type is new parent with
      record
         integer_value: Integer;
      end record;

   type car is new parent with
      record
         make : car_type;
         doors : Integer;
      end record;

   type food is new parent with
      record
         nomnom : food_type;
         calories : Float;
      end record;

   type person is new parent with
      record
         name : names;
         class : person_class;
      end record;

   type name_type is new parent with
      record
         chars : names;
      end record;


--   function print(self : parent) return String;
--   overriding function print(self : integer_type) return String;
--   overriding function print(self : car) return String;
--   overriding function print(self : food) return String;
--   overriding function print(self : person) return String;
--   overriding function print(self : name_type) return String;

--   function takes_precedence (self : parent) return boolean;
--   overriding function takes_precedence (self : car) return boolean;
--   overriding function takes_precedence (self : food) return boolean;
--   overriding function takes_precedence (self : person) return boolean;


end topological_inheritance;
