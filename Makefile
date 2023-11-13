TYPST_FLAGS += --font-path fonts

thesis:
	typst compile ${TYPST_FLAGS} thesis.typ

watch:
	typst watch ${TYPST_FLAGS} thesis.typ
