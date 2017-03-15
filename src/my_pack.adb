package body my_pack is

   procedure initialize(steps : in out step_array) is

   begin
      for i in steps'Range loop
         steps(i).succ := 0;
         steps(i).next := null;
      end loop;
   end initialize;

   procedure get_steps(steps : in out step_array; input_location : String) is
      input_file : File_Type;

   begin
      initialize(steps);

      Open (File => input_file,
            Mode => In_File,
            Name => input_location);

      loop
         declare
            in_line : Unbounded_String;
         begin
            in_line := SU.To_Unbounded_String(Get_Line(input_file));
            Put_Line(in_line);
         end;
      end loop;

   exception
      when End_Error =>
         if Is_Open(input_file) then
            Close(input_file);
         end if;
   end get_steps;


end my_pack;
