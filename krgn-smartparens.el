(require 'smartparens)
(require 'smartparens-config)

;; global mode 
(smartparens-global-mode t)

;; highlights matching pairs
(show-smartparens-global-mode t)

(sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)

;;; markdown-mode
(sp-with-modes '(markdown-mode html-mode nxml-mode sgml-mode)
  (sp-local-tag "<"  "<_>" "</_>" :transform 'sp-match-sgml-tags))

;;; lisp modes
(sp-with-modes sp--lisp-modes
  (sp-local-pair "(" nil :bind "C-("))

(sp-pair "(" ")" :bind "C-)")
(sp-pair "{" "}" :bind "C-}")
(sp-pair "[" "]" :bind "C-]")
(sp-pair "\"" "\"" :bind "C-\"")
(sp-pair "'" "'" :bind "C-\'")

(global-set-key (kbd "C-c C-c n") 'sp-select-next-thing)
(global-set-key (kbd "C-c C-c p") 'sp-select-previous-thing)
(global-set-key (kbd "C-c C-c k") 'sp-kill-sexp)
(global-set-key (kbd "C-c C-c f") 'sp-forward-sexp)
(global-set-key (kbd "C-c C-c b") 'sp-backward-sexp)

(provide 'krgn-smartparens)
