(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex")
 '(TeX-command "tex")
 '(compilation-always-kill t)
 '(custom-enabled-themes '(doom-challenger-deep))
 '(custom-safe-themes
   '("cbdf8c2e1b2b5c15b34ddb5063f1b21514c7169ff20e081d39cf57ffee89bc1e"
     "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1"
     default))
 '(delete-selection-mode t)
 '(display-line-numbers 'relative)
 '(eldoc-box-clear-with-C-g t)
 '(electric-pair-mode t)
 '(global-eldoc-mode t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(org-export-preserve-breaks t)
 '(org-modules
   '(org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc
	      org-mhe org-rmail org-w3m))
 '(package-selected-packages
   '(emacs-slack htmlize minesweeper nyan-mode docker writeroom-mode
		 clang-format diff-hl eglot cypher-mode
		 latex-preview-pane which-key cdlatex auctex company
		 move-text graphviz-dot-mode nix-mode multiple-cursors
		 magit simpc-mode smex ido-ubiquitous doom-themes
		 doom-themes-theme dash-functional dash))
 '(pdf-latex-command "pdflatex")
 '(ring-bell-function 'ignore)
 '(shell-escape-mode "-shell-escape")
 '(tex-start-options "--shell-escape")
 '(visible-bell t)
 '(warning-suppress-log-types '((native-compiler) (comp)))
 '(warning-suppress-types '((comp)))
 '(whitespace-style
   '(face tabs spaces trailing space-before-tab newline indentation empty
	  space-after-tab space-mark tab-mark))
 '(writeroom-fullscreen-effect 'maximized)
 '(writeroom-global-effects
   '(writeroom-set-alpha writeroom-set-menu-bar-lines
			 writeroom-set-tool-bar-lines
			 writeroom-set-vertical-scroll-bars
			 writeroom-set-bottom-divider-width))
 '(writeroom-maximize-window nil)
 '(writeroom-restore-window-config t)
 '(writeroom-width 120))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-indentation ((t (:background "#4C4B6800" :foreground "#2f2f4f"))))
 '(whitespace-space ((t (:foreground "#2f2f4f")))))
