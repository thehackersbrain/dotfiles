;; spell-check config
(setq ispell-dictionary "en_US")        ;; Set dictionary to en_US explicitly
(setq ispell-local-dictionary "en_US")


;; Custom corfu mode optimization
(after! corfu
  (use-package corfu
    :hook (after-init . global-corfu-mode)
    :config
    (setq corfu-auto t
          corfu-auto-delay 0
          corfu-cycle t
          corfu-auto-prefix 1))

  ;; Remap TAB to cycle completions
  (define-key corfu-map (kbd "TAB") 'corfu-next)
  (define-key corfu-map (kbd "<tab>") 'corfu-next)
  (define-key corfu-map (kbd "S-TAB") 'corfu-previous)

  ;; Optional fine-tuning for Corfu
  (setq corfu-min-width 50
        corfu-commit-predicate #'corfu-commit-by-typing)
  )


;; enable dabbrev for completing words
(use-package dabbrev
  :ensure nil
  :after corfu
  :config
  (setq dabbrev-ignored-buffer-regexps '("\\.\\(?:pdf\\|jpe?g\\|png\\|gif\\)\\'")))


;; use cape-dabbrev for Corfu-completion
(use-package cape
  :ensure t
  :after corfu
  :init
  (setq cape-dabbrev-min-length 2)
  :config
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))


;; Optimization for python setup
(after! lsp-mode
  (setq lsp-idle-delay 0.5
        lsp-response-timeout 10
        read-process-output-max (* 1024 1024)
        lsp-enable-file-watchers nil))

(after! lsp-pyright
  (setq lsp-pyright-use-library-code-for-type t
        lsp-pyright-typechecking-mode "standard"
        lsp-pyright-venv-path (expand-file-name "env" (or ( projectile-project-root) default-directory))))

(use-package! gcmh
  :config
  (gcmh-mode 1)
  (setq gcmh-idle-delay 10 ;; time for memory garbage collection
        gcmh-high-cons-threshold (* 256 1024 1024)))

(setq inhibit-compacting-font-caches t)

;; setting up projects directory for projectile
(setq projectile-project-search-path '("/home/elliot/projects/"))


;; setting up latex development
;; enable lsp mode
(use-package tex
  :ensure auctex
  :mode ("\\.tex\\'" . LaTeX-mode) ;; Correct association
  :hook
  (LaTeX-mode . reftex-mode)      ;; Enable referencing
  (LaTeX-mode . turn-on-flyspell) ;; Enable spellchecking
  (LaTeX-mode . outline-indent-minor-mode) ;; Enable folding
  (LaTeX-mode . lsp) ;; Enable lsp mode
  (LaTeX-mode . yas-minor-mode) ;; Enable snippets
  :init
  (setq TeX-parse-self t ;; Auto-parse tex file on load
        TeX-auto-save t  ;; Auto-parse tex file on save
        TeX-master nil)  ;; Always query for master file
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
  (add-hook 'TeX-update-style-hook 'hl-todo-mode) ;; Fix for hl-todo-mode
  :config
  (setq TeX-view-program-selection
        '((output-pdf "PDF Tools") ;; Primary viewer
          (output-dvi "xdvi")       ;; Fallback for DVI output
          (output-html "xdg-open"))) ;; Open HTML in browser
  (setq TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
  (setq TeX-source-correlate-mode t
        TeX-source-correlate-start-server t))

(use-package pdf-tools
  :mode ("\\.pdf\\'" . pdf-view-mode)  ;; Ensure PDFs open in pdf-view-mode
  :hook (pdf-view-mode . pdf-sync-minor-mode)  ;; Enable pdf-sync-minor-mode automatically
  :custom
  (pdf-view-resize-factor 1.05) ;; Better zoom control
  (pdf-view-midnight-colors '("#ffffff" . "#000000")) ;; Dark mode
  :init
  (pdf-loader-install))

;; setting up jsx and tsx
(after! typescript-mode
  (setq typescript-indent-level 2)
  (setq lsp-headerline-breadcrumb-enable t))

(use-package! web-mode
  :mode ("\\.tsx\\'" "\\.jsx\\'" "\\.html\\'"))

(use-package! rjsx-mode
  :mode ("\\.jsx\\'" "\\.tsx\\'")
  :config
  (setq js-indent-level 2))

(use-package! emmet-mode
  :hook ((rjsx-mode . emmet-mode)
         (typescript-tsx-mode . emmet-mode)
         (web-mode . emmet-mode))
  :config
  (setq emmet-expand-jsx-className? t))

;; snippets setup
(use-package! react-snippets :after yasnippet)

;; yas-snippet config
(setq yas-snippet-dirs '("/home/elliot/.config/emacs/snippets"))
