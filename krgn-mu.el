(require 'mu4e)

(setq mu4e-maildir "/home/k/mail")

(setq mu4e-drafts-folder "/karsten.gebbert/[Google Mail].Drafts")
(setq mu4e-sent-folder   "/karsten.gebbert/[Google Mail].Sent Mail")
(setq mu4e-trash-folder  "/karsten.gebbert/[Google Mail].Trash");

(setq mu4e-sent-messages-behavior 'delete)

(setq mu4e-maildir-shortcuts
      '( ("/karsten.gebbert/INBOX"               . ?i)
         ("/karsten.gebbert/[Google Mail].Sent Mail"   . ?s)
         ("/karsten.gebbert/[Google Mail].Trash"       . ?t)
         ("/karsten.gebbert/[Google Mail].All Mail"    . ?a)))

(setq mu4e-get-mail-command "offlineimap")

(setq user-mail-address "karsten.gebbert@gmail.com"
      user-full-name  "Foo X. Bar"
      message-signature
      (concat
       "Foo X. Bar\n"
       "http://www.example.com\n"))

 
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

(setq message-kill-buffer-on-exit t)
