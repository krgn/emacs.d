(use-package zencoding-mode
  :init
  (progn
    ;; should define a binding for zencoding-expand-line
    (defadvice sgml-delete-tag (after indent-buffer-after-delete-tag)
      (indent-region (point-min)  (point-max)))
    (defadvice sgml-tag (after indent-buffer-after-add-tag)
      (indent-region (point-min)  (point-max)))
    (ad-activate 'sgml-tag)

    (defun sgml-delete-tag-content ()
      "delete text between the tags that contain the current point"
      (interactive)
      (let ((b (point)))
        (sgml-skip-tag-backward 1)
        (when (not (eq b (point)))
          ;; moved somewhere, should be at front of a tag now
          (save-excursion 
            (forward-sexp 1)
            (setq b (point)))
          (sgml-skip-tag-forward 1)
          (backward-sexp 1)
          (delete-region b (point)))))))
