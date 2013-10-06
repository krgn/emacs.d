(require 'auto-complete)
(require 'auto-complete-config)
(require 'ac-dabbrev)

(auto-complete-mode t)
(ac-config-default)

; TAB,  C-i 	ac-expand 	Completion by TAB         
;; RET,  C-m 	ac-complete 	Completion by RET 
;; down, M-n 	ac-next 	Select next candidate 
;; up,   M-p 	ac-previous 	Select previous candidate  
;; C-?,  f1 	ac-help 	Show buffer help       
;; C-s

(setq ac-use-menu-map t )
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(setq ac-menu-height 20)
(setq ac-use-quick-help nil) 
(define-key ac-mode-map (kbd "M-1") 'auto-complete)
(setq ac-comphist-file  "~/.emacs.d/ac-comphist.dat")

(add-to-list 'ac-modes 'java-mode)
(add-to-list 'ac-modes 'js3-mode)

(setq ac-ignore-case nil)
(setq ac-dwim  t)

(add-to-list 'ac-sources 'ac-source-dabbrev)

(provide 'setup-auto-complete)
