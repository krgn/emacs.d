;; for coloring and such in compilation buffers
(require 'ansi-color)
(require 'compile)

(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

;; and add the hook
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; scroll output
(setq compilation-scroll-output t)

;; colors for rspec output
(add-to-list 'compilation-mode-font-lock-keywords
             '("^\\([[:digit:]]+\\) examples?, \\([[:digit:]]+\\) failures?\\(?:, \\([[:digit:]]+\\) pendings?\\)?$"
               (0 '(face nil message nil help-echo nil mouse-face nil) t)
               (1 compilation-info-face)
               (2 (if (string= "0" (match-string 2))
                      compilation-info-face
                    compilation-error-face))
               (3 compilation-info-face t t)))

(provide 'krgn-compile)
