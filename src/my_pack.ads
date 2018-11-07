with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;
with Ada.Strings; use Ada.Strings;
--with Unchecked_Conversion; use Unchecked_Conversion;
with types; use types;


package my_pack is

   na,kn : Integer := 9;
   steps : step_array(1..na);

   type qlink is array(0..na) of Integer;

   package SU renames Ada.Strings.Unbounded;
   procedure get_steps(steps : in out step_array; input_location : String);
   procedure process_relation(input_line : in Unbounded_String);
   function sort_relations(steps : in out step_array) return qlink;


end my_pack;
