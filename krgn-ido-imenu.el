(require 'thingatpt)
(require 'ido)
(require 'imenu)

(ido-mode t)

(defun mine-goto-symbol-at-point ()
  "Will navigate to the symbol at the current point of the cursor"
  (interactive)
  (ido-goto-symbol (thing-at-point 'symbol)))

(defun ido-goto-symbol (&optional a-symbol)
  "Will update the imenu index and then use ido to select a symbol to navigate to"
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
        (symbol-names '()))
    (flet ((addsymbols (symbol-list)
                       (when (listp symbol-list)
                         (dolist (symbol symbol-list)
                           (let ((name nil) (position nil))
                             (cond
                              ((and (listp symbol) (imenu--subalist-p symbol))
                               (addsymbols symbol))

                              ((listp symbol)
                               (setq name (car symbol))
                               (setq position (cdr symbol)))

                              ((stringp symbol)
                               (setq name symbol)
                               (setq position (get-text-property 1 'org-imenu-marker symbol))))

                             (unless (or (null position) (null name))
                               (add-to-list 'symbol-names name)
                               (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    (let* ((selected-symbol
            (if (null a-symbol)
                (ido-completing-read "Symbol? " symbol-names)
              a-symbol))
           (position (cdr (assoc selected-symbol name-and-pos))))
      (cond
       ((overlayp position)
        (goto-char (overlay-start position)))
       (t
        (goto-char position))))))

(global-set-key "\C-ci" 'ido-goto-symbol)
(global-set-key "\C-cp" 'mine-goto-symbol-at-point)

(provide 'krgn-ido-imenu)
