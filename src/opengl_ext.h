/*
 * See Licensing and Copyright notice in naev.h
 */


#ifndef OPENGL_EXT_H
#  define OPENGL_EXT_H


#include "SDL_opengl.h"

/* GL_SGIS_generate_mipmap */
extern void (APIENTRY *nglGenerateMipmap)(GLenum target);

/* GL_ARB_multitexture */
extern void (APIENTRY *nglActiveTexture)(GLenum texture);
extern void (APIENTRY *nglClientActiveTexture)(GLenum texture);
extern void (APIENTRY *nglMultiTexCoord2d)(GLenum target,GLdouble s,GLdouble t);

/* GL_ARB_vertex_buffer_object */
extern void (APIENTRY *nglGenBuffers)(GLsizei n, GLuint* ids);
extern void (APIENTRY *nglBindBuffer)(GLenum target, GLuint id);
extern void (APIENTRY *nglBufferData)(GLenum target, GLsizei size, const void* data, GLenum usage);
extern void (APIENTRY *nglBufferSubData)(GLenum target, GLint offset, GLsizei size, void* data);
extern void* (APIENTRY *nglMapBuffer)(GLenum target, GLenum access);
extern void (APIENTRY *nglUnmapBuffer)(GLenum target);
extern void (APIENTRY *nglDeleteBuffers)(GLsizei n, const GLuint* ids);

/* GL_ARB_texture_compression */
extern void (APIENTRY *nglCompressedTexImage2D)(GLenum, GLint, GLenum, GLsizei, GLsizei, GLint, GLsizei, const GLvoid *);


/*
 * Initializes the extensions.
 */
int gl_initExtensions (void);
void gl_exitExtensions (void);


#endif /* OPENGL_EXT_H */

