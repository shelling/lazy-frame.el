;;; lazy-frame.el --- Lazy Frame Manipulation

;; Copyright (C) 2014 shelling
;; Author: shelling <navyblueshellingford@gmail.com>
;; Keyword: frame
;; Created: 24 Aug 2014
;; Version: 0.1.0
;; Package-Version: 0.1.0
;; Package-Requires: ((emacs "24.1"))

;;; Code:

(defun frame-setting-read ()
  (let ((json-object-type 'alist)
        (json-array-type 'list))
    (with-temp-buffer
      (insert-file-contents "~/.emacs.d/frame.json")
      (json-read))))

(defun make-frame-default ()
  "reset frame parameters as the same as frame.json"
  (interactive)
  (modify-frame-parameters nil (frame-setting-read)))

(defun make-frame-traditional ()
  "set height and width of frame to 80x24"
  (interactive)
  (modify-frame-parameters nil '((width . 80) (height . 24))))

(provide 'lazy-frame)

;;; lazy-frame.el ends here
