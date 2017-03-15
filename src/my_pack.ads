with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;
with types; use types;

package my_pack is

   package SU renames Ada.Strings.Unbounded;
   procedure initialize(steps : in out step_array);
   procedure get_steps(steps : in out step_array; input_location : String);



end my_pack;
