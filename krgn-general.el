(require 'uniquify)
(require 'redo+)
(require 'xclip)
(require 'wgrep)
(require 'tramp)
(require 'saveplace)
(require 'ace-jump-mode)
(require 'evil)

(evil-mode 1)
(setq evil-default-cursor t)

;; always font-lock plz
(global-font-lock-mode t)
;; default tab-width
(setq-default tab-width 2)
;; always indent with spaces
(setq-default indent-tabs-mode nil) 
(setq tab-stop-list (list 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80 82 84 86 88 90 92 94 96 98 100 102 104 106 108 110 112 114 116 118 120 122 124 126 128 130 132 134 136 138))

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
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat dotfiles-dir "bak")))))

;; save last position in file
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

;; "80 columns" is too little :)
(setq fill-column 120)

;; grep mode!
(setq grep-command "grep -nirH -e ")

;; don't break lines in an awkward way
(set-default 'truncate-lines t)
(setq inhibit-startup-screen nil)       ;don't show the startup message

(setq browse-url-browser-function (quote browse-url-firefox))

(defun highlight-todo ()
  (lambda ()
    (font-lock-add-keywords nil
                            '(("\\<\\(FIXME\\|NOTE\\|TODO\\|IDEA\\|BUG\\):"
                               1 
                               font-lock-warning-face t)))))

(add-hook 'fundamental-mode-hook (highlight-todo))

(add-hook 'server-switch-hook
          (lambda ()
            (when (current-local-map)
              (use-local-map (copy-keymap (current-local-map))))
            (when server-buffer-clients
              (local-set-key (kbd "C-x C-c") 'server-edit))
            (when server-buffer-clients
              (local-set-key (kbd "C-x k") 'server-edit))))

;; set default directory
(setq default-directory "~/")
(setq default-major-mode 'org-mode)     ;default is org-mode
(setq initial-major-mode 'org-mode)     ;scratch buffer as well
(setq initial-scratch-message "# *scratch* buffer for creating quick outlines\n")

;; keep a list of projects and navigation
(projectile-global-mode)
;; recentf for cache
(recentf-mode 1)

;; subword mode provides more fine grained movements through, e.g. camel-cased text
(global-subword-mode t)

;; show disambiguated paths to files in reverse order 
(setq uniquify-buffer-name-style 'reverse)

(provide 'krgn-general)
