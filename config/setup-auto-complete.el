;; TAB,  C-i 	ac-expand 	Completion by TAB         
;; RET,  C-m 	ac-complete 	Completion by RET 
;; down, M-n 	ac-next 	Select next candidate 
;; up,   M-p 	ac-previous 	Select previous candidate  
;; C-?,  f1 	ac-help 	Show buffer help       
;; C-s

(use-package auto-complete
  :commands auto-complete-mode
  :init
  (progn
    (auto-complete-mode t))

  :bind (("C-n" . ac-next)
         ("C-p" . ac-previous)
         ("M-1" . auto-complete))

  :config
  (progn 
    (use-package auto-complete-config)
    (use-package ac-dabbrev)
    (ac-set-trigger-key "M-p")
    (ac-config-default)
    (setq ac-use-menu-map t)
    (setq ac-menu-height 50)
    (setq ac-use-quick-help nil) 
    (setq ac-comphist-file  "~/.emacs.d/ac-comphist.dat")
    (setq ac-ignore-case nil)
    (setq ac-dwim  t)
    (add-to-list 'ac-modes 'java-mode)
    (add-to-list 'ac-modes 'js3-mode)
    (add-to-list 'ac-sources 'ac-source-dabbrev)))
