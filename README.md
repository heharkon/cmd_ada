# Cmd_ada

Cmd_ada is a simple command shell UI package for Ada applications, inspired by the Python `cmd` module. It is kind of the simplest interactive form of UI one can imagine. Currently, this package is much, much more simpler in it's functionalities, compared to the Python counterpart.

## Usage

You can find sample application under the example_app folder.

At it's simplest, just register your command with a function that takes a parameter vector and start the `Main_Loop`. 

```
Ada_Cmd.Register_Command
     (Command_String => "test1", Command_Cb => Test_Procs.Test1'Access,
      Description    => "Just a test");

Ada_Cmd.Main_Loop;
```

where `Test1` procedure is defined as `procedure Test1 (Params : Ada_Cmd.Cb_Parameters.Vector);`


will look as a session of something like this

```
> ?

Commands:

?                            Help
quit                         Exit

test1                        Just a test


> test1 one two three
Just a test
I got called with: 
one two three 
> 
```


The help and exiting command strings can be customized, also the prompt and the help preamble text.
