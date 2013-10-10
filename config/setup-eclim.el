(use-package eclim
  :init
  (progn
    (use-package eclimd)
    (global-eclim-mode)
    (add-hook 'eclim-mode-hook (lambda ()  (c-set-style "java")))
    (setq eclim-executable "~/bin/eclipse/eclim")
    (setq eclim-auto-save nil)
    (setq eclim-eclipse-dirs '("~/bin/eclipse"))
    (setq eclimd-default-workspace "~/src")

    ;; temporarily switch to emacs mode for this eclim command (with evil mode)
    (defadvice eclim-java-import-organize (around temporary-emacs-mode)
      (let ((evil-emacs-state))
        ad-do-it))
    (ad-activate 'eclim-java-import-organize)

    (use-package ac-emacs-eclim-source
      :init
      (ac-emacs-eclim-config))))
