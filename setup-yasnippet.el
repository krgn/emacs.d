(use-package yasnippet
  :init
  (progn
    (use-package popup)
    (yas--initialize)
    (yas-global-mode 1)
    (setq yas/snippet-revival t)
    
    (defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
      (when (featurep 'popup)
        (popup-menu*
         (mapcar
          (lambda (choice)
            (popup-make-item
             (or (and display-fn (funcall display-fn choice))
                 choice)
             :value choice))
          choices)
         :prompt prompt
         ;; start isearch mode immediately
         :isearch t)))
    (setq yas/prompt-functions '(yas-popup-isearch-prompt yas/ido-prompt yas/completing-prompt))))
