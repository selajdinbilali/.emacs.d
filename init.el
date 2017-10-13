(require 'package)
(setq package-enable-at-startup nil)
;; Add the Melpa repository to the list of package sources
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; Initialise the package system.
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-list (quote (("okular" ("okular %o") ""))))
 '(package-selected-packages
   (quote
    (powerline latex-preview-pane auctex company-jedi helm-swoop yasnippet which-key web-mode vue-mode use-package try smartparens org-bullets nord-theme neotree multiple-cursors help-fns+ helm-projectile flycheck expand-region emmet-mode company-php))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
