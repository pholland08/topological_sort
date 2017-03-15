with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;
with Ada.Strings; use Ada.Strings;
with types; use types;

package my_pack is

   na,kn : Integer := 9;
   counters : array(1..na) of Integer := (others => 0);
   steps : step_array(1..na);

   package SU renames Ada.Strings.Unbounded;
   procedure initialize(steps : in out step_array);
   procedure get_steps(steps : in out step_array; input_location : String);
   procedure process_relation(input_line : in Unbounded_String);


end my_pack;
