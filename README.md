# Ada_Cmd

Ada_Cmd is a simple command shell UI package for Ada applications, inspired by the Python `cmd` module. It is kind of the simplest interactive form of UI one can imagine. Currently, this package is much, much more simpler in it's functionalities, compared to the Python counterpart.

## Usage

You can find sample application under the example_app folder.

At it's simplest, just register your command with a function that takes a parameter vector and start the `Main_Loop`. 

The help and exiting command strings can be customized, also the prompt and the help preamble text.