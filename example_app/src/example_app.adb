with Ada_Cmd;
with Test_Procs;

procedure Example_App is
begin
   Ada_Cmd.Register_Command
     (Command_String => "test1", Command_Cb => Test_Procs.Test1'Access,
      Description    => "Just a test");

   Ada_Cmd.Register_Command
     (Command_String => "test2", Command_Cb => Test_Procs.Test1'Access,
      Description    => "Second test");

   Ada_Cmd.Set_Exit_Command ("exit");
   Ada_Cmd.Set_Help_Command ("help");
   Ada_Cmd.Set_Prompt (">> ");
   Ada_Cmd.Set_Help_Preamble ("Those commands are...");

   Ada_Cmd.Main_Loop;

end Example_App;
