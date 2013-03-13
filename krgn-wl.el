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
(setq wl-smtp-posting-server "localhost")

(setq wl-local-domain "myhost.example.com")
(setq wl-message-id-domain "myhost.example.com")

(setq wl-from "Me <me@example.com>")

;; note: all below are dirs (Maildirs) under elmo-maildir-folder-path 
;; the '.'-prefix is for marking them as maildirs
(setq wl-fcc-force-as-read t)               ;; mark sent messages as read 

(setq wl-default-folder ".null2/INBOX")
(setq wl-fcc ".null2/INBOX/Sent")                       ;; sent msgs go to the "sent"-folder
(setq wl-draft-folder ".null2/INBOX/Drafts")          ;; store drafts in 'postponed'
(setq wl-trash-folder ".null2/INBOX/Trash")           ;; put trash in 'trash'
(setq wl-queue-folder ".null2/queue")             ;; we don't use this

  ;; check this folder periodically, and update modeline
;;(setq wl-biff-check-folder-list '(".todo"))


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
