(use-package mu4e
  :init
  (progn
    (global-set-key [XF86Mail] 'mu4e)
    ;; for attachments
    (use-package gnus-dired)
     ;; use the standard bindings as a base

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

    (defvar my-mu4e-account-alist
      '(("null2"
         (mu4e-sent-folder "/null2/INBOX/Sent")
         (mu4e-drafts-folder "/null2/INBOX/Drafts")
         (mu4e-trash-folder "/null2/INBOX/Trash")
         (user-mail-address "karsten@null2.net")
         (message-signature (concat "\n"
                                    "Karsten Gebbert\n"
                                    "Null2 GmbH, Berlin\n"
                                    "http://null2.net\n"
                                    "mob:  0049.176.6199.5110\n")))
        ("karsten.gebbert"
         (mu4e-sent-folder "/karsten.gebbert/[Google Mail]/Sent Mail")
         (mu4e-drafts-folder "/karsten.gebbert/[Google Mail]/Drafts")
         (mu4e-trash-folder  "/karsten.gebbert/[Google Mail]/Trash")
         (user-full-name  "Karsten Gebbert")
         (user-mail-address "karsten.gebbert@gmail.com")
         (message-signature (concat "\n"
                                    "Karsten Gebbert\n"
                                    "http://krgn.me\n"
                                    "mob:  0049.176.6199.5110\n")))))

    (defun choose-msmtp-account ()
      (if (message-mail-p)
          (save-excursion
            (let*
                ((from (save-restriction
                         (message-narrow-to-headers)
                         (message-fetch-field "from")))
                 (account
                  (cond
                   ((string-match "karsten.gebbert@gmail.com" from) "karsten.gebbert")
                   ((string-match "karsten@null2.net" from) "null2"))))
              (setq message-sendmail-extra-arguments (list '"-a" account))))))

    ;; attach a file as an attachment to a new email message by entering C-c RET C-a
    (defun gnus-dired-mail-buffers ()
      "Return a list of active message buffers."
      (let (buffers)
        (save-current-buffer
          (dolist (buffer (buffer-list t))
            (set-buffer buffer)
            (when (and (derived-mode-p 'message-mode)
                       (null message-sent-message-via))
              (push (buffer-name buffer) buffers))))
        (nreverse buffers)))

     (evil-make-overriding-map mu4e-view-mode-map 'normal t)
     (evil-make-overriding-map mu4e-main-mode-map 'normal t)
     (evil-make-overriding-map mu4e-headers-mode-map 'normal t)

     (evil-add-hjkl-bindings mu4e-view-mode-map 'normal
       "J" 'mu4e~headers-jump-to-maildir
       "j" 'evil-next-line
       "C" 'mu4e-compose-new
       "o" 'mu4e-view-message
       "Q" 'mu4e-raw-view-quit-buffer)

     ;; (evil-add-hjkl-bindings mu4e-view-raw-mode-map 'normal
     ;; "J" 'mu4e-jump-to-maildir
     ;; "j" 'evil-next-line
     ;; "C" 'mu4e-compose-new
     ;; "q" 'mu4e-raw-view-quit-buffer)

     (evil-add-hjkl-bindings mu4e-headers-mode-map 'normal
       "j" 'mu4e-headers-next
       "k" 'mu4e-headers-prev
       "J" 'mu4e~headers-jump-to-maildir
       "l" 'mu4e-headers-mark-for-retag'
       "C" 'mu4e-compose-new
       "o" 'mu4e-view-message
       "a" 'mu4e-headers-action)

     (evil-add-hjkl-bindings mu4e-main-mode-map 'normal
       "J" 'mu4e~headers-jump-to-maildir
       "j" 'evil-next-line
       "RET" 'mu4e-view-message)

     ;; defaults to karsten.gebbert
     (setq mu4e-sent-folder "/karsten.gebbert/[Google Mail]/Sent Mail"
           mu4e-drafts-folder "/karsten.gebbert/[Google Mail]/Drafts"
           mu4e-trash-folder  "/karsten.gebbert/[Google Mail]/Trash"
           user-mail-address "karsten.gebbert@gmail.com"
           message-signature (concat "\n"
                                     "Karsten Gebbert\n"
                                     "http://krgn.me\n"
                                     "mob:  0049.176.6199.5110\n"))
     (setq gnus-dired-mail-mode 'mu4e-user-agent)
     (setq message-sendmail-envelope-from 'header)
     (setq mu4e-maildir "/home/k/mail")
     (setq mail-user-agent 'mu4e-user-agent)
     (setq mu4e-show-images t)
     (setq mu4e-view-show-images t)
     (setq mu4e-view-image-max-width 800)
     (setq mu4e-attachment-dir "~/dwn")
     (setq mu4e-get-mail-command "offlineimap")
     (setq message-send-mail-function 'message-send-mail-with-sendmail)
     (setq mu4e-headers-date-format "%d/%b/%Y %H:%M")
     (setq mu4e-html2text-command "html2text -width 72")
     (setq sendmail-program "/usr/bin/msmtp")
     (setq mu4e-decryption-policy t)
     (setq mu4e-headers-skip-duplicates t)
     (setq message-kill-buffer-on-exit t)
     (setq mu4e-use-fancy-chars t)
     (setq user-full-name "Karsten Gebbert")
     (setq mu4e-sent-messages-behavior 'delete)
     (setq mu4e-update-interval 30)

     (setq mu4e-maildir-shortcuts
           '(("/karsten.gebbert/INBOX"               . ?i)
             ("/null2/INBOX"               . ?k)
             ("/karsten.gebbert/[Google Mail]/Sent Mail"   . ?s)
             ("/karsten.gebbert/[Google Mail]/Trash"       . ?t)
             ("/karsten.gebbert/[Google Mail]/All Mail"    . ?a)))

     (add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)
     (add-hook 'message-send-mail-hook 'choose-msmtp-account)
     (add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)))
