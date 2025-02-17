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
(setq +latex-viewers '(pdf-tools))
(use-package! latex-preview-pane
  :hook (LaTeX-mode . latex-preview-pane-mode)
  :config
  (setq latex-preview-pane-multifile-mode 'AUCTeX
        ))
