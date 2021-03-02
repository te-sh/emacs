(load "~/.emacs.d/appearance")
(load "~/.emacs.d/packages")
(load "~/.emacs.d/other")

;; add snippets for procon
(when (file-directory-p "~/.emacs.d/procon")
  (load "~/.emacs.d/procon/init"))
