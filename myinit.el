;; key binding des mouvement
;;      r
;;  t      n
;;      s
					;p
;; on libère les touche b     f  

;; enlever les tabs
;;(global-set-key "\C-cu" 'untabify)

;; enlever les espaces à droite
;;(global-set-key "\C-ct" 'delete-trailing-whitespace)

;; left
(global-unset-key "\C-t") ;; transpose-chars enlevé
(global-set-key "\C-t" 'backward-char )

;; one word left
(global-unset-key "\M-t") ;; transpore words
(global-set-key "\M-t" 'backward-word)

;; down
(global-unset-key "\C-s") ;;i-sarch forward
(global-set-key "\C-s" 'next-line)

;; up
(global-unset-key "\C-r") ;;i-search backward-char
(global-set-key "\C-r" 'previous-line)

;; right
(global-unset-key "\C-n") ;; next-line
(global-set-key "\C-n" 'forward-char)

;; search
(global-unset-key "\C-v") ;; scroll-up-command
(global-set-key "\C-v" 'isearch-forward)

;; pg-up 
(global-set-key "\M-s" 'scroll-up-command)
;; pg-down
(global-set-key "\M-r" 'scroll-down)

;; one word right
(global-set-key "\M-n" 'forward-word)

;; on va utiliser C-b comme C-x o
(global-unset-key "\C-b")
;; changer fenetre
(global-set-key "\C-b" 'other-window)


;; on va utiliser p pour spliter verticalement
(global-set-key "\C-p" 'split-window-horizontally)

;; split horizontal C-i inutilisable
(global-set-key "\C-o" 'split-window-vertically)



;; transpose des lignes
(global-set-key "\C-xt" 'transpose-lines)

;; copy line1
(global-set-key "\M-g" "\C-a\C- \C-s\M-w")
;;(global-unset-key "\C-k")
;;(global-set-key "\C-k" 'kill-whole-line)
;;(global-set-key (kbd "C-é") 'kill-whole-line)
;(global-set-key (kbd "C-é") 'projcetile-find-file)
;;(global-set-key "\C-k" 'kill-whole-line)

(global-set-key "\C-cs" 'whitespace-mode)

;; max window
;;(global-set-key "\C-q" 'delete-other-windows)

;; fermer window
;;(global-set-key "\C-f" "\C-x0")


;comment-region et uncomment-region
(global-set-key [?\C-z] 'comment-line)
(global-set-key [?\M-z] 'comment-or-uncomment-region)

;; ;search
(global-set-key [?\C-v] 'isearch-forward)
(global-set-key [?\M-v] 'isearch-backward)

;yank et yank alt
(global-set-key [?\C-l] 'yank)

;;(global-set-key [?\M-l] 'yank-pop)
(global-set-key (kbd "M-l") 'helm-show-kill-ring)
;; Déplacement avec grain 1: ctrsnm
(global-set-key [?\C-t] 'backward-char)
(global-set-key [?\C-s] 'next-line)
(global-set-key [?\C-r] 'previous-line)
(global-set-key [?\C-n] 'forward-char)

;; Déplacement avec grain 2: ctrsnmr
(global-set-key [?\M-c] 'beginning-of-buffer)
(global-set-key [?\M-t] 'backward-word)
(global-set-key [?\M-s] 'scroll-up)
(global-set-key [?\M-r] 'scroll-down)
(global-set-key [?\M-n] 'forward-word)
(global-set-key [?\M-m] 'end-of-buffer)


;; Suppression avec grain 1: ,qghfç
;;(global-set-key [?\C-'] 'backward-kill-line)
(global-set-key [?\C-q] 'backward-delete-char-untabify)
(global-set-key [?\C-g] 'kill-whole-line)
(global-set-key [?\C-h] 'kill-region)
(global-set-key [?\C-f] 'delete-char)
(global-set-key (kbd "C-ç") 'kill-line)

;; Suppression avec grain 2: ctrsnm
;(global-set-key [?\M-'] ') ;TODO: kill to beginning of buffer
(global-set-key [?\M-q] 'backward-kill-word)
;;(global-set-key [?\M-g] ') ;TODO: Copy whole line
(global-set-key [?\M-h] 'kill-ring-save)
(global-set-key [?\M-f] 'kill-word)
;;(global-set-key [?\M-ç] ') ;TODO: kill to end of buffer

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(pending-delete-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; HELM
(require 'help-fns+)

(require 'helm)

(require 'helm-config)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)

(define-key helm-map (kbd "C-s") 'helm-next-line)
(define-key helm-map (kbd "C-r") 'helm-previous-line)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal

(helm-mode 1)

(define-key helm-find-files-map (kbd "C-s") 'helm-next-line)
(define-key helm-find-files-map (kbd "C-r") 'helm-previous-line)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(define-key helm-projectile-find-file-map (kbd "C-s") 'helm-next-line)
(define-key helm-projectile-find-file-map (kbd "C-r") 'helm-previous-line)
(global-set-key (kbd "C-é") 'helm-projectile-find-file)


(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(use-package helm-swoop
  :ensure t
  :config
  (require 'helm-swoop)

;; Change the keybinds to whatever you like :)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;; From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
;; When doing evil-search, hand the word over to helm-swoop
;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
(define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

;; Move up and down like isearch
(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
(define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows nil)

;; Split direcion. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)

;; If nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color nil)

;; ;; Go to the opposite side of line from the end or beginning of line
(setq helm-swoop-move-to-line-cycle t)

;; Optional face for line numbers
;; Face name is `helm-swoop-line-number-face`
(setq helm-swoop-use-line-number-face t)

;; If you prefer fuzzy matching
(setq helm-swoop-use-fuzzy-match t)
  )

(require 'yasnippet)
(yas-reload-all)
(add-hook 'c-mode-hook #'yas-minor-mode)
(add-hook 'c++-mode-hook #'yas-minor-mode)
(add-hook 'python-mode-hook #'yas-minor-mode)

;; empeche a la ligne après un snippet
(setq-default mode-require-final-newline nil)

(setq yas/indent-line nil)

(setq ispell-dictionary "english")

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation
(add-hook 'web-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation

(add-hook 'emmet-mode-hook
          (lambda ()
            ;; clearing old C-j and C-return key mapping.
            (define-key emmet-mode-keymap (kbd "C-j")        nil)
            (define-key emmet-mode-keymap (kbd "<C-return>") nil)
            ;; define new M-j key mapping instead.
            (define-key emmet-mode-keymap (kbd "M-j")        'emmet-expand-line)
            (define-key emmet-mode-keymap (kbd "M-n")        'emmet-next-edit-point)
            (define-key emmet-mode-keymap (kbd "M-t")        'emmet-prev-edit-point)
	    )
	  )

(setq emmet-move-cursor-between-quotes t) ;; default nil

(require 'mmm-auto)

(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)

;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))


;; (setq-default indent-tabs-mode nil)

;; (defun my-web-mode-hook ()
;;   "Hooks for Web mode."
;;   (setq web-mode-markup-indent-offset 4)
;;   (setq web-mode-css-indent-offset 4)
;;   (setq web-mode-code-indent-offset 4)
;;   (setq web-mode-indent-style 4)
;;   (setq web-mode-enable-current-element-highlight t)
;;   (setq web-mode-enable-current-column-highlight t)
;;   )
;; (add-hook 'web-mode-hook  'my-web-mode-hook)

;; met le ~ dans .saves
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; company

(add-hook 'after-init-hook 'global-company-mode)
(global-set-key "\t" 'company-complete-common)
;;ymap (kbd "M-s") 'company-select-next)
;;(define-key make-sparse-keymap (kbd "M-r") 'company-select-previous)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-s") #'company-select-next)
(define-key company-active-map (kbd "C-r") #'company-select-previous))

;; line spacing = line height
(setq-default line-spacing 3)


(load-theme 'nord t)

;; Source Code Pro
;; Inconsolata
;; Hack
(set-default-font "Source Code Pro")
(set-face-attribute 'default nil :height 180)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

(add-hook 'python-mode-hook 'jedi:setup)

(use-package ox-reveal
:ensure ox-reveal)

(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

(use-package htmlize
:ensure t)

(add-hook 'LaTeX-mode-hook 'latex-preview-pane-mode)

(require 'powerline)
(powerline-default-theme)

;; use space to indent by default
(setq-default indent-tabs-mode nil)


;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

(setq
 c-default-style "bsd"
 c-basic-offset 4
 )
