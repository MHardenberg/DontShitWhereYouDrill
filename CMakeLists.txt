cmake_minimum_required(VERSION 3.15)
project(dontShitWhereYoudDrill)

file(GLOB TEX_FILES "*.tex")
set(LATEX_COMPILER pdflatex)

foreach(tex_file ${TEX_FILES})
    get_filename_component(name ${tex_file} NAME_WE)
    set(pdf_file "${CMAKE_CURRENT_BINARY_DIR}/${name}.pdf")

    add_custom_command(
        OUTPUT "${pdf_file}"
        WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"

        COMMAND ${LATEX_COMPILER}
                -interaction=nonstopmode
                -output-directory "${CMAKE_CURRENT_BINARY_DIR}"
                "${name}.tex"

        COMMAND ${CMAKE_COMMAND} -E env
                "openout_any=a"
                "TEXMFOUTPUT=${CMAKE_CURRENT_BINARY_DIR}:"
                bibtex "${CMAKE_CURRENT_BINARY_DIR}/${name}" || true

        COMMAND ${LATEX_COMPILER}
                -interaction=nonstopmode
                -halt-on-error
                -output-directory "${CMAKE_CURRENT_BINARY_DIR}"
                "${name}.tex"

        COMMAND ${LATEX_COMPILER}
                -interaction=nonstopmode
                -halt-on-error
                -output-directory "${CMAKE_CURRENT_BINARY_DIR}"
                "${name}.tex"

        DEPENDS "${tex_file}"
    )
    add_custom_target(${name}_pdf ALL DEPENDS "${pdf_file}")
endforeach()
