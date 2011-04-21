(setq load-path (cons "~/.emacs.d" load-path))

(add-to-list 'load-path "~/elisp")
(autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))
(setq javascript-indent-level 2)
(setq js-indent-level 2)
(setq-default indent-tabs-mode nil)

;; Kills all them buffers except scratch
;; optained from http://www.chrislott.org/geek/emacs/dotemacs.html
(defun nuke-all-buffers ()
  "kill all buffers, leaving *scratch* only"
  (interactive)
  (mapcar (lambda (x) (kill-buffer x))
          (buffer-list))
  (delete-other-windows))

;; get rid of the menubar on top of the window
(menu-bar-mode 0)
(tool-bar-mode 0)

;; Show column number at bottom of screen
(column-number-mode 1)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(global-whitespace-mode t)
 '(whitespace-style (quote (tabs trailing empty tab-mark))))

;;(set-default-font "-unknown-Inconsolata-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
(setq default-frame-alist '((font-backend . "xft")
                (font . "-unknown-Inconsolata-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
                (cursor-color . "white")))

;convert a buffer from dos ^M end of lines to unix end of lines
(defun dos2unix ()
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\r" nil t) (replace-match "")))

;;(require 'color-theme)
;;(setq color-theme-is-global t)
;;(color-theme-billw)

(require 'ido)
(ido-mode t)

(setq inhibit-splash-screen t)

(fset 'dbg
   "import ipdb; ipdb.set_trace()\C-x")

;; Store temporary files out of current directory
(defvar user-temporary-file-directory
  "~/.emacs-backup")
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;;;
;;; org mode
;;;
;; The following lines are always needed.  Choose your own keys.
(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(add-hook 'org-mode-hook 'turn-on-font-lock)

(add-to-list 'load-path "~/elisp/remember")
(require 'remember)

;; (org-remember-insinuate) <- don't have this
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)

(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "main.org"))
(define-key global-map "\C-cr" 'org-remember)

;; C-c C-c stores the note immediately
(setq org-remember-store-without-prompt t)

(setq org-remember-templates
      '(("Inbox" ~i "* %?" "~/org/main.org" "Inbox")))

;;; end org mode
;;;
(require 'whitespace)

(global-linum-mode 1) ; always show line numbers

;;; flymake and pyflakes
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)
;;; end flymake and pyflakes

(require 'midnight)

(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)
(setq ibuffer-default-sorting-mode 'major-mode)