(require 'uniquify)
(require 'redo+)
(require 'xclip)
(require 'wgrep)
(require 'tramp)
(require 'saveplace)
(require 'ace-jump-mode)

;; always font-lock plz
(global-font-lock-mode t)
;; default tab-width
(setq-default tab-width 2)
;; always indent with spaces
(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 2 60 2))

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

;; location for all backup files
(setq backup-directory-alist `(("." . ,(expand-file-name (concat dotfiles-dir "bak")))))

;; save last position in file
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; "80 columns" is too little :)
(setq fill-column 120)

;; grep mode!
(setq grep-command "grep -nirH -e ")

;; don't break lines in an awkward way
(set-default 'truncate-lines t)
(setq inhibit-startup-screen t)       ;don't show the startup message
(setq inhibit-splash-screen t)

(setq browse-url-browser-function (quote browse-url-firefox))

(add-hook 'fundamental-mode-hook 'highlight-todo)
(add-hook 'server-switch-hook 'switch-server-hook)

;; set default directory
(setq default-directory "~/")
(setq default-major-mode 'org-mode)     ;default is org-mode
(setq initial-major-mode 'org-mode)     ;scratch buffer as well
(setq initial-scratch-message "# *scratch* buffer for creating quick outlines\n")

;; recentf for cache
(recentf-mode 1)

;; subword mode provides more fine grained movements through, e.g. camel-cased text
(global-subword-mode t)

;; show disambiguated paths to files in reverse order
(setq uniquify-buffer-name-style 'reverse)

(provide 'setup-general)
