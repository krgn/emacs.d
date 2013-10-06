;; for coloring and such in compilation buffers
(require 'ansi-color)
(require 'compile)

(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

;; jump to first error
(setq compilation-auto-jump-to-first-error t)

;; and add the hook
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
;; scroll output
(setq compilation-scroll-output t)
;; don't hang on warnings, only errors
(setq compilation-skip-threshold 2)
 
;; colors for rspec output
(add-to-list 'compilation-mode-font-lock-keywords
             '("^\\([[:digit:]]+\\) examples?, \\([[:digit:]]+\\) failures?\\(?:, \\([[:digit:]]+\\) pendings?\\)?$"
               (0 '(face nil message nil help-echo nil mouse-face nil) t)
               (1 compilation-info-face)
               (2 (if (string= "0" (match-string 2))
                      compilation-info-face
                    compilation-error-face))
               (3 compilation-info-face t t)))

(defun compile-autoclose (buffer string)
  "Bury a compilation buffer if succeeded without warnings "
  (if (and
       (string-match "compilation" (buffer-name buffer))
       (string-match "finished" string)
       (not
        (with-current-buffer buffer
          (search-forward "warning" nil t))))
      (run-with-timer 1 nil
                      (lambda (buf)
                        (delete-window (get-buffer-window buf)))
                      buffer)))


(setq compilation-finish-functions 'compile-autoclose)

(provide 'setup-compile)
