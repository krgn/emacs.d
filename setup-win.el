(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; Rebalance windows after splitting right
(defadvice split-window-right
  (after rebalance-windows activate)
  (balance-windows))
(ad-activate 'split-window-right)

;; Rebalance windows after splitting horizontally
(defadvice split-window-horizontally
  (after rebalance-windows activate)
  (balance-windows))
(ad-activate 'split-window-horizontally)

(defadvice delete-window
  (after rebalance-windows activate)
  (balance-windows))
(ad-activate 'delete-window)

;; toggle horizontal/vertical arrangement of windows
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(provide 'setup-win)
