(use-package evil
  :init
  (progn
    (evil-set-toggle-key "C-`")
    (global-set-key (kbd "C-z") nil)

    (evil-mode 1)
    (setq evil-default-cursor t)

    ;; colorize the modeline according to current modal editing state
    (lexical-let ((default-color (cons (face-background 'mode-line)
                                       (face-foreground 'mode-line))))
      (add-hook 'post-command-hook
                (lambda ()
                  (let ((color (cond ((minibufferp) default-color)
                                     ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                                     ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                                     ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                                     (t default-color))))
                    (set-face-background 'mode-line (car color))
                    (set-face-foreground 'mode-line (cdr color))))))

    (use-package evil-leader
      :init
      (progn
        (setq evil-leader/leader ",")
        (setq evil-leader/in-all-states t)

        (global-evil-leader-mode 1)

        (evil-leader/set-key
          "e" 'find-file
          "w" 'save-buffer
          "W" 'save-some-buffers
          "k" 'kill-buffer
          "K" 'kill-buffer-and-window
          "d" 'dired-jump
          "SPC" #'delete-trailing-whitespace
          "m" 'compile)))))
