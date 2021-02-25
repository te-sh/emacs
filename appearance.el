;;==============================
;; appearance
;;==============================

;; Initial Frame Settings
(when (eq system-type 'darwin)
  (create-fontset-from-ascii-font
   "Menlo-14:weight=normal:slant=normal"
   nil
   "menlokakugo")

  (set-fontset-font
   "fontset-menlokakugo"
   'unicode
   (font-spec :family "Hiragino Kaku Gothic ProN")
   nil
   'append)

  (setq default-frame-alist
        (append (list
                 '(font . "fontset-menlokakugo")
                 '(width . 120)
                 '(height . 50))
                default-frame-alist))

  (setq face-font-rescale-alist '(("Hiragino.*" . 1.2))))

(when (eq system-type 'gnu/linux)
  (setq default-frame-alist
        (append (list
                 '(font . "HackGen35-11")
                 '(width . 120)
                 '(height . 50))
                default-frame-alist)))
