(require 'inf-ruby)
(require 'ruby-mode)
(require 'ruby-end)
;;(require 'ruby-tools)
(require 'ruby-interpolation)

;; haml-mode
(require 'haml-mode)
(setq haml-backspace-backdents-nesting nil)
(setq haml-indent-offset 2)

(setq ruby-deep-indent-paren nil)
(setq ruby-insert-encoding-magic-comment nil)

(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))

(setq enh-ruby-program "~/.rbenv/shims/ruby") ; so that still works if ruby points to ruby1.8
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-hook 'enh-ruby-mode-hook (highlight-todo))
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))


;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (set (make-local-variable imenu-generic-expression)
;;                  '(("Methods"  "^\\( *\\(def\\) +.+\\)"          1)
;;                    ))))

;; (add-hook 'ruby-mode-hook 'hs-minor-mode)

(provide 'krgn-rails)


