(require 'inf-ruby)
(require 'ruby-mode)
(require 'ruby-end)
(require 'ruby-tools)
(require 'ruby-interpolation)

;;; rhtml-mode 
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode))

;; haml-mode
(require 'haml-mode)
(setq 'haml-backspace-backdents-nesting nil)
(setq 'haml-indent-offset 2)

(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))


(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode)) 
(autoload 'ruby-mode "ruby-mode" "Major mode for editing Ruby code" t)

;; (add-hook 'ruby-mode-hook 'hs-minor-mode)

(provide 'krgn-rails)


