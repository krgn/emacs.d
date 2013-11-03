(use-package evil
  :init
  (progn
    (evil-set-toggle-key "C-`")

    (global-set-key (kbd "C-z") nil)
    (global-set-key (kbd "C-x o") nil)
    (global-set-key (kbd "C-x C-s") nil)

    (evil-mode 1)
    (setq evil-default-cursor t)

    (use-package project-explorer)
    (use-package surround
      :init
      (progn
        (global-surround-mode 1)))

    ;; set up the vim-style number inc/dec keys
    (use-package evil-numbers
      :init
      (progn
        (define-key evil-normal-state-map "+" 'evil-numbers/inc-at-pt)
        (define-key evil-normal-state-map "-" 'evil-numbers/dec-at-pt)))

    ;; vim-style leader
    (use-package evil-leader
      :init
      (progn
        (use-package project-explorer)

        (setq evil-leader/leader ",")
        (setq evil-leader/in-all-states t)
        (global-evil-leader-mode 1)
        (evil-leader/set-key
          "a" 'align-regexp
          "e" 'find-file
          "f" 'project-explorer-open
          "t" 'projectile-find-file
          "w" 'save-buffer
          "W" 'save-some-buffers
          "k" 'kill-buffer
          "K" 'kill-buffer-and-window
          "g" 'magit-status
          "d" 'dired-jump
          "SPC" #'delete-trailing-whitespace
          "m" 'compile)))))
