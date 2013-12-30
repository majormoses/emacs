;; http://a-nickels-worth.blogspot.com/2007/11/effective-emacs.html
;; tips for an effective .emacs (haven't integrated most of this)

;; for your local additions
(add-to-list 'load-path "~/.emacs.d")

;; for my additions
(add-to-list 'load-path "~/.emacs-ben")

;; use tabs, and display them as four spaces
(setq indent-tabs-mode t)
;;(setq-default indent-tabs-mode t)
(setq default-tab-width 4)
;;(setq tab-width 4)
(global-set-key (kbd "TAB") 'self-insert-command)

;; add/style line numbers
(require 'linum)
(global-linum-mode 1)
(setq linum-format "%3d ")

;; better wrapping (no more /s)
(set-display-table-slot standard-display-table 'wrap ?\ )
;; see also http://www.emacswiki.org/emacs/LineWrap

;; stop the creation of those STUPID ~ backup files (let me handle backups, thank-you-very-much)
(setq backup-inhibited t)
;; stop the creation of those equally irritating ## files (which are autosave files, but it leaves them around if I quit without saving!  clean up after yourself, you SLOB of an editor!)
(setq auto-save-default nil)

;; auto-completion
(add-to-list 'load-path "~/.emacs-ben/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs-ben/auto-complete/dict")
(ac-config-default)

;; show whitespace
;;(setq-default show-trailing-whitespace t)
(require 'whitespace)
(global-whitespace-mode 1)
(setq whitespace-style '(face trailing tabs tab-mark space-before-tab))
(setq whitespace-trailing-regexp "\\(\\([^[:space:]]\\([ \t]\\)+\\)$\\|^[ ]+\\)") ;; yes, spaces at the beginning of the line ARE trailing whitespace ;)
(set-face-background 'whitespace-tab "blue")
(set-face-background 'whitespace-space-before-tab "red")
(set-face-background 'whitespace-space-after-tab "red")

;; silently ensure newline at end of file
(setq require-final-newline t)

;; MySQL mode
(eval-after-load "sql"
	'(progn
		(sql-set-product 'mysql)
	)
)

;; python mode
(add-hook 'python-mode-hook
	(lambda ()
		(setq indent-tabs-mode t)
		(setq python-indent 8)
		(setq tab-width 4)
	)
)

;; ruby mode
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(autoload 'ruby-mode "ruby-mode" "Major mode for editing Ruby code" t)
(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))

(add-to-list 'load-path "~/.emacs-ben/ruby-electric")
(require 'ruby-electric)
(add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))

(add-to-list 'auto-mode-alist
	'("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
	'("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))


(custom-set-variables
	;; custom-set-variables was added by Custom.
	;; If you edit it by hand, you could mess it up, so be careful.
	;; Your init file should contain only one such instance.
	;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t))

(custom-set-faces
	;; custom-set-faces was added by Custom.
	;; If you edit it by hand, you could mess it up, so be careful.
	;; Your init file should contain only one such instance.
	;; If there is more than one, they won't work right.
 )

;; vim:set ft=lisp:

;; tramp
(setq tramp-default-method "ssh")

;; change background color in graphic mode
(when (display-graphic-p)
	(set-background-color "black"))
	(set-foreground-color "green")
