package body my_pack is


   --------------------------------------------------------------------------------
   -- Read input file and send each line to process_relation
   procedure get_steps(steps : in out step_array; input_location : String) is
      input_file : File_Type;
      line_counter : Integer := 0;
      sorted_list : qlink;
   begin

      Open (File => input_file,
            Mode => In_File,
            Name => input_location);
      loop
         declare
            input_line : Unbounded_String;
         begin
            process_relation(Get_Line(input_file));
         end;
      end loop;

   exception

         -- When done reading file
      when End_Error =>

         -- Close file
         if Is_Open(input_file) then
            Close(input_file);
         end if;

         -- Print counts
         Put("       ");
         for i in steps'Range loop
            Put(i'Image&" ");
         end loop;
         New_Line;
         Put("Counts ");
         for i in steps'Range loop
            Put(steps(i).count'Image&" ");
         end loop;
         New_Line;
         -- Perform topological sort
         sorted_list := sort_relations(steps);

         if (kn = 0) then
            Put("Sorted ");
            -- Print the sorted list
            declare
               j : integer := 0;
            begin
               while sorted_list(j) /= 0 loop
                  Put(sorted_list(j)'Image&" ");
                  j := sorted_list(j);
               end loop;
            end;
         else
            Put_Line("There is a loop");
         end if;
   end get_steps;

   --------------------------------------------------------------------------------
   -- Process each relation and build nodes to be sorted
   procedure process_relation(input_line : in Unbounded_String) is
      arg1, arg2 : Integer;
      step_p : wait_task_link;
   begin
      arg1 := Integer'value(Slice(input_line, 1, index(input_line, "<")-1));
      arg2 := Integer'value(Slice(input_line, index(input_line, "<")+1, To_String(input_line)'Length));

      steps(arg2).count := steps(arg2).count+1;
      step_p := new wait_task'(succ  => arg2,
                               next  => steps(arg1).wait_list);
      steps(arg1).wait_list := step_p;
   end process_relation;

   --------------------------------------------------------------------------------
   -- Sort the relations and return the qlink
   function sort_relations(steps : in out step_array) return qlink is
      sorted_list : qlink := (others =>0);
      f,r : Integer := 0;

   begin
      for k in 1..na loop
         if steps(k).count = 0 then
            sorted_list(r) := k;
            r := k;
         end if;
      end loop;

      f := sorted_list(0);

      while f /= 0 loop
         declare
            p : wait_task_link;
         begin
            --Put_line("front is: "&f'Image);
            kn := kn-1;
            p := steps(f).wait_list;

            while p /= null loop
               --Put_Line("steps(p.succ).count is: "&steps(p.succ).count'Image);
               steps(p.succ).count := steps(p.succ).count - 1;
               if steps(p.succ).count = 0 then
                  sorted_list(r) := p.succ;
                  r := p.succ;
               end if;
               p := p.next;
            end loop;
            f := sorted_list(f);
         end;
      end loop;



      return sorted_list;
   end sort_relations;



end my_pack;
