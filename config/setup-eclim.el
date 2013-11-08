(use-package eclim
  :init
  (progn
    (use-package eclimd)
    (add-hook 'java-mode-hook (lambda () (eclim-mode 1)))

    (add-hook 'eclim-mode-hook 'setup-eclim)
    (defun setup-eclim ()
      (progn
        (setq c-basic-offset 4)))

    (setq eclim-executable "~/bin/eclipse/eclim")
    (setq eclim-auto-save nil)
    (setq eclim-eclipse-dirs '("~/bin/eclipse"))
    (setq eclimd-default-workspace "~/src")

    (global-eclim-mode)

    ;; temporarily switch to emacs mode for this eclim command (with evil mode)
    (defadvice eclim-java-import-organize (around temporary-emacs-mode)
      (let ((evil-emacs-state))
        ad-do-it))
    (ad-activate 'eclim-java-import-organize)

    (use-package ac-emacs-eclim-source
      :init
      (ac-emacs-eclim-config))))
