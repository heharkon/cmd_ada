pragma Ada_2012;
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.OS_Lib; use GNAT.OS_Lib;

package body Cmd_ada is

   ----------------------
   -- Register_Command --
   ----------------------

   procedure Register_Command
     (Command_String : String; Command_Cb : Proc_Callback;
      Description    : String)
   is
   begin

      Commands.Append
        ((To_Unbounded_String (Command_String), Command_Cb,
          To_Unbounded_String (Description)));

   end Register_Command;

   ----------------------
   -- Set_Exit_Command --
   ----------------------

   procedure Set_Exit_Command (Exit_Cmd : String) is
   begin
      Exit_Command := To_Unbounded_String (Exit_Cmd);
   end Set_Exit_Command;

   ----------------------
   -- Set_Help_Command --
   ----------------------

   procedure Set_Help_Command (Help_Cmd : String) is
   begin
      Help_Command := To_Unbounded_String (Help_Cmd);
   end Set_Help_Command;

   ----------------
   -- Set_Prompt --
   ----------------

   procedure Set_Prompt (Prompt_Str : String) is
   begin
      Prompt := To_Unbounded_String (Prompt_Str);
   end Set_Prompt;

   -----------------------
   -- Set_Help_Preamble --
   -----------------------

   procedure Set_Help_Preamble (Preamble_Str : String) is
   begin
      Help_Preamble := To_Unbounded_String (Preamble_Str);
   end Set_Help_Preamble;

   ---------------
   -- Main_Loop --
   ---------------

   procedure Main_Loop is
      Input_Params : Cb_Parameters.Vector;
   begin
      Master_Loop :
      loop
         New_Line;
         Put (To_String (Prompt));
         declare
            Input   : constant String := Get_Line;
            Args    : Argument_List_Access;
            Command : Unbounded_String;
         begin
            Args := Argument_String_To_List (Input);

            if Args'Length > 0 then

               --  take the command
               Command := To_Unbounded_String (Args (Args'First).all);

               --  take parameters
               for X in Args'First + 1 .. Args'Last loop
                  Input_Params.Append (To_Unbounded_String (Args (X).all));
               end loop;

               Free (Args);

               --  find command
               if Command = Exit_Command then
                  exit Master_Loop;
               elsif Command = Help_Command then
                  Print_Help;
               end if;

               Cmd_Loop :
               for Item of Commands loop
                  if Item.Command_String = Command then
                     Put_Line (To_String (Item.Description));
                     Item.Command_Cb (Input_Params);
                     exit Cmd_Loop;
                  end if;

               end loop Cmd_Loop;

            else
               Free (Args);
            end if;

         end;
      end loop Master_Loop;

   end Main_Loop;

   ----------------
   -- Print_Help --
   ----------------

   procedure Print_Help is
   begin
      New_Line;

      Put_Line (To_String (Help_Preamble));
      New_Line;

      Put (To_String (Help_Command));
      Set_Col (30);
      Put ("Help");
      New_Line;

      Put (To_String (Exit_Command));
      Set_Col (30);
      Put ("Exit");
      New_Line;
      New_Line;

      for Item of Commands loop
         Put (To_String (Item.Command_String));
         Set_Col (30);
         Put (To_String (Item.Description));
         New_Line;
      end loop;

      New_Line;
   end Print_Help;

end Cmd_ada;
