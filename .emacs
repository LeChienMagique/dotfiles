(package-initialize)

(load "~/.emacs.rc/rc.el")

(setq custom-file "~/.emacs-custom.el")
(load custom-file)

(set-face-attribute 'default nil :font "iosevka-14")

(tool-bar-mode 0)
(menu-bar-mode 0)
(column-number-mode 1)
(scroll-bar-mode 0)
(show-paren-mode 1)
(setq confirm-kill-emacs 'y-or-n-p)

(global-set-key (kbd "C-v") 'yank)

(rc/require 'smex)
(ido-mode 1)
(ido-everywhere 1)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-unset-key (kbd "C-z"))

(defalias 'yes-or-no-p 'y-or-n-p)

(rc/require 'doom-themes)

;;; Whitespace mode
(defun rc/set-up-whitespace-handling ()
  (interactive)
  (whitespace-mode 1) ;; set to 1 to enable
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))
(add-hook 'simpc-mode-hook 'rc/set-up-whitespace-handling)

(rc/require 'magit)
(rc/require 'diff-hl)
(global-diff-hl-mode)
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)
(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;;; multiple cursors
(rc/require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)


(load-file "~/.emacs.local/simpc-mode.el")
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(rc/require 'nix-mode)
(rc/require 'graphviz-dot-mode)

;;; Move Text
(rc/require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'rc/duplicate-line)

(setq company-minimum-prefix-length 2)

;;; Company
(rc/require 'company)
;; (require 'company)

;; (global-company-mode)

;; (add-to-list 'eglot-server-programs '((c++-mode simpc-mode) "clangd"))

;;; LateX
(rc/require 'auctex)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(rc/require 'latex-preview-pane)
(rc/require 'cdlatex)
(rc/require 'which-key)
(add-hook 'LaTeX-mode-hook #'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook #'turn-on-cdlatex)   ; with Emacs latex mode
(put 'narrow-to-region 'disabled nil)

(rc/require 'cypher-mode)

;;; tramp
;;; http://stackoverflow.com/questions/13794433/how-to-disable-autosave-for-tramp-buffers-in-emacs
(setq tramp-auto-save-directory "/tmp")

(rc/require 'nix-mode)
(rc/require 'graphviz-dot-mode)

(rc/require 'clang-format)
(add-hook 'simpc-mode-hook
          (lambda () (local-set-key (kbd "C-M-l") 'clang-format-buffer)))
(add-hook 'c-mode-hook
          (lambda () (local-set-key (kbd "C-M-l") 'clang-format-buffer)))

(global-set-key (kbd "M-?") 'xref-find-references)

(global-visual-line-mode t)

(rc/require 'writeroom-mode)
(rc/require 'docker)
(rc/require 'nyan-mode)
(rc/require 'minesweeper)

;; Org-mode
(add-hook 'org-mode-hook 'diff-hl-dired-mode)
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (dot . t) ; this line activates dot
   (shell . t)
  )
)

(rc/require 'htmlize)
(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "dot")))  ; don't ask for dot
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)
;; END org-mode

;; (rc/require 'mini-frame)
(put 'dired-find-alternate-file 'disabled nil)

(rc/require 'ahk-mode)
;; (rc/require 'wakatime-mode)

(setq tags-revert-without-query 1)

(rc/require 'pg)
(load-file "~/.emacs.local/pgmacs.el")

;; (setq dired-dwim-target t)
(rc/require 'dired-ranger)
(eval-after-load "dired" '(progn
    (define-key dired-mode-map (kbd "C-x w") 'dired-ranger-copy)
    (define-key dired-mode-map (kbd "C-x m") 'dired-ranger-move)
    (define-key dired-mode-map (kbd "C-x c") 'dired-ranger-paste)
    ))
(put 'dired-find-alternate-file 'disabled nil)

(rc/require 'gtags-mode)
; (add-hook 'emacs-startup-hook #'gtags-mode)

(rc/require 'fzf)
(use-package fzf
  :bind
  ;; Don't forget to set keybinds!
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        ;; fzf/grep-command "rg --no-heading -nH"
        fzf/grep-command "grep -nrH"
        ;; If nil, the fzf buffer will appear at the top of the window
        fzf/position-bottom t
        fzf/window-height 15))


;; Colorful compilation-mode (https://emacs.stackexchange.com/questions/24698/ansi-escape-sequences-in-compilation-mode)
;; Stolen from (http://endlessparentheses.com/ansi-colors-in-the-compilation-buffer-output.html)
(require 'ansi-color)
(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)
