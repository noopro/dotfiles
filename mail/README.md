# Email

The files in this folder define the configuration of the programs I use to 
fetch, read, and search my emails.

I have two email accounts, one for work and one for personal emails. The 
messages are syncronised between the remote server and my computer with 
[isync][isync], and I read them with [NeoMutt][neomutt]. A search index is 
built by [notmuch][notmuch], and emails are sent with [msmtp][msmtp].

To get started, install the programs:

```shell
$ brew install isync msmtp notmuch
$ brew install neomutt/homebrew-neomutt/neomutt --with-sidebar-patch --with-notmuch-patch --HEAD
```

I'm using the `HEAD` of NeoMutt to fix [a bug][neomutt_bug] present in version 
[20160404][neomutt_20160404].

After [linking the dotfiles][stow_tutorial] with `stow mail` in the 
`~/.dotfiles` directory, there are only a few more things that need to be done.

## Authentication

Each account must authenticate with an IMAP server and an SMTP server. The
passwords, four in my case, can be stored in the [OS X keychain][keychain]. The
IMAP items should be named as in the `PassCmd` directive in the
[`.mbsyncrc`](.mbsyncrc) file. The SMTP items should be named as
`smtp://smtp.theserver.tld`. In both cases the account should be the login
account of the server.

For Gmail accounts with two-factor authentication enabled, use an 
application-specific password.

## Directories

Make the directories for each account:

```shell
$ mkdir -p ~/.mail/{account1,account2}
$ mkdir -p ~/.mutt/tmp
```

Where `account1` and `account2` are the names defined in the `Path` directives 
in the `.mbsyncrc` file.

## Indexing

To search in mutt with `<Esc>X`, the `notmuch` index needs to be built.
Run `notmuch setup`, point it to `~/.mail/cern`, and then run `notmuch new`.

## Synchronising periodically

Emails are sent by the `msmtp` program when they're sent in NeoMutt. Incoming 
messages are fetched from the remote server when `mbsync` runs (the executable 
name for isync).

To run `mbsync` periodically, load the [`launchctl`][launchctl] job with:

```shell
$ launchctl load ~/Library/LaunchAgents/com.alexpearce.isync.plist
```

This will run `mbsync -a` every 3 minutes, synchronising all IMAP folders.

[isync]: http://isync.sourceforge.net
[neomutt]: http://www.neomutt.org/
[neomutt_bug]: https://github.com/neomutt/neomutt/issues/11
[neomutt_20160404]: https://github.com/neomutt/neomutt/releases/tag/neomutt-20160404
[notmuch]: https://notmuchmail.org
[msmtp]: http://msmtp.sourceforge.net
[stow_tutorial]: https://alexpearce.me/2016/02/managing-dotfiles-with-stow/
[keychain]: https://en.wikipedia.org/wiki/Keychain_(software)
[launchctl]: http://launchd.info

# Modifications for running on Linux

We don't need to change much, just the way mbsync gets its passwords.

First generate a GnuPG key, and then [create the encrypted password 
file][gpg-guide].

```
$ gpg2 --full-gen-key
# An extra space in front of this command, so it doesn't get stored in the
# shell's history file
$  echo 'your_password123' | gpg2 --encrypt --recipient 'Alex Pearce' -o /path/to/password-ACCOUNT.gpg
```

Then set the `PassCmd` in the `mbsyncrc` to use `gpg2`:

```
PassCmd "gpg2 -q --for-your-eyes-only --no-tty -d ~/.password-ACCOUNT.gpg"
```

[gpg-guide]: http://f-koehler.github.io/posts/2015-03-17-offlineimap-msmtp-gnupg.html
