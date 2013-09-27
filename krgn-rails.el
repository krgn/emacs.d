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

(setq end-ruby-deep-indent-paren nil)
(setq end-ruby-deep-arglist t)
(setq enh-ruby-hanging-brace-deep-indent-level 2)
(setq enh-ruby-hanging-brace-indent-level 2)
(setq enh-ruby-hanging-indent-level 2)
(setq enh-ruby-hanging-paren-deep-indent-level 2)
(setq enh-ruby-hanging-paren-indent-level 2)
(setq enh-ruby-indent-level 2)

(global-set-key (kbd "C-c h a") 'helm-rails-all)
(global-set-key (kbd "C-c h c") 'helm-rails-controllers)
(global-set-key (kbd "C-c h g c") 'helm-rails-grep-controllers)
(global-set-key (kbd "C-c h m") 'helm-rails-models)
(global-set-key (kbd "C-c h g m") 'helm-rails-grep-models)
(global-set-key (kbd "C-c h v") 'helm-rails-views)
(global-set-key (kbd "C-c h g v") 'helm-rails-grep-views)
 
;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (set (make-local-variable imenu-generic-expression)
;;                  '(("Methods"  "^\\( *\\(def\\) +.+\\)"          1)
;;                    ))))

;; (add-hook 'ruby-mode-hook 'hs-minor-mode)

(provide 'krgn-rails)

