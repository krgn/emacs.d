(require 'powerline)

(custom-set-faces
 '(powerline-active1 ((t (:foreground "#fff" :background "RoyalBlue" :box nil))))
 '(powerline-active2 ((t (:foreground "#444" :background "CornFlowerBlue" :box nil)))))

 ;; give your mode-line curves
(setq powerline-arrow-shape 'arrow)
(powerline-default-theme)


(provide 'krgn-powerline)
