;; always font-lock plz
(global-font-lock-mode t)
;; default tab-width
(setq-default tab-width 2)
;; always indent with spaces
(setq-default indent-tabs-mode nil) 
;; addicted to bling
(blink-cursor-mode t)
;; show matching parenthesis
(show-paren-mode t)
;; next to line number, show # column (character)
(column-number-mode t)
;; when ever a change to a file occurs, reflect it in the buffer
(global-auto-revert-mode t)
;; always highlight current line
(global-hl-line-mode t)
;; disable this for autopair to work as expected with brackets + quotes
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


(require 'xclip)
(require 'wgrep)
(require 'tramp)

;; "80 columns" is too little :)
(setq fill-column 120)

;; grep mode!
(setq grep-command "grep -nirH -e ")

;; don't break lines in an awkward way
(set-default 'truncate-lines t)

(setq browse-url-browser-function (quote browse-url-firefox))

;; autopair should always be on
(autopair-global-mode t)

(defun highlight-todo () (lambda ()
                        (font-lock-add-keywords nil
                                                '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))

(add-hook 'fundamental-mode-hook (highlight-todo))

(provide 'krgn-general)
