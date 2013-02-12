(global-font-lock-mode t)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil) 
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(global-auto-revert-mode t)
(global-hl-line-mode t)
(delete-selection-mode -1)

;; utf8 all the way
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; less less less
(defalias 'yes-or-no-p 'y-or-n-p)

;; location for all backup files
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat dotfiles-dir "bak")))))

;; save last position in file
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; ask before closing
(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))


(provide 'krgn-general)
