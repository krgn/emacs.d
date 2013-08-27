(require 'mu4e)

(setq gmail-signature 
      (concat "---------------------------------------------- -- -  -\n"
              "Karsten Gebbert\n"
              "http://krgn.me\n"
              "mob:  0049.176.6199.5110\n"
              "mail: karsten.gebbert@gmail.com"
              "---------------------------------------------- -- -  -\n"))

(setq null2-signature 
      (concat "---------------------------------------------- -- -  -\n"
              "Karsten Gebbert\n"
              "Null2 GmbH, Berlin\n"
              "http://null2.net\n"
              "mob:  0049.176.6199.5110\n"
              "mail: karsten.gebbert@gmail.com\n"
              "---------------------------------------------- -- -  -\n"))

(setq mu4e-maildir "/home/k/mail")

;; defaults to karsten.gebbert
(setq mu4e-sent-folder "/karsten.gebbert/[Google Mail]/Sent Mail"
      mu4e-drafts-folder "/karsten.gebbert/[Google Mail]/Drafts"
      mu4e-trash-folder  "/karsten.gebbert/[Google Mail]/Trash"
      user-mail-address "karsten.gebbert@gmail.com"
      message-signature gmail-signature
      mu4e-sent-messages-behavior 'delete
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-local-domain "gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-stream-type 'starttls
      smtpmail-smtp-service 25)

(defvar my-mu4e-account-alist
  '(("null2"
     (mu4e-sent-folder "/null2/INBOX/Sent")
     (mu4e-drafts-folder "/null2/INBOX/Drafts")
     (mu4e-trash-folder "/null2/INBOX/Trash")
     (user-mail-address "karsten@null2.net")
     (message-signature null2-signature)
     (smtpmail-default-smtp-server "smtp.null2.net")
     (smtpmail-local-domain "null2.net")
     (smtpmail-smtp-server "smtp.null2.net")
     (smtpmail-stream-type 'starttls)
     (smtpmail-smtp-service 25))
    ("karsten.gebbert"
     (mu4e-sent-folder "/karsten.gebbert/[Google Mail]/Sent Mail")
     (mu4e-drafts-folder "/karsten.gebbert/[Google Mail]/Drafts")
     (mu4e-trash-folder  "/karsten.gebbert/[Google Mail]/Trash")
     (user-full-name  "Karsten Gebbert")
     (mu4e-sent-messages-behavior 'delete)
     (user-mail-address "karsten.gebbert@gmail.com")
     (message-signature gmail-signature)
     (smtpmail-default-smtp-server "smtp.gmail.com")
     (smtpmail-local-domain "gmail.com")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-stream-type 'starttls)
     (smtpmail-smtp-service 25))))

(setq mu4e-maildir-shortcuts
      '(("/karsten.gebbert/INBOX"               . ?i)
        ("/null2/INBOX"               . ?k)
        ("/karsten.gebbert/[Google Mail]/Sent Mail"   . ?s)
        ("/karsten.gebbert/[Google Mail]/Trash"       . ?t)
        ("/karsten.gebbert/[Google Mail]/All Mail"    . ?a)))

(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var)) my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)
(setq mu4e-get-mail-command "offlineimap")
(setq message-kill-buffer-on-exit t)
