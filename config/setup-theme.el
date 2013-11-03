(use-package zenburn-theme
  :init
  (progn
    (load-theme 'wombat t)
    (set-face-attribute 'mode-line nil :box nil :foreground "#a9a9a9")
    (set-face-attribute 'powerline-active1 nil :box nil :foreground "#a9a9a9")
    (set-face-attribute 'powerline-active2 nil :box nil :foreground "#a9a9a9")

    (use-package powerline
      :init
      (progn
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
                                                        ((buffer-modified-p)   "mod"))))
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
                              (powerline-krgn-theme))
                          (progn
                            (set-face-background 'mode-line (car color))
                            (set-face-foreground 'mode-line (cdr color))))))))))
    ;; turn off clutter
    (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
    (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
    (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))))
