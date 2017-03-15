with Ada.Text_IO; use Ada.Text_IO;
with types; use types;
with my_pack; use my_pack;

procedure main is


   input_file, output_file : File_Type;

begin

   get_steps(steps,"input/d1.input");

   Put_Line("done");

end main;
