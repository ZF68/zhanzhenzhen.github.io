Copyright (c) 2016 Zhenzhen Zhan

Blog files are under `public-text` directory.

If you want to run it on your computer, there're two ways.

# Quick Way

Use this way if you don't want to configure HTTPS while testing.

Add a file `ip.txt` in the project's directory. The file should contain a line with the following text:

```
127.0.0.1
```

Then remove some lines in `lib/server.main.fus` as mentioned in the comment.

# Standard Way

Create 3 files in the project's directory:

- `credential.p12`
- `password.txt`
- `ip.txt`


`credential.p12` should contain a self-signed certificate. `password.txt` should contain a line of a password. `ip.txt` should contain a line of desired IP address.

When browsing for the first time, you should type the password (see details in Site Engine's manual).

# Only for Me

```bash
ln -s ../common-private/lan-ip-credential.p12 credential.p12
ln -s ../common-private/cookie-password.txt password.txt
ln -s ../common-public/lan-ip.txt ip.txt
```

For other developers please don't run these commands unless your directory structure is the same as mine.
