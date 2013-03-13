;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

;; from
;; http://emacs-fu.blogspot.de/2009/09/wanderlust-tips-and-tricks.html
;; and
;; http://emacs-fu.blogspot.de/2009/06/e-mail-with-wanderlust.html

(add-to-list 'load-path "~/.emacs.d/site-lisp/wanderlust/wl")
(add-to-list 'load-path "~/.emacs.d/site-lisp/wanderlust/utils")
(add-to-list 'load-path "~/.emacs.d/site-lisp/wanderlust/elmo")

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

(setq elmo-maildir-folder-path "~/mail")

(setq wl-stay-folder-window t)
(setq wl-folder-window-width 25)

(setq wl-user-mail-address-list 
      (quote ("karsten@null2.net" "k.gebbert@gmail.com" "karsten.gebbert@gmail.com")))

(setq wl-dispose-folder-alist
      '(("^%.*null2\\.net" . ".null2.INBOX.Trash")
        ("^%.*gmail\\.com" . ".karsten.gebbert.trash")))

;; select correct email address when we _start_ writing a draft.
(add-hook 'wl-mail-setup-hook 'wl-draft-config-exec)
;; don't apply the templates when sending the draft otherwise 
;; choosing another template with C-c C-j won't have any effect
(remove-hook 'wl-draft-send-hook 'wl-draft-config-exec)

;;is run when wl-draft-send-and-exit or wl-draft-send is invoked:
;;(NOTE: "M-: wl-draft-parent-folder" => %INBOX:myname/clear@imap.gmail.com:993)
(setq wl-draft-config-alist
      '(((string-match "null2" wl-draft-parent-folder)
         (template . "work")
         (wl-smtp-posting-user . "karsten@null2.net")
         (wl-smtp-posting-server . "mail.null2.net")
         (wl-local-domain . "nimble.null2.net")
         (wl-draft-folder . ".null2.INBOX.Drafts")
         ("Fcc" . ".null2.INBOX.Sent"))
        ((string-match "gmail.com" wl-draft-parent-folder)
         (template . "gmail")
         (wl-smtp-posting-user . "k.gebbert")
         (wl-smtp-posting-server . "smtp.gmail.com")
         (wl-smtp-authenticate-type ."plain")
         (wl-smtp-connection-type . 'starttls)
         (wl-smtp-posting-port . 587)
         (wl-local-domain . "gmail.com")
         (wl-message-id-domain . "smtp.gmail.com"))))

;;choose template with C-c C-j
(setq wl-template-alist
      '(("gmail"
         (wl-from . "karsten gebbert <karsten.gebbert@gmail.com>")
         ("From" . wl-from))
        ("work"
         (wl-from . "Karsten Gebbert <k.gebbert@gmail.com>")
         ("From" . wl-from))))

;; ;; Use different signature files based on From: address
;; (setq signature-file-alist
;;       `((("From" . "myname@company.com") . ,(expand-file-name "~/.emacs.d/signature.d/myname@company.com"))
;;         (("From" . "myname@gmail.com") . ,(expand-file-name "~/.emacs.d/signature.d/myname@gmail.com"))))

;;Cycle through templates with arrow keys
;; (define-key wl-template-mode-map (kbd "<right>") 'wl-template-next)
;; (define-key wl-template-mode-map (kbd "<left>") 'wl-template-prev)

;;default folder name auto completion:
(setq wl-default-spec "%")

;; mark sent messages (folder carbon copy) as read.
(setq wl-fcc-force-as-read    t)

;;Only save draft when I tell it to! (C-x C-s or C-c C-s):
;;(arg: seconds of idle time untill auto-save).
(setq wl-auto-save-drafts-interval nil)


;; hide many fields from message buffers
(setq wl-message-ignored-field-list '("^.*:"))

(setq wl-message-visible-field-list
      '("^\\(To\\|Cc\\):"
        "^Subject:"
        "^\\(From\\|Reply-To\\):"
        "^Organization:"
        "^Message-Id:"
        "^\\(Posted\\|Date\\):"))

(setq wl-message-sort-field-list
      '("^From"
        "^Organization:"
        "^X-Attribution:"
        "^Subject"
        "^Date"
        "^To"
        "^Cc"))
;; icons
(setq wl-icon-directory "~/.emacs.d/site-lisp/wanderlust/etc")

;; SMTP
(setq wl-smtp-connection-type 'starttls)
(setq wl-smtp-posting-port 587)
(setq wl-smtp-authenticate-type "plain")
(setq wl-smtp-posting-user "k.gebbert")
(setq wl-smtp-posting-server "smtp.gmail.com")
(setq wl-local-domain "gmail.com")

(setq wl-folder-check-async t) 

(autoload 'wl-user-agent-compose "wl-draft" nil t)

(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))

(provide 'krgn-wl)
