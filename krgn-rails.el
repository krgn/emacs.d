(require 'inf-ruby)
(require 'ruby-mode)
(require 'ruby-end)
(require 'ruby-tools)
(require 'ruby-interpolation)

;; haml-mode
(require 'haml-mode)
(setq haml-backspace-backdents-nesting nil)
(setq haml-indent-offset 2)

;;(setq ruby-deep-indent-paren nil)

(add-to-list 'load-path "~/.emacs.d/site-lisp")
(eval-after-load "ruby-mode" '(require 'ruby-mode-indent-fix))

(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))

(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode)) 
(autoload 'ruby-mode "ruby-mode" "Major mode for editing Ruby code" t)

;; (add-hook 'ruby-mode-hook 'hs-minor-mode)

(provide 'krgn-rails)


