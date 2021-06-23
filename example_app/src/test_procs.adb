with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Test_Procs is

   procedure Test1 (Params : Cmd_ada.Cb_Parameters.Vector) is
   begin
      Put_Line ("I got called with: ");
      for P of Params loop
         Put (To_String (P));
         Put (" ");
      end loop;
   end Test1;

end Test_Procs;
