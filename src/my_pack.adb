package body my_pack is

   --------------------------------------------------------------------------------
   -- Set node counts to 0 and links to null
   procedure initialize(steps : in out step_array) is
   begin
      for i in steps'Range loop
         steps(i).count := 0;
         steps(i).next := null;
      end loop;
   end initialize;

   --------------------------------------------------------------------------------
   -- Read input file and send each line to process_relation
   procedure get_steps(steps : in out step_array; input_location : String) is
      input_file : File_Type;
      line_counter : Integer := 0;
   begin

      initialize(steps);

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
      when End_Error =>
         if Is_Open(input_file) then
            Close(input_file);
         end if;
         for i in counters'Range loop
            Put(counters(i)'image&" ");
         end loop;
   end get_steps;

   --------------------------------------------------------------------------------
   -- Process each relation and build nodes to be sorted
   procedure process_relation(input_line : in Unbounded_String) is
      arg1, arg2 : Integer;
      step_p : step;
   begin
      arg1 := Integer'value(Slice(input_line, 1, index(input_line, "<")-1));
      arg2 := Integer'value(Slice(input_line, index(input_line, "<")+1, To_String(input_line)'Length));

      counters(arg2) := counters(arg2)+1;
      step_p.succ := arg2;
      step_p.next := steps(arg1).top;
      steps(arg1).top := step_p;
   end process_relation;







end my_pack;
