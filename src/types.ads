package types is

   type step;
   type top_link is access step;

   type step is record
      succ : Integer;
      next : top_link;
   end record;


   type step_array is array(Positive range <>) of step;







end types;
