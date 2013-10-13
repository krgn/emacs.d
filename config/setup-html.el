(use-package zencoding-mode
  :init
  (progn
    ;; should define a binding for zencoding-expand-line
    (defadvice sgml-delete-tag (after indent-buffer-after-delete-tag)
      (indent-region (point-min)  (point-max)))
    (defadvice sgml-tag (after indent-buffer-after-add-tag)
      (indent-region (point-min)  (point-max)))
    (ad-activate 'sgml-tag)))
