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

    (use-package powerline
      :init
      (progn
        (set-face-attribute 'powerline-active1 nil :box nil :foreground "#a9a9a9")
        (set-face-attribute 'powerline-active2 nil :box nil :foreground "#a9a9a9")

        ;; my theme...
        (defun powerline-krgn-theme ()
          "Setup the default mode-line."
          (interactive)
          (setq mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw " ")
                                     (powerline-buffer-id nil 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))
                                     (powerline-raw " ")
                                     (funcall separator-left mode-line face1)
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-major-mode face1 'l)
                                     (powerline-process face1)
                                     (powerline-minor-modes face1 'l)
                                     (powerline-narrow face1 'l)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (powerline-vc face2 'r)))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
                                     (funcall separator-right face2 face1)
                                     (powerline-raw "%4l" face1 'l)
                                     (powerline-raw ":" face1 'l)
                                     (powerline-raw "%3c" face1 'r)
                                     (funcall separator-right face1 mode-line)
                                     (powerline-raw " ")
                                     (let ((state (cond ((minibufferp) "minibuffer")
                                                        ((evil-insert-state-p) "insert")
                                                        ((evil-normal-state-p) "normal")
                                                        ((evil-visual-state-p) "visual")
                                                        ((evil-emacs-state-p)  "emacs")
                                                        ((buffer-modified-p)   "mod")))))
                                       (powerline-raw state))
                                     (powerline-raw " ")))
                     (concat (powerline-render lhs)
                             (powerline-fill face2 (powerline-width rhs))
                             (powerline-render rhs)))))))

        ;; colorize the modeline according to current modal editing state
        (lexical-let ((default-color (cons (face-background 'mode-line)
                                           (face-foreground 'mode-line))))
          (add-hook 'post-command-hook
                    (lambda ()
                      (let ((color (cond ((minibufferp) default-color)
                                         ((evil-insert-state-p) '("#b22222" . "#000000"))
                                         ((evil-normal-state-p) '("#006400" . "#000000"))
                                         ((evil-visual-state-p) '("#ffa500" . "#000000"))
                                         ((evil-emacs-state-p)  '("#b03060" . "#000000"))
                                         ((buffer-modified-p)   '("#006fa0" . "#000000"))
                                         (t default-color))))
                        (if (fboundp 'powerline-default-theme)
                            (progn 
                              (powerline-reset)
                              (set-face-attribute 'mode-line nil :box nil :weight 'bold :background (car color) :foreground (cdr color))
                              (powerline-default-theme))
                          (progn
                            (set-face-background 'mode-line (car color))
                            (set-face-foreground 'mode-line (cdr color))))))))))

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


