Copyright (c) 2016 Zhenzhen Zhan

Blog files are under `public-text` directory.

If you want to run it on your computer, first you should create a `credential.p12` file in the project's directory. This file should contain a self-signed certificate for testing purposes. If you don't want to create this certificate, you will need to modify `lib/server.main.fus` to disable `https`, enable `http`, and delete the file access to `credential.p12`.
