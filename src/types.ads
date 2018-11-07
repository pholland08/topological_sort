package types is

   type wait_task;
   type wait_task_link is access wait_task;

   type wait_task is record
      succ : Integer := 0;
      next : wait_task_link := null;
   end record;

   type step is record
      count : Integer := 0;
      wait_list : wait_task_link := null;
   end record;

   type step_array is array(Positive range <>) of step;







end types;
