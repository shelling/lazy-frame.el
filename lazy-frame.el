;;; lazy-frame.el --- Lazy Frame Manipulation

;; Copyright (C) 2014 shelling
;; Author: shelling <navyblueshellingford@gmail.com>
;; Keyword: frame
;; Created: 24 Aug 2014
;; Version: 0.1.0
;; Package-Version: 0.1.0
;; Package-Requires: ((emacs "24.1"))

;;; Code:

(defcustom lazy-frame-json "~/.emacs.d/lazy-frame.json"
  "The JSON file saved defualt frame setting")

(defun lazy-frame-read ()
  "read the frame settings from the file indicated in lazy-frame-json"
  (let ((json-object-type 'alist)
        (json-array-type 'list))
    (with-temp-buffer
      (insert-file-contents lazy-frame-json)
      (json-read))))

(defun lazy-frame-default ()
  "reset frame parameters as the same as frame.json"
  (interactive)
  (modify-frame-parameters nil (frame-setting-read)))

(defun lazy-frame-traditional ()
  "set height and width of frame to 80x24"
  (interactive)
  (modify-frame-parameters nil '((width . 80) (height . 24))))

(provide 'lazy-frame)

;;; lazy-frame.el ends here
