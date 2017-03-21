with Ada.Text_IO; use Ada.Text_IO;
with types; use types;
with my_pack; use my_pack;

procedure main is

   input_file, output_file : File_Type;

begin

   Put_Line("Data set one:");
   get_steps(steps,"input/d1.input");
   New_Line;
   New_Line;
   New_Line;
   Put_Line("Data set two:");
   get_steps(steps,"input/d2.input");
   New_Line;

   Put_Line("done");

end main;
