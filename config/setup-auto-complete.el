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
         ("C-p" . ac-previous))
  :config
  (progn 
    (use-package auto-complete-config)

    (ac-set-trigger-key "TAB")
    (ac-config-default)

    (setq ac-delay 0.02)
    (setq ac-use-menu-map t)
    (setq ac-menu-height 50)
    (setq ac-use-quick-help nil) 
    (setq ac-comphist-file  "~/.emacs.d/ac-comphist.dat")
    (setq ac-ignore-case nil)
    (setq ac-dwim  t)
    (setq ac-fuzzy-enable t)

    (use-package ac-dabbrev
      :config
      (progn
        (add-to-list 'ac-sources 'ac-source-dabbrev)))

    (setq ac-modes '(js3-mode
                     emacs-lisp-mode
                     lisp-mode
                     lisp-interaction-mode
                     slime-repl-mode
                     c-mode
                     cc-mode
                     c++-mode
                     go-mode
                     java-mode
                     eclim-mode
                     malabar-mode
                     clojure-mode
                     clojurescript-mode
                     scala-mode
                     scheme-mode
                     ocaml-mode
                     tuareg-mode
                     coq-mode
                     haskell-mode
                     agda-mode
                     agda2-mode
                     perl-mode
                     cperl-mode
                     python-mode
                     ruby-mode
                     enh-ruby-mode
                     lua-mode
                     ecmascript-mode
                     javascript-mode
                     js-mode
                     js2-mode
                     php-mode
                     css-mode
                     makefile-mode
                     sh-mode
                     fortran-mode
                     f90-mode
                     ada-mode
                     xml-mode
                     sgml-mode
                     ts-mode
                     sclang-mode
                     verilog-mode))))
