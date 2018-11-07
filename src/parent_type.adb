


package body parent_type is

   type parent;
   type parent_link is access all parent;
   type parent is tagged record
      next : parent_link;
   end record;

   procedure print is

   begin

   end;

end parent_type;
