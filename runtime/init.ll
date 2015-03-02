;;
;; Copyright (c) 2011, Andrew Sorensen
;; 
;; All rights reserved
;;
;; Redistribution and use in source and binary forms, with or without 
;; modification, are permitted provided that the following conditions are met:
;; 
;; 1. Redistributions of source code must retain the above copyright notice, 
;;    this list of conditions and the following disclaimer.
;; 
;; 2. Redistributions in binary form must reproduce the above copyright notice,
;;    this list of conditions and the following disclaimer in the documentation 
;;    and/or other materials provided with the distribution.
;; 
;; Neither the name of the authors nor other contributors may be used to endorse
;; or promote products derived from this software without specific prior written 
;; permission.
;; 
;; 
;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
;; ARE DISCLEXTD. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
;; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
;; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
;; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
;; POSSIBILITY OF SUCH DAMAGE.
;; 
;; 

;; regex stuff
declare i1 @rmatch(i8*,i8*)
declare i1 @rsplit(i8*,i8*,i8*,i8*)
declare i8* @rreplace(i8*,i8*,i8*,i8*);

;; base64 stuff
;; i64's here should be size_t !!!
declare i8* @base64_encode(i8*,i64,i64)
declare i8* @base64_decode(i8*,i64,i64)
declare i8* @cname_encode(i8*,i64,i64)
declare i8* @cname_decode(i8*,i64,i64)

declare double @clock_clock()

;; swap stuff
declare i64 @swap64f(double)
declare double @unswap64f(i64)
declare i32 @swap32f(float)
declare float @unswap32f(i32)
declare i64 @swap64i(i64)
declare i64 @unswap64i(i64)
declare i32 @swap32i(i32)
declare i32 @unswap32i(i32)


;; thread stuff
;;declare i8* @thread_fork(i8*(i8*)*,i8*);
declare i8* @thread_fork(i8*,i8*);
declare i32 @thread_join(i8*);
declare i32 @thread_kill(i8*);
declare i8* @thread_self();
declare i64 @thread_sleep(i64,i64);
declare i8* @mutex_create()
declare i32 @mutex_destroy(i8*)
declare i32 @mutex_lock(i8*)
declare i32 @mutex_unlock(i8*)
declare i32 @mutex_trylock(i8*)

;; malloc zone structures
%mzone = type {i8*, i64, i64, i64, %mzone*}
%clsvar = type {i8*, i32, i8*, %clsvar*}

declare %mzone* @llvm_threads_get_callback_zone() nounwind
declare void @llvm_runtime_error(i64,i8*) nounwind
declare %mzone* @llvm_zone_create(i64) nounwind
declare %mzone* @llvm_peek_zone_stack() nounwind
declare %mzone* @llvm_pop_zone_stack() nounwind
declare void @llvm_push_zone_stack(%mzone*) nounwind
declare void @llvm_zone_destroy(%mzone*) nounwind
declare void @llvm_zone_print(%mzone*) nounwind
declare %mzone* @llvm_zone_reset(%mzone*) nounwind
declare i1 @llvm_zone_copy_ptr(i8*, i8*) nounwind
declare void @llvm_zone_mark(%mzone*) nounwind
declare i64 @llvm_zone_mark_size(%mzone*) nounwind
declare void @llvm_zone_ptr_set_size(i8*, i64) nounwind
declare i64 @llvm_zone_ptr_size(i8*) nounwind
declare i8* @llvm_zone_malloc(%mzone*, i64) nounwind
declare i8* @llvm_stack_alloc(i64) nounwind
declare i1 @llvm_ptr_in_zone(%mzone*, i8*) nounwind
declare i1 @llvm_ptr_in_current_zone(i8*) nounwind
declare %clsvar* @get_address_table(i8*, %clsvar*) nounwind
declare i32 @get_address_offset(i8*, %clsvar*) nounwind
declare i1 @check_address_type(i8*, %clsvar*, i8*) nounwind
declare i1 @check_address_exists(i8*, %clsvar*) nounwind
declare %clsvar* @new_address_table() nounwind
declare %clsvar* @add_address_table(%mzone*, i8*, i32, i8*, i32, %clsvar*) nounwind
declare void @llvm_print_pointer(i8*)
declare void @llvm_print_i32(i32)
declare void @llvm_print_i64(i64)
declare void @llvm_print_f32(float)
declare void @llvm_print_f64(double)
declare i8* @llvm_memset(i8*, i32, i64)
declare i8* @extitoa(i64)
declare i64 @string_hash(i8*)
declare void @llvm_schedule_callback(i64, i8*)
declare i8* @llvm_get_function_ptr(i8*)
declare void @ascii_text_color(i32,i32,i32)

declare void @llvm_send_udp(i8*,i32,i8*,i32)

;; declare i8* @llvm_make_ucontext();
;; declare i8* @llvm_scheme_process_ucontext();

declare i64 @next_prime(i64)

;; alias for environment data
%envt = type i8*

declare i8* @malloc(i64) nounwind
declare void @free(i8*) nounwind
declare i8* @malloc16(i64) nounwind
declare void @free16(i8*) nounwind

declare i32 @system(i8*) nounwind
declare i8* @getenv(i8*) nounwind 
declare i32 @setenv(i8*, i8*, i32) nounwind 
declare i32 @unsetenv(i8*) nounwind 

;; 
declare i32 @abs(i32)
declare i64 @llabs(i64)


;; scheme.h stuff
declare i8* @mk_i64(i8*,i64)
declare i8* @mk_i32(i8*,i32)
declare i8* @mk_i16(i8*,i16)
declare i8* @mk_i8(i8*,i8)
declare i8* @mk_i1(i8*,i1)
declare i8* @mk_double(i8*,double)
declare i8* @mk_float(i8*,float)
declare i8* @mk_string(i8*,i8*)
declare i8* @mk_cptr(i8*,i8*)

declare i64 @i64value(i8*)
declare i32 @i32value(i8*)
declare i16 @i16value(i8*)
declare i8 @i8value(i8*)
declare i1 @i1value(i8*)
declare i32 @is_integer(i8*)
declare double @r64value(i8*)
declare float @r32value(i8*)
declare i32 @is_real(i8*)
declare i8* @string_value(i8*)
declare i32 @is_string(i8*)
declare i8* @cptr_value(i8*)
declare i32 @is_cptr(i8*)
declare i32 @is_cptr_or_str(i8*)

declare i8* @list_ref(i8*,i32,i8*)

;; math.h stuff
declare i32 @rand()

; declare double @cosd(double)
; declare double @tand(double)
; declare double @sind(double)
; declare double @coshd(double)
; declare double @tanhd(double)
; declare double @sinhd(double)
; declare double @acosd(double)
; declare double @asind(double)
; declare double @atand(double)
; declare double @atan2d(double, double)
; declare double @ceild(double)
; declare double @floord(double)
; declare double @expd(double)
; declare double @fmodd(double,double)
; declare double @powd(double,double)
; declare double @logd(double)
; declare double @log2d(double)
; declare double @log10d(double)
; declare double @sqrtd(double)
; declare double @fabsd(double)



declare double @llvm_tan(double)
declare double @llvm_cosh(double)
declare double @llvm_tanh(double)
declare double @llvm_sinh(double)
declare double @llvm_acos(double)
declare double @llvm_asin(double)
declare double @llvm_atan(double)
declare double @llvm_atan2(double,double)

; declare double @llvm_cos(double)
; declare double @llvm_sin(double)
; declare double @llvm_ceil(double)
; declare double @llvm_floor(double)
; declare double @llvm_exp(double)
; declare double @llvm_fmod(double,double)
; declare double @llvm_pow(double,double)
; declare double @llvm_log(double)
; declare double @llvm_log2(double)
; declare double @llvm_log10(double)
; declare double @llvm_sqrt(double)
; declare double @llvm_fabs(double)


; declare float @cosf(float)
; declare float @sinf(float)
; declare float @ceilf(float)
; declare float @floorf(float)
; declare float @expf(float)
; declare float @fmodf(float,float)
; declare float @powf(float,float)
; declare float @logf(float)
; declare float @log10f(float)
; declare float @sqrtf(float)
; declare float @fabsf(float)

declare float @tanf(float)
declare float @coshf(float)
declare float @tanhf(float)
declare float @sinhf(float)
declare float @acosf(float)
declare float @asinf(float)
declare float @atanf(float)
declare float @atan2f(float, float)

;; c99 math.h stuff
declare double @acosh(double)
declare double @asinh(double)
declare double @atanh(double)
declare double @cbrt(double)
declare double @copysign(double,double)
declare double @erf(double)
declare double @erfc(double)
; declare double @exp2(double)
declare double @expm1(double)
declare double @fdim(double,double)
; declare double @fma(double,double,double)
declare double @fmax(double,double)
declare double @fmin(double,double)
declare double @hypot(double,double)
declare double @ilogb(double)
declare double @lgamma(double)
declare i64 @llrint(double)
declare i64 @lrint(double)
declare i32 @rint(double)
declare i64 @llround(double)
declare i32 @lround(double)
declare double @log1p(double)
declare i32 @logb(double)
declare double @nan(i8*)
; declare double @nearbyint(double)
declare double @nextafter(double,double)
declare double @nexttoward(double,double)
declare double @remainder(double, double)
declare double @remquo(double, double, i8*)
; declare double @round(double)
declare double @scalbn(double,i32)
declare double @tgamma(double)
declare double @trunc(double)

declare float @acoshf(float)
declare float @asinhf(float)
declare float @atanhf(float)
declare float @cbrtf(float)
declare float @copysignf(float,float)
declare float @erff(float)
declare float @erfcf(float)
; declare float @exp2f(float)
declare float @expm1f(float)
declare float @fdimf(float,float)
; declare float @fmaf(float,float,float)
declare float @fmaxf(float,float)
declare float @fminf(float,float)
declare float @hypotf(float,float)
declare float @ilogbf(float)
declare float @lgammaf(float)
declare i64 @llrintf(float)
declare i64 @lrintf(float)
declare i32 @rintf(float)
declare i64 @llroundf(float)
declare i32 @lroundf(float)
declare float @log1pf(float)
declare float @log2f(float)
declare i32 @logbf(float)
declare float @nanf(i8*)
; declare float @nearbyintf(float)
declare float @nextafterf(float,float)
declare float @nexttowardf(float,float)
declare float @remainderf(float, float)
declare float @remquof(float, float, i8*)
; declare float @roundf(float)
declare float @scalbnf(float,i32)
declare float @tgammaf(float)
; declare float @truncf(float)

;; llvm math intrinsics

declare double @llvm.sin.f64(double)
declare double @llvm.cos.f64(double)
declare double @llvm.ceil.f64(double)
declare double @llvm.floor.f64(double)
declare double @llvm.exp.f64(double)
declare double @llvm.fmod.f64(double)
declare double @llvm.pow.f64(double,double)
declare double @llvm.log.f64(double)
declare double @llvm.log2.f64(double)
declare double @llvm.log10.f64(double)
declare double @llvm.sqrt.f64(double)
declare double @llvm.fabs.f64(double)
declare double @llvm.round.f64(double)
declare double @llvm.trunc.f64(double)
declare double @llvm.nearbyint.f64(double)
declare double @llvm.fma.f64(double,double,double)
declare double @llvm.exp2.f64(double)
declare double @llvm.powi.f64(double,i32)

declare float @llvm.sin.f32(float)
declare float @llvm.cos.f32(float)
declare float @llvm.ceil.f32(float)
declare float @llvm.floor.f32(float)
declare float @llvm.exp.f32(float)
declare float @llvm.fmod.f32(float)
declare float @llvm.pow.f32(float,float)
declare float @llvm.log.f32(float)
declare float @llvm.log2.f32(float)
declare float @llvm.log10.f32(float)
declare float @llvm.sqrt.f32(float)
declare float @llvm.fabs.f32(float)
declare float @llvm.round.f32(float)
declare float @llvm.trunc.f32(float)
declare float @llvm.nearbyint.f32(float)
declare float @llvm.fma.f32(float,float,float)
declare float @llvm.exp2.f32(float)
declare float @llvm.powi.f32(float,i32)

declare <2 x double> @llvm.sin.v2f64(<2 x double>)
declare <2 x double> @llvm.cos.v2f64(<2 x double>)
declare <2 x double> @llvm.ceil.v2f64(<2 x double>)
declare <2 x double> @llvm.floor.v2f64(<2 x double>)
declare <2 x double> @llvm.exp.v2f64(<2 x double>)
declare <2 x double> @llvm.fmod.v2f64(<2 x double>)
declare <2 x double> @llvm.pow.v2f64(<2 x double>,<2 x double>)
declare <2 x double> @llvm.log.v2f64(<2 x double>)
declare <2 x double> @llvm.log2.v2f64(<2 x double>)
declare <2 x double> @llvm.log10.v2f64(<2 x double>)
declare <2 x double> @llvm.sqrt.v2f64(<2 x double>)
declare <2 x double> @llvm.fabs.v2f64(<2 x double>)
declare <2 x double> @llvm.round.v2f64(<2 x double>)
declare <2 x double> @llvm.trunc.v2f64(<2 x double>)
declare <2 x double> @llvm.nearbyint.v2f64(<2 x double>)
declare <2 x double> @llvm.fma.v2f64(<2 x double>,<2 x double>,<2 x double>)
declare <2 x double> @llvm.exp2.v2f64(<2 x double>)
declare <2 x double> @llvm.powi.v2f64(<2 x double>,<2 x i32>)

declare <4 x double> @llvm.sin.v4f64(<4 x double>)
declare <4 x double> @llvm.cos.v4f64(<4 x double>)
declare <4 x double> @llvm.ceil.v4f64(<4 x double>)
declare <4 x double> @llvm.floor.v4f64(<4 x double>)
declare <4 x double> @llvm.exp.v4f64(<4 x double>)
declare <4 x double> @llvm.fmod.v4f64(<4 x double>)
declare <4 x double> @llvm.pow.v4f64(<4 x double>,<4 x double>)
declare <4 x double> @llvm.log.v4f64(<4 x double>)
declare <4 x double> @llvm.log2.v4f64(<4 x double>)
declare <4 x double> @llvm.log10.v4f64(<4 x double>)
declare <4 x double> @llvm.sqrt.v4f64(<4 x double>)
declare <4 x double> @llvm.fabs.v4f64(<4 x double>)
declare <4 x double> @llvm.round.v4f64(<4 x double>)
declare <4 x double> @llvm.trunc.v4f64(<4 x double>)
declare <4 x double> @llvm.nearbyint.v4f64(<4 x double>)
declare <4 x double> @llvm.fma.v4f64(<4 x double>,<4 x double>,<4 x double>)
declare <4 x double> @llvm.exp2.v4f64(<4 x double>)
declare <4 x double> @llvm.powi.v4f64(<4 x double>,<4 x i32>)

declare <4 x float> @llvm.sin.v4f32(<4 x float>)
declare <4 x float> @llvm.cos.v4f32(<4 x float>)
declare <4 x float> @llvm.ceil.v4f32(<4 x float>)
declare <4 x float> @llvm.floor.v4f32(<4 x float>)
declare <4 x float> @llvm.exp.v4f32(<4 x float>)
declare <4 x float> @llvm.fmod.v4f32(<4 x float>)
declare <4 x float> @llvm.pow.v4f32(<4 x float>,<4 x float>)
declare <4 x float> @llvm.log.v4f32(<4 x float>)
declare <4 x float> @llvm.log2.v4f32(<4 x float>)
declare <4 x float> @llvm.log10.v4f32(<4 x float>)
declare <4 x float> @llvm.sqrt.v4f32(<4 x float>)
declare <4 x float> @llvm.fabs.v4f32(<4 x float>)
declare <4 x float> @llvm.round.v4f32(<4 x float>)
declare <4 x float> @llvm.trunc.v4f32(<4 x float>)
declare <4 x float> @llvm.nearbyint.v4f32(<4 x float>)
declare <4 x float> @llvm.fma.v4f32(<4 x float>,<4 x float>,<4 x float>)
declare <4 x float> @llvm.exp2.v4f32(<4 x float>)
declare <4 x float> @llvm.powi.v4f32(<4 x float>,<4 x i32>)

declare <8 x float> @llvm.sin.v8f32(<8 x float>)
declare <8 x float> @llvm.cos.v8f32(<8 x float>)
declare <8 x float> @llvm.ceil.v8f32(<8 x float>)
declare <8 x float> @llvm.floor.v8f32(<8 x float>)
declare <8 x float> @llvm.exp.v8f32(<8 x float>)
declare <8 x float> @llvm.fmod.v8f32(<8 x float>)
declare <8 x float> @llvm.pow.v8f32(<8 x float>,<8 x float>)
declare <8 x float> @llvm.log.v8f32(<8 x float>)
declare <8 x float> @llvm.log2.v8f32(<8 x float>)
declare <8 x float> @llvm.log10.v8f32(<8 x float>)
declare <8 x float> @llvm.sqrt.v8f32(<8 x float>)
declare <8 x float> @llvm.fabs.v8f32(<8 x float>)
declare <8 x float> @llvm.round.v8f32(<8 x float>)
declare <8 x float> @llvm.trunc.v8f32(<8 x float>)
declare <8 x float> @llvm.nearbyint.v8f32(<8 x float>)
declare <8 x float> @llvm.fma.v8f32(<8 x float>,<8 x float>,<8 x float>)
declare <8 x float> @llvm.exp2.v8f32(<8 x float>)
declare <8 x float> @llvm.powi.v8f32(<8 x float>,<8 x i32>)

;; stdio.h stuff
declare void @clearerr(i8*)
declare i8* @ctermid(i8*)
declare i32 @fclose(i8*)
declare i8* @fdopen(i32,  i8*)
declare i32 @feof(i8*)
declare i32 @ferror(i8*)
declare i32 @fflush(i8*)
declare i32 @fgetc(i8*)
declare i8* @fgets(i8*, i32, i8*)
declare i32 @fileno(i8*)
declare void @flockfile(i8*)
declare i8* @fopen( i8*,  i8*)
declare i32 @fputc(i32, i8*)
declare i32 @fputs( i8*, i8*)
declare i64 @fread(i8*, i64, i64, i8*)
declare i8* @freopen( i8*,  i8*, i8*)
declare i32 @fseek(i8*, i64, i32)
declare i64 @ftell(i8*)
declare i32 @ftrylockfile(i8*)
declare void @funlockfile(i8*)
declare i64 @fwrite( i8*, i64, i64, i8*)
declare i32 @getc(i8*)
declare i32 @getchar()
declare i32 @getc_unlocked(i8*)
declare i32 @getchar_unlocked()
declare i8* @gets(i8*)
declare i32 @getw(i8*)
declare i32 @pclose(i8*)
declare void @perror( i8*)
declare i8* @popen( i8*,  i8*)
declare i32 @putc(i32, i8*)
declare i32 @putchar(i32)
declare i32 @putc_unlocked(i32, i8*)
declare i32 @putchar_unlocked(i32)
declare i32 @puts( i8*)
declare i32 @putw(i32, i8*)
declare i32 @remove( i8*)
declare i32 @rename( i8*,  i8*)
declare void @rewind(i8*)
declare void @setbuf(i8*, i8*)
declare i32 @setvbuf(i8*, i8*, i32, i64)
declare i8* @tempnam( i8*,  i8*)
declare i8* @tmpfile()
declare i8* @tmpnam(i8*)
declare i32 @ungetc(i32, i8*)
declare i32 @llvm_printf(i8*, ...)
declare i32 @llvm_fprintf(i8*, i8*, ...)
declare i32 @llvm_sprintf(i8*, i8*, ...)
declare i32 @llvm_sscanf(i8*, i8*, ...)
declare i32 @llvm_fscanf(i8*, i8*, ...)


;; string stuff
declare double @atof(i8*)
declare i32 @atoi(i8*)
declare i64 @atol(i8*)

declare i8* @memccpy(i8*, i8*, i32, i64)
declare i8* @memchr(i8*, i32, i64)
declare i32 @memcmp(i8*, i8*, i64)
declare i8* @memcpy(i8*, i8*, i64)
declare i8* @memmove(i8*, i8*, i64)
declare i8* @memset(i8*, i32, i64)
declare i8* @strcat(i8*, i8*)
declare i8* @strchr(i8*, i32)
declare i32 @strcmp(i8*, i8*)
declare i32 @strcoll(i8*, i8*)
declare i8* @strcpy(i8*, i8*)
declare i64 @strcspn(i8*, i8*)
declare i8* @strdup(i8*)
declare i8* @strerror(i32)
declare i64 @strlen(i8*)
declare i8* @strncat(i8*, i8*, i64)
declare i32 @strncmp(i8*, i8*, i64)
declare i8* @strncpy(i8*, i8*, i64)
declare i8* @strpbrk(i8*, i8*)
declare i8* @strrchr(i8*, i32)
declare i64 @strspn(i8*, i8*)
declare i8* @strstr(i8*, i8*)
declare i8* @strtok(i8*, i8*)
declare i8* @strtok_r(i8*, i8*, i8**)
declare i64 @strxfrm(i8*, i8*, i64)

;; misc C lib stuff
declare void @longjmp(i8*,i32)
declare i32 @setjmp(i8*)


;; opengl
 declare void @glAccum(i32, float)
 declare void @glAlphaFunc(i32, float)
 declare zeroext i8 @glAreTexturesResident(i32, i32*, i8*)
 declare void @glArrayElement(i32)
 declare void @glBegin(i32)
 declare void @glBindTexture(i32, i32)
 declare void @glBitmap(i32, i32, float, float, float, float, i8*)
 declare void @glBlendColor(float, float, float, float)
 declare void @glBlendEquation(i32)
 declare void @glBlendEquationSeparate(i32, i32)
 declare void @glBlendFunc(i32, i32)
 declare void @glCallList(i32)
 declare void @glCallLists(i32, i32, i8*)
 declare void @glClear(i32)
 declare void @glClearAccum(float, float, float, float)
 declare void @glClearColor(float, float, float, float)
 declare void @glClearDepth(double)
 declare void @glClearIndex(float)
 declare void @glClearStencil(i32)
 declare void @glClipPlane(i32, double*)
 declare void @glColor3b(i8 signext, i8 signext, i8 signext)
 declare void @glColor3bv(i8*)
 declare void @glColor3d(double, double, double)
 declare void @glColor3dv(double*)
 declare void @glColor3f(float, float, float)
 declare void @glColor3fv(float*)
 declare void @glColor3i(i32, i32, i32)
 declare void @glColor3iv(i32*)
 declare void @glColor3s(i16 signext, i16 signext, i16 signext)
 declare void @glColor3sv(i16*)
 declare void @glColor3ub(i8 zeroext, i8 zeroext, i8 zeroext)
 declare void @glColor3ubv(i8*)
 declare void @glColor3ui(i32, i32, i32)
 declare void @glColor3uiv(i32*)
 declare void @glColor3us(i16 zeroext, i16 zeroext, i16 zeroext)
 declare void @glColor3usv(i16*)
 declare void @glColor4b(i8 signext, i8 signext, i8 signext, i8 signext)
 declare void @glColor4bv(i8*)
 declare void @glColor4d(double, double, double, double)
 declare void @glColor4dv(double*)
 declare void @glColor4f(float, float, float, float)
 declare void @glColor4fv(float*)
 declare void @glColor4i(i32, i32, i32, i32)
 declare void @glColor4iv(i32*)
 declare void @glColor4s(i16 signext, i16 signext, i16 signext, i16 signext)
 declare void @glColor4sv(i16*)
 declare void @glColor4ub(i8 zeroext, i8 zeroext, i8 zeroext, i8 zeroext)
 declare void @glColor4ubv(i8*)
 declare void @glColor4ui(i32, i32, i32, i32)
 declare void @glColor4uiv(i32*)
 declare void @glColor4us(i16 zeroext, i16 zeroext, i16 zeroext, i16 zeroext)
 declare void @glColor4usv(i16*)
 declare void @glColorMask(i8 zeroext, i8 zeroext, i8 zeroext, i8 zeroext)
 declare void @glColorMaterial(i32, i32)
 declare void @glColorPointer(i32, i32, i32, i8*)
 declare void @glColorSubTable(i32, i32, i32, i32, i32, i8*)
 declare void @glColorTable(i32, i32, i32, i32, i32, i8*)
 declare void @glColorTableParameterfv(i32, i32, float*)
 declare void @glColorTableParameteriv(i32, i32, i32*)
 declare void @glConvolutionFilter1D(i32, i32, i32, i32, i32, i8*)
 declare void @glConvolutionFilter2D(i32, i32, i32, i32, i32, i32, i8*)
 declare void @glConvolutionParameterf(i32, i32, float)
 declare void @glConvolutionParameterfv(i32, i32, float*)
 declare void @glConvolutionParameteri(i32, i32, i32)
 declare void @glConvolutionParameteriv(i32, i32, i32*)
 declare void @glCopyColorSubTable(i32, i32, i32, i32, i32)
 declare void @glCopyColorTable(i32, i32, i32, i32, i32)
 declare void @glCopyConvolutionFilter1D(i32, i32, i32, i32, i32)
 declare void @glCopyConvolutionFilter2D(i32, i32, i32, i32, i32, i32)
 declare void @glCopyPixels(i32, i32, i32, i32, i32)
 declare void @glCopyTexImage1D(i32, i32, i32, i32, i32, i32, i32)
 declare void @glCopyTexImage2D(i32, i32, i32, i32, i32, i32, i32, i32)
 declare void @glCopyTexSubImage1D(i32, i32, i32, i32, i32, i32)
 declare void @glCopyTexSubImage2D(i32, i32, i32, i32, i32, i32, i32, i32)
 declare void @glCopyTexSubImage3D(i32, i32, i32, i32, i32, i32, i32, i32, i32)
 declare void @glCullFace(i32)
 declare void @glDeleteLists(i32, i32)
 declare void @glDeleteTextures(i32, i32*)
 declare void @glDepthFunc(i32)
 declare void @glDepthMask(i8 zeroext)
 declare void @glDepthRange(double, double)
 declare void @glDisable(i32)
 declare void @glDisableClientState(i32)
 declare void @glDrawArrays(i32, i32, i32)
 declare void @glDrawBuffer(i32)
 declare void @glDrawElements(i32, i32, i32, i8*)
 declare void @glDrawPixels(i32, i32, i32, i32, i8*)
 declare void @glDrawRangeElements(i32, i32, i32, i32, i32, i8*)
 declare void @glEdgeFlag(i8 zeroext)
 declare void @glEdgeFlagPointer(i32, i8*)
 declare void @glEdgeFlagv(i8*)
 declare void @glEnable(i32)
 declare void @glEnableClientState(i32)
 declare void @glEnd()
 declare void @glEndList()
 declare void @glEvalCoord1d(double)
 declare void @glEvalCoord1dv(double*)
 declare void @glEvalCoord1f(float)
 declare void @glEvalCoord1fv(float*)
 declare void @glEvalCoord2d(double, double)
 declare void @glEvalCoord2dv(double*)
 declare void @glEvalCoord2f(float, float)
 declare void @glEvalCoord2fv(float*)
 declare void @glEvalMesh1(i32, i32, i32)
 declare void @glEvalMesh2(i32, i32, i32, i32, i32)
 declare void @glEvalPoint1(i32)
 declare void @glEvalPoint2(i32, i32)
 declare void @glFeedbackBuffer(i32, i32, float*)
 declare void @glFinish()
 declare void @glFlush()
 declare void @glFogf(i32, float)
 declare void @glFogfv(i32, float*)
 declare void @glFogi(i32, i32)
 declare void @glFogiv(i32, i32*)
 declare void @glFrontFace(i32)
 declare void @glFrustum(double, double, double, double, double, double)
 declare i32 @glGenLists(i32)
 declare void @glGenTextures(i32, i32*)
 declare void @glGetBooleanv(i32, i8*)
 declare void @glGetClipPlane(i32, double*)
 declare void @glGetColorTable(i32, i32, i32, i8*)
 declare void @glGetColorTableParameterfv(i32, i32, float*)
 declare void @glGetColorTableParameteriv(i32, i32, i32*)
 declare void @glGetConvolutionFilter(i32, i32, i32, i8*)
 declare void @glGetConvolutionParameterfv(i32, i32, float*)
 declare void @glGetConvolutionParameteriv(i32, i32, i32*)
 declare void @glGetDoublev(i32, double*)
 declare i32 @glGetError()
 declare void @glGetFloatv(i32, float*)
 declare void @glGetHistogram(i32, i8 zeroext, i32, i32, i8*)
 declare void @glGetHistogramParameterfv(i32, i32, float*)
 declare void @glGetHistogramParameteriv(i32, i32, i32*)
 declare void @glGetIntegerv(i32, i32*)
 declare void @glGetLightfv(i32, i32, float*)
 declare void @glGetLightiv(i32, i32, i32*)
 declare void @glGetMapdv(i32, i32, double*)
 declare void @glGetMapfv(i32, i32, float*)
 declare void @glGetMapiv(i32, i32, i32*)
 declare void @glGetMaterialfv(i32, i32, float*)
 declare void @glGetMaterialiv(i32, i32, i32*)
 declare void @glGetMinmax(i32, i8 zeroext, i32, i32, i8*)
 declare void @glGetMinmaxParameterfv(i32, i32, float*)
 declare void @glGetMinmaxParameteriv(i32, i32, i32*)
 declare void @glGetPixelMapfv(i32, float*)
 declare void @glGetPixelMapuiv(i32, i32*)
 declare void @glGetPixelMapusv(i32, i16*)
 declare void @glGetPointerv(i32, i8**)
 declare void @glGetPolygonStipple(i8*)
 declare void @glGetSeparableFilter(i32, i32, i32, i8*, i8*, i8*)
 declare i8* @glGetString(i32)
 declare void @glGetTexEnvfv(i32, i32, float*)
 declare void @glGetTexEnviv(i32, i32, i32*)
 declare void @glGetTexGendv(i32, i32, double*)
 declare void @glGetTexGenfv(i32, i32, float*)
 declare void @glGetTexGeniv(i32, i32, i32*)
 declare void @glGetTexImage(i32, i32, i32, i32, i8*)
 declare void @glGetTexLevelParameterfv(i32, i32, i32, float*)
 declare void @glGetTexLevelParameteriv(i32, i32, i32, i32*)
 declare void @glGetTexParameterfv(i32, i32, float*)
 declare void @glGetTexParameteriv(i32, i32, i32*)
 declare void @glHint(i32, i32)
 declare void @glHistogram(i32, i32, i32, i8 zeroext)
 declare void @glIndexMask(i32)
 declare void @glIndexPointer(i32, i32, i8*)
 declare void @glIndexd(double)
 declare void @glIndexdv(double*)
 declare void @glIndexf(float)
 declare void @glIndexfv(float*)
 declare void @glIndexi(i32)
 declare void @glIndexiv(i32*)
 declare void @glIndexs(i16 signext)
 declare void @glIndexsv(i16*)
 declare void @glIndexub(i8 zeroext)
 declare void @glIndexubv(i8*)
 declare void @glInitNames()
 declare void @glInterleavedArrays(i32, i32, i8*)
 declare zeroext i8 @glIsEnabled(i32)
 declare zeroext i8 @glIsList(i32)
 declare zeroext i8 @glIsTexture(i32)
 declare void @glLightModelf(i32, float)
 declare void @glLightModelfv(i32, float*)
 declare void @glLightModeli(i32, i32)
 declare void @glLightModeliv(i32, i32*)
 declare void @glLightf(i32, i32, float)
 declare void @glLightfv(i32, i32, float*)
 declare void @glLighti(i32, i32, i32)
 declare void @glLightiv(i32, i32, i32*)
 declare void @glLineStipple(i32, i16 zeroext)
 declare void @glLineWidth(float)
 declare void @glListBase(i32)
 declare void @glLoadIdentity()
 declare void @glLoadMatrixd(double*)
 declare void @glLoadMatrixf(float*)
 declare void @glLoadName(i32)
 declare void @glLogicOp(i32)
 declare void @glMap1d(i32, double, double, i32, i32, double*)
 declare void @glMap1f(i32, float, float, i32, i32, float*)
 declare void @glMap2d(i32, double, double, i32, i32, double, double, i32, i32, double*)
 declare void @glMap2f(i32, float, float, i32, i32, float, float, i32, i32, float*)
 declare void @glMapGrid1d(i32, double, double)
 declare void @glMapGrid1f(i32, float, float)
 declare void @glMapGrid2d(i32, double, double, i32, double, double)
 declare void @glMapGrid2f(i32, float, float, i32, float, float)
 declare void @glMaterialf(i32, i32, float)
 declare void @glMaterialfv(i32, i32, float*)
 declare void @glMateriali(i32, i32, i32)
 declare void @glMaterialiv(i32, i32, i32*)
 declare void @glMatrixMode(i32)
 declare void @glMinmax(i32, i32, i8 zeroext)
 declare void @glMultMatrixd(double*)
 declare void @glMultMatrixf(float*)
 declare void @glNewList(i32, i32)
 declare void @glNormal3b(i8 signext, i8 signext, i8 signext)
 declare void @glNormal3bv(i8*)
 declare void @glNormal3d(double, double, double)
 declare void @glNormal3dv(double*)
 declare void @glNormal3f(float, float, float)
 declare void @glNormal3fv(float*)
 declare void @glNormal3i(i32, i32, i32)
 declare void @glNormal3iv(i32*)
 declare void @glNormal3s(i16 signext, i16 signext, i16 signext)
 declare void @glNormal3sv(i16*)
 declare void @glNormalPointer(i32, i32, i8*)
 declare void @glOrtho(double, double, double, double, double, double)
 declare void @glPassThrough(float)
 declare void @glPixelMapfv(i32, i32, float*)
 declare void @glPixelMapuiv(i32, i32, i32*)
 declare void @glPixelMapusv(i32, i32, i16*)
 declare void @glPixelStoref(i32, float)
 declare void @glPixelStorei(i32, i32)
 declare void @glPixelTransferf(i32, float)
 declare void @glPixelTransferi(i32, i32)
 declare void @glPixelZoom(float, float)
 declare void @glPointSize(float)
 declare void @glPolygonMode(i32, i32)
 declare void @glPolygonOffset(float, float)
 declare void @glPolygonStipple(i8*)
 declare void @glPopAttrib()
 declare void @glPopClientAttrib()
 declare void @glPopMatrix()
 declare void @glPopName()
 declare void @glPrioritizeTextures(i32, i32*, float*)
 declare void @glPushAttrib(i32)
 declare void @glPushClientAttrib(i32)
 declare void @glPushMatrix()
 declare void @glPushName(i32)
 declare void @glRasterPos2d(double, double)
 declare void @glRasterPos2dv(double*)
 declare void @glRasterPos2f(float, float)
 declare void @glRasterPos2fv(float*)
 declare void @glRasterPos2i(i32, i32)
 declare void @glRasterPos2iv(i32*)
 declare void @glRasterPos2s(i16 signext, i16 signext)
 declare void @glRasterPos2sv(i16*)
 declare void @glRasterPos3d(double, double, double)
 declare void @glRasterPos3dv(double*)
 declare void @glRasterPos3f(float, float, float)
 declare void @glRasterPos3fv(float*)
 declare void @glRasterPos3i(i32, i32, i32)
 declare void @glRasterPos3iv(i32*)
 declare void @glRasterPos3s(i16 signext, i16 signext, i16 signext)
 declare void @glRasterPos3sv(i16*)
 declare void @glRasterPos4d(double, double, double, double)
 declare void @glRasterPos4dv(double*)
 declare void @glRasterPos4f(float, float, float, float)
 declare void @glRasterPos4fv(float*)
 declare void @glRasterPos4i(i32, i32, i32, i32)
 declare void @glRasterPos4iv(i32*)
 declare void @glRasterPos4s(i16 signext, i16 signext, i16 signext, i16 signext)
 declare void @glRasterPos4sv(i16*)
 declare void @glReadBuffer(i32)
 declare void @glReadPixels(i32, i32, i32, i32, i32, i32, i8*)
 declare void @glRectd(double, double, double, double)
 declare void @glRectdv(double*, double*)
 declare void @glRectf(float, float, float, float)
 declare void @glRectfv(float*, float*)
 declare void @glRecti(i32, i32, i32, i32)
 declare void @glRectiv(i32*, i32*)
 declare void @glRects(i16 signext, i16 signext, i16 signext, i16 signext)
 declare void @glRectsv(i16*, i16*)
 declare i32 @glRenderMode(i32)
 declare void @glResetHistogram(i32)
 declare void @glResetMinmax(i32)
 declare void @glRotated(double, double, double, double)
 declare void @glRotatef(float, float, float, float)
 declare void @glScaled(double, double, double)
 declare void @glScalef(float, float, float)
 declare void @glScissor(i32, i32, i32, i32)
 declare void @glSelectBuffer(i32, i32*)
 declare void @glSeparableFilter2D(i32, i32, i32, i32, i32, i32, i8*, i8*)
 declare void @glShadeModel(i32)
 declare void @glStencilFunc(i32, i32, i32)
 declare void @glStencilMask(i32)
 declare void @glStencilOp(i32, i32, i32)
 declare void @glTexCoord1d(double)
 declare void @glTexCoord1dv(double*)
 declare void @glTexCoord1f(float)
 declare void @glTexCoord1fv(float*)
 declare void @glTexCoord1i(i32)
 declare void @glTexCoord1iv(i32*)
 declare void @glTexCoord1s(i16 signext)
 declare void @glTexCoord1sv(i16*)
 declare void @glTexCoord2d(double, double)
 declare void @glTexCoord2dv(double*)
 declare void @glTexCoord2f(float, float)
 declare void @glTexCoord2fv(float*)
 declare void @glTexCoord2i(i32, i32)
 declare void @glTexCoord2iv(i32*)
 declare void @glTexCoord2s(i16 signext, i16 signext)
 declare void @glTexCoord2sv(i16*)
 declare void @glTexCoord3d(double, double, double)
 declare void @glTexCoord3dv(double*)
 declare void @glTexCoord3f(float, float, float)
 declare void @glTexCoord3fv(float*)
 declare void @glTexCoord3i(i32, i32, i32)
 declare void @glTexCoord3iv(i32*)
 declare void @glTexCoord3s(i16 signext, i16 signext, i16 signext)
 declare void @glTexCoord3sv(i16*)
 declare void @glTexCoord4d(double, double, double, double)
 declare void @glTexCoord4dv(double*)
 declare void @glTexCoord4f(float, float, float, float)
 declare void @glTexCoord4fv(float*)
 declare void @glTexCoord4i(i32, i32, i32, i32)
 declare void @glTexCoord4iv(i32*)
 declare void @glTexCoord4s(i16 signext, i16 signext, i16 signext, i16 signext)
 declare void @glTexCoord4sv(i16*)
 declare void @glTexCoordPointer(i32, i32, i32, i8*)
 declare void @glTexEnvf(i32, i32, float)
 declare void @glTexEnvfv(i32, i32, float*)
 declare void @glTexEnvi(i32, i32, i32)
 declare void @glTexEnviv(i32, i32, i32*)
 declare void @glTexGend(i32, i32, double)
 declare void @glTexGendv(i32, i32, double*)
 declare void @glTexGenf(i32, i32, float)
 declare void @glTexGenfv(i32, i32, float*)
 declare void @glTexGeni(i32, i32, i32)
 declare void @glTexGeniv(i32, i32, i32*)
 declare void @glTexImage1D(i32, i32, i32, i32, i32, i32, i32, i8*)
 declare void @glTexImage2D(i32, i32, i32, i32, i32, i32, i32, i32, i8*)
 declare void @glTexImage3D(i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*)
 declare void @glTexParameterf(i32, i32, float)
 declare void @glTexParameterfv(i32, i32, float*)
 declare void @glTexParameteri(i32, i32, i32)
 declare void @glTexParameteriv(i32, i32, i32*)
 declare void @glTexSubImage1D(i32, i32, i32, i32, i32, i32, i8*)
 declare void @glTexSubImage2D(i32, i32, i32, i32, i32, i32, i32, i32, i8*)
 declare void @glTexSubImage3D(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*)
 declare void @glTranslated(double, double, double)
 declare void @glTranslatef(float, float, float)
 declare void @glVertex2d(double, double)
 declare void @glVertex2dv(double*)
 declare void @glVertex2f(float, float)
 declare void @glVertex2fv(float*)
 declare void @glVertex2i(i32, i32)
 declare void @glVertex2iv(i32*)
 declare void @glVertex2s(i16 signext, i16 signext)
 declare void @glVertex2sv(i16*)
 declare void @glVertex3d(double, double, double)
 declare void @glVertex3dv(double*)
 declare void @glVertex3f(float, float, float)
 declare void @glVertex3fv(float*)
 declare void @glVertex3i(i32, i32, i32)
 declare void @glVertex3iv(i32*)
 declare void @glVertex3s(i16 signext, i16 signext, i16 signext)
 declare void @glVertex3sv(i16*)
 declare void @glVertex4d(double, double, double, double)
 declare void @glVertex4dv(double*)
 declare void @glVertex4f(float, float, float, float)
 declare void @glVertex4fv(float*)
 declare void @glVertex4i(i32, i32, i32, i32)
 declare void @glVertex4iv(i32*)
 declare void @glVertex4s(i16 signext, i16 signext, i16 signext, i16 signext)
 declare void @glVertex4sv(i16*)
 declare void @glVertexPointer(i32, i32, i32, i8*)
 declare void @glViewport(i32, i32, i32, i32)
 declare void @glSampleCoverage(float, i8 zeroext)
 declare void @glSamplePass(i32)
 declare void @glLoadTransposeMatrixf(float*)
 declare void @glLoadTransposeMatrixd(double*)
 declare void @glMultTransposeMatrixf(float*)
 declare void @glMultTransposeMatrixd(double*)
 declare void @glCompressedTexImage3D(i32, i32, i32, i32, i32, i32, i32, i32, i8*)
 declare void @glCompressedTexImage2D(i32, i32, i32, i32, i32, i32, i32, i8*)
 declare void @glCompressedTexImage1D(i32, i32, i32, i32, i32, i32, i8*)
 declare void @glCompressedTexSubImage3D(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*)
 declare void @glCompressedTexSubImage2D(i32, i32, i32, i32, i32, i32, i32, i32, i8*)
 declare void @glCompressedTexSubImage1D(i32, i32, i32, i32, i32, i32, i8*)
 declare void @glGetCompressedTexImage(i32, i32, i8*)
;; declare void @glActiveTexture(i32)
 declare void @glClientActiveTexture(i32)
 declare void @glMultiTexCoord1d(i32, double)
 declare void @glMultiTexCoord1dv(i32, double*)
 declare void @glMultiTexCoord1f(i32, float)
 declare void @glMultiTexCoord1fv(i32, float*)
 declare void @glMultiTexCoord1i(i32, i32)
 declare void @glMultiTexCoord1iv(i32, i32*)
 declare void @glMultiTexCoord1s(i32, i16 signext)
 declare void @glMultiTexCoord1sv(i32, i16*)
 declare void @glMultiTexCoord2d(i32, double, double)
 declare void @glMultiTexCoord2dv(i32, double*)
 declare void @glMultiTexCoord2f(i32, float, float)
 declare void @glMultiTexCoord2fv(i32, float*)
 declare void @glMultiTexCoord2i(i32, i32, i32)
 declare void @glMultiTexCoord2iv(i32, i32*)
 declare void @glMultiTexCoord2s(i32, i16 signext, i16 signext)
 declare void @glMultiTexCoord2sv(i32, i16*)
 declare void @glMultiTexCoord3d(i32, double, double, double)
 declare void @glMultiTexCoord3dv(i32, double*)
 declare void @glMultiTexCoord3f(i32, float, float, float)
 declare void @glMultiTexCoord3fv(i32, float*)
 declare void @glMultiTexCoord3i(i32, i32, i32, i32)
 declare void @glMultiTexCoord3iv(i32, i32*)
 declare void @glMultiTexCoord3s(i32, i16 signext, i16 signext, i16 signext)
 declare void @glMultiTexCoord3sv(i32, i16*)
 declare void @glMultiTexCoord4d(i32, double, double, double, double)
 declare void @glMultiTexCoord4dv(i32, double*)
 declare void @glMultiTexCoord4f(i32, float, float, float, float)
 declare void @glMultiTexCoord4fv(i32, float*)
 declare void @glMultiTexCoord4i(i32, i32, i32, i32, i32)
 declare void @glMultiTexCoord4iv(i32, i32*)
 declare void @glMultiTexCoord4s(i32, i16 signext, i16 signext, i16 signext, i16 signext)
 declare void @glMultiTexCoord4sv(i32, i16*)
 declare void @glFogCoordf(float)
 declare void @glFogCoordfv(float*)
 declare void @glFogCoordd(double)
 declare void @glFogCoorddv(double*)
 declare void @glFogCoordPointer(i32, i32, i8*)
 declare void @glSecondaryColor3b(i8 signext, i8 signext, i8 signext)
 declare void @glSecondaryColor3bv(i8*)
 declare void @glSecondaryColor3d(double, double, double)
 declare void @glSecondaryColor3dv(double*)
 declare void @glSecondaryColor3f(float, float, float)
 declare void @glSecondaryColor3fv(float*)
 declare void @glSecondaryColor3i(i32, i32, i32)
 declare void @glSecondaryColor3iv(i32*)
 declare void @glSecondaryColor3s(i16 signext, i16 signext, i16 signext)
 declare void @glSecondaryColor3sv(i16*)
 declare void @glSecondaryColor3ub(i8 zeroext, i8 zeroext, i8 zeroext)
 declare void @glSecondaryColor3ubv(i8*)
 declare void @glSecondaryColor3ui(i32, i32, i32)
 declare void @glSecondaryColor3uiv(i32*)
 declare void @glSecondaryColor3us(i16 zeroext, i16 zeroext, i16 zeroext)
 declare void @glSecondaryColor3usv(i16*)
 declare void @glSecondaryColorPointer(i32, i32, i32, i8*)
 declare void @glPointParameterf(i32, float)
 declare void @glPointParameterfv(i32, float*)
 declare void @glPointParameteri(i32, i32)
 declare void @glPointParameteriv(i32, i32*)
 declare void @glBlendFuncSeparate(i32, i32, i32, i32)
 declare void @glMultiDrawArrays(i32, i32*, i32*, i32)
 declare void @glMultiDrawElements(i32, i32*, i32, i8**, i32)
 declare void @glWindowPos2d(double, double)
 declare void @glWindowPos2dv(double*)
 declare void @glWindowPos2f(float, float)
 declare void @glWindowPos2fv(float*)
 declare void @glWindowPos2i(i32, i32)
 declare void @glWindowPos2iv(i32*)
 declare void @glWindowPos2s(i16 signext, i16 signext)
 declare void @glWindowPos2sv(i16*)
 declare void @glWindowPos3d(double, double, double)
 declare void @glWindowPos3dv(double*)
 declare void @glWindowPos3f(float, float, float)
 declare void @glWindowPos3fv(float*)
 declare void @glWindowPos3i(i32, i32, i32)
 declare void @glWindowPos3iv(i32*)
 declare void @glWindowPos3s(i16 signext, i16 signext, i16 signext)
 declare void @glWindowPos3sv(i16*)
 declare void @glGenQueries(i32, i32*)
 declare void @glDeleteQueries(i32, i32*)
 declare zeroext i8 @glIsQuery(i32)
 declare void @glBeginQuery(i32, i32)
 declare void @glEndQuery(i32)
 declare void @glGetQueryiv(i32, i32, i32*)
 declare void @glGetQueryObjectiv(i32, i32, i32*)
 declare void @glGetQueryObjectuiv(i32, i32, i32*)
;; declare void @glBindBuffer(i32, i32)
 declare void @glDeleteBuffers(i32, i32*)
;; declare void @glGenBuffers(i32, i32*)
 declare zeroext i8 @glIsBuffer(i32)
;; declare void @glBufferData(i32, i32, i8*, i32)
;; declare void @glBufferSubData(i32, i32, i32, i8*)
 declare void @glGetBufferSubData(i32, i32, i32, i8*)
 declare i8* @glMapBuffer(i32, i32)
 declare zeroext i8 @glUnmapBuffer(i32)
 declare void @glGetBufferParameteriv(i32, i32, i32*)
 declare void @glGetBufferPointerv(i32, i32, i8**)
 declare void @glDrawBuffers(i32, i32*)
 declare void @glBindVertexArray(i32)
 declare void @glDeleteVertexArrays(i32, i32*)
 declare void @glGenVertexArrays(i32, i32*)
 declare void @glVertexAttrib1d(i32, double)
 declare void @glVertexAttrib1dv(i32, double*)
 declare void @glVertexAttrib1f(i32, float)
 declare void @glVertexAttrib1fv(i32, float*)
 declare void @glVertexAttrib1s(i32, i16 signext)
 declare void @glVertexAttrib1sv(i32, i16*)
 declare void @glVertexAttrib2d(i32, double, double)
 declare void @glVertexAttrib2dv(i32, double*)
 declare void @glVertexAttrib2f(i32, float, float)
 declare void @glVertexAttrib2fv(i32, float*)
 declare void @glVertexAttrib2s(i32, i16 signext, i16 signext)
 declare void @glVertexAttrib2sv(i32, i16*)
 declare void @glVertexAttrib3d(i32, double, double, double)
 declare void @glVertexAttrib3dv(i32, double*)
 declare void @glVertexAttrib3f(i32, float, float, float)
 declare void @glVertexAttrib3fv(i32, float*)
 declare void @glVertexAttrib3s(i32, i16 signext, i16 signext, i16 signext)
 declare void @glVertexAttrib3sv(i32, i16*)
 declare void @glVertexAttrib4Nbv(i32, i8*)
 declare void @glVertexAttrib4Niv(i32, i32*)
 declare void @glVertexAttrib4Nsv(i32, i16*)
 declare void @glVertexAttrib4Nub(i32, i8 zeroext, i8 zeroext, i8 zeroext, i8 zeroext)
 declare void @glVertexAttrib4Nubv(i32, i8*)
 declare void @glVertexAttrib4Nuiv(i32, i32*)
 declare void @glVertexAttrib4Nusv(i32, i16*)
 declare void @glVertexAttrib4bv(i32, i8*)
 declare void @glVertexAttrib4d(i32, double, double, double, double)
 declare void @glVertexAttrib4dv(i32, double*)
 declare void @glVertexAttrib4f(i32, float, float, float, float)
 declare void @glVertexAttrib4fv(i32, float*)
 declare void @glVertexAttrib4iv(i32, i32*)
 declare void @glVertexAttrib4s(i32, i16 signext, i16 signext, i16 signext, i16 signext)
 declare void @glVertexAttrib4sv(i32, i16*)
 declare void @glVertexAttrib4ubv(i32, i8*)
 declare void @glVertexAttrib4uiv(i32, i32*)
 declare void @glVertexAttrib4usv(i32, i16*)
;; declare void @glVertexAttribPointer(i32, i32, i32, i8 zeroext, i32, i8*)
;; declare void @glEnableVertexAttribArray(i32)
;; declare void @glDisableVertexAttribArray(i32)
 declare void @glGetVertexAttribdv(i32, i32, double*)
 declare void @glGetVertexAttribfv(i32, i32, float*)
 declare void @glGetVertexAttribiv(i32, i32, i32*)
 declare void @glGetVertexAttribPointerv(i32, i32, i8**)
 declare void @glDeleteShader(i32)
 declare void @glDetachShader(i32, i32)
;; declare i32 @glCreateShader(i32)
;; declare void @glShaderSource(i32, i32, i8**, i32*)
;; declare void @glCompileShader(i32)
;; declare i32 @glCreateProgram()
;; declare void @glAttachShader(i32, i32)
;; declare void @glLinkProgram(i32)
;; declare void @glUseProgram(i32)
 declare void @glDeleteProgram(i32)
 declare void @glValidateProgram(i32)
;; declare void @glUniform1f(i32, float)
;; declare void @glUniform2f(i32, float, float)
;; declare void @glUniform3f(i32, float, float, float)
;; declare void @glUniform4f(i32, float, float, float, float)
;; declare void @glUniform1i(i32, i32)
 declare void @glUniform2i(i32, i32, i32)
 declare void @glUniform3i(i32, i32, i32, i32)
 declare void @glUniform4i(i32, i32, i32, i32, i32)
;; declare void @glUniform1fv(i32, i32, float*)
;; declare void @glUniform2fv(i32, i32, float*)
;; declare void @glUniform3fv(i32, i32, float*)
;; declare void @glUniform4fv(i32, i32, float*)
 declare void @glUniform1iv(i32, i32, i32*)
 declare void @glUniform2iv(i32, i32, i32*)
 declare void @glUniform3iv(i32, i32, i32*)
 declare void @glUniform4iv(i32, i32, i32*)
 declare void @glUniformMatrix2fv(i32, i32, i8 zeroext, float*)
;; declare void @glUniformMatrix3fv(i32, i32, i8 zeroext, float*)
;; declare void @glUniformMatrix4fv(i32, i32, i8 zeroext, float*)
 declare zeroext i8 @glIsShader(i32)
 declare zeroext i8 @glIsProgram(i32)
;;  declare void @glGetShaderiv(i32, i32, i32*)
;; declare void @glGetProgramiv(i32, i32, i32*)
 declare void @glGetAttachedShaders(i32, i32, i32*, i32*)
;; declare void @glGetShaderInfoLog(i32, i32, i32*, i8*)
;; declare void @glGetProgramInfoLog(i32, i32, i32*, i8*)
;; declare i32 @glGetUniformLocation(i32, i8*)
 declare void @glGetActiveUniform(i32, i32, i32, i32*, i32*, i32*, i8*)
 declare void @glGetUniformfv(i32, i32, float*)
 declare void @glGetUniformiv(i32, i32, i32*)
 declare void @glGetShaderSource(i32, i32, i32*, i8*)
;; declare void @glBindAttribLocation(i32, i32, i8*)
 declare void @glGetActiveAttrib(i32, i32, i32, i32*, i32*, i32*, i8*)
;; declare i32 @glGetAttribLocation(i32, i8*)
 declare void @glStencilFuncSeparate(i32, i32, i32, i32)
 declare void @glStencilOpSeparate(i32, i32, i32, i32)
 declare void @glStencilMaskSeparate(i32, i32)
 declare void @glUniformMatrix2x3fv(i32, i32, i8 zeroext, float*)
 declare void @glUniformMatrix3x2fv(i32, i32, i8 zeroext, float*)
 declare void @glUniformMatrix2x4fv(i32, i32, i8 zeroext, float*)
 declare void @glUniformMatrix4x2fv(i32, i32, i8 zeroext, float*)
 declare void @glUniformMatrix3x4fv(i32, i32, i8 zeroext, float*)
 declare void @glUniformMatrix4x3fv(i32, i32, i8 zeroext, float*)

@GL_VERSION_1_1 = global i32 1
@GL_VERSION_1_3 = global i32 1
@GL_VERSION_1_5 = global i32 1
@GL_VERSION_2_1 = global i32 1
@GL_ACCUM = global i32 256
@GL_RETURN = global i32 258
@GL_ADD = global i32 260
@GL_NEVER = global i32 512
@GL_EQUAL = global i32 514
@GL_GREATER = global i32 516
@GL_GEQUAL = global i32 518
@GL_CURRENT_BIT = global i32 1
@GL_LINE_BIT = global i32 4
@GL_POLYGON_STIPPLE_BIT = global i32 16
@GL_LIGHTING_BIT = global i32 64
@GL_DEPTH_BUFFER_BIT = global i32 256
@GL_STENCIL_BUFFER_BIT = global i32 1024
@GL_TRANSFORM_BIT = global i32 4096
@GL_COLOR_BUFFER_BIT = global i32 16384
@GL_EVAL_BIT = global i32 65536
@GL_TEXTURE_BIT = global i32 262144
@GL_ALL_ATTRIB_BITS = global i32 1048575
@GL_POINTS = global i32 0
@GL_LINES = global i32 1
@GL_LINE_LOOP = global i32 2
@GL_LINE_STRIP = global i32 3
@GL_TRIANGLES = global i32 4
@GL_TRIANGLE_STRIP = global i32 5
@GL_TRIANGLE_FAN = global i32 6
@GL_QUADS = global i32 7
@GL_QUAD_STRIP = global i32 8
@GL_POLYGON = global i32 9
@GL_ZERO = global i32 0
@GL_ONE = global i32 1
@GL_SRC_COLOR = global i32 768
@GL_SRC_ALPHA = global i32 770
@GL_DST_ALPHA = global i32 772
@GL_DST_COLOR = global i32 774
@GL_SRC_ALPHA_SATURATE = global i32 776
@GL_FALSE = global i8 0
@GL_TRUE = global i8 1
@GL_CLIP_PLANE0 = global i32 12288
@GL_CLIP_PLANE2 = global i32 12290
@GL_CLIP_PLANE4 = global i32 12292
@GL_BYTE = global i32 5120
@GL_SHORT = global i32 5122
@GL_INT = global i32 5124
@GL_FLOAT = global i32 5126
@GL_3_BYTES = global i32 5128
@GL_DOUBLE = global i32 5130
@GL_NONE = global i32 0
@GL_FRONT_RIGHT = global i32 1025
@GL_BACK_RIGHT = global i32 1027
@GL_FRONT = global i32 1028
@GL_BACK = global i32 1029
@GL_RIGHT = global i32 1031
@GL_AUX0 = global i32 1033
@GL_AUX2 = global i32 1035
@GL_NO_ERROR = global i32 0
@GL_INVALID_ENUM = global i32 1280
@GL_INVALID_VALUE = global i32 1281
@GL_INVALID_OPERATION = global i32 1282
@GL_STACK_OVERFLOW = global i32 1283
@GL_STACK_UNDERFLOW = global i32 1284
@GL_OUT_OF_MEMORY = global i32 1285
@GL_INVALID_FRAMEBUFFER_OPERATION = global i32 1286
@GL_TABLE_TOO_LARGE = global i32 32816
@GL_2D = global i32 1536
@GL_3D_COLOR = global i32 1538
@GL_4D_COLOR_TEXTURE = global i32 1540
@GL_PASS_THROUGH_TOKEN = global i32 1792
@GL_LINE_TOKEN = global i32 1794
@GL_BITMAP_TOKEN = global i32 1796
@GL_COPY_PIXEL_TOKEN = global i32 1798
@GL_EXP = global i32 2048
@GL_CW = global i32 2304
@GL_COEFF = global i32 2560
@GL_DOMAIN = global i32 2562
@GL_CURRENT_COLOR = global i32 2816
@GL_CURRENT_NORMAL = global i32 2818
@GL_CURRENT_RASTER_COLOR = global i32 2820
@GL_CURRENT_RASTER_TEXTURE_COORDS = global i32 2822
@GL_CURRENT_RASTER_POSITION_VALID = global i32 2824
@GL_POINT_SMOOTH = global i32 2832
@GL_PROGRAM_POINT_SIZE = global i32 34370
@GL_POINT_SIZE_RANGE = global i32 2834
@GL_LINE_SMOOTH = global i32 2848
@GL_LINE_WIDTH_RANGE = global i32 2850
@GL_LINE_STIPPLE = global i32 2852
@GL_LINE_STIPPLE_REPEAT = global i32 2854
@GL_LIST_MODE = global i32 2864
@GL_LIST_BASE = global i32 2866
@GL_POLYGON_MODE = global i32 2880
@GL_POLYGON_STIPPLE = global i32 2882
@GL_CULL_FACE = global i32 2884
@GL_FRONT_FACE = global i32 2886
@GL_LIGHT_MODEL_LOCAL_VIEWER = global i32 2897
@GL_LIGHT_MODEL_AMBIENT = global i32 2899
@GL_COLOR_MATERIAL_FACE = global i32 2901
@GL_COLOR_MATERIAL = global i32 2903
@GL_FOG_INDEX = global i32 2913
@GL_FOG_START = global i32 2915
@GL_FOG_MODE = global i32 2917
@GL_DEPTH_RANGE = global i32 2928
@GL_DEPTH_WRITEMASK = global i32 2930
@GL_DEPTH_FUNC = global i32 2932
@GL_STENCIL_TEST = global i32 2960
@GL_STENCIL_FUNC = global i32 2962
@GL_STENCIL_FAIL = global i32 2964
@GL_STENCIL_PASS_DEPTH_PASS = global i32 2966
@GL_STENCIL_WRITEMASK = global i32 2968
@GL_NORMALIZE = global i32 2977
@GL_MODELVIEW_STACK_DEPTH = global i32 2979
@GL_TEXTURE_STACK_DEPTH = global i32 2981
@GL_PROJECTION_MATRIX = global i32 2983
@GL_ATTRIB_STACK_DEPTH = global i32 2992
@GL_ALPHA_TEST = global i32 3008
@GL_ALPHA_TEST_REF = global i32 3010
@GL_BLEND_DST = global i32 3040
@GL_BLEND = global i32 3042
@GL_INDEX_LOGIC_OP = global i32 3057
@GL_AUX_BUFFERS = global i32 3072
@GL_READ_BUFFER = global i32 3074
@GL_SCISSOR_TEST = global i32 3089
@GL_INDEX_WRITEMASK = global i32 3105
@GL_COLOR_WRITEMASK = global i32 3107
@GL_RGBA_MODE = global i32 3121
@GL_STEREO = global i32 3123
@GL_PERSPECTIVE_CORRECTION_HINT = global i32 3152
@GL_LINE_SMOOTH_HINT = global i32 3154
@GL_FOG_HINT = global i32 3156
@GL_TEXTURE_GEN_T = global i32 3169
@GL_TEXTURE_GEN_Q = global i32 3171
@GL_PIXEL_MAP_S_TO_S = global i32 3185
@GL_PIXEL_MAP_I_TO_G = global i32 3187
@GL_PIXEL_MAP_I_TO_A = global i32 3189
@GL_PIXEL_MAP_G_TO_G = global i32 3191
@GL_PIXEL_MAP_A_TO_A = global i32 3193
@GL_PIXEL_MAP_S_TO_S_SIZE = global i32 3249
@GL_PIXEL_MAP_I_TO_G_SIZE = global i32 3251
@GL_PIXEL_MAP_I_TO_A_SIZE = global i32 3253
@GL_PIXEL_MAP_G_TO_G_SIZE = global i32 3255
@GL_PIXEL_MAP_A_TO_A_SIZE = global i32 3257
@GL_UNPACK_LSB_FIRST = global i32 3313
@GL_UNPACK_SKIP_ROWS = global i32 3315
@GL_UNPACK_ALIGNMENT = global i32 3317
@GL_PACK_LSB_FIRST = global i32 3329
@GL_PACK_SKIP_ROWS = global i32 3331
@GL_PACK_ALIGNMENT = global i32 3333
@GL_MAP_STENCIL = global i32 3345
@GL_INDEX_OFFSET = global i32 3347
@GL_RED_BIAS = global i32 3349
@GL_ZOOM_Y = global i32 3351
@GL_GREEN_BIAS = global i32 3353
@GL_BLUE_BIAS = global i32 3355
@GL_ALPHA_BIAS = global i32 3357
@GL_DEPTH_BIAS = global i32 3359
@GL_MAX_LIGHTS = global i32 3377
@GL_MAX_TEXTURE_SIZE = global i32 3379
@GL_MAX_ATTRIB_STACK_DEPTH = global i32 3381
@GL_MAX_NAME_STACK_DEPTH = global i32 3383
@GL_MAX_TEXTURE_STACK_DEPTH = global i32 3385
@GL_MAX_CLIENT_ATTRIB_STACK_DEPTH = global i32 3387
@GL_INDEX_BITS = global i32 3409
@GL_GREEN_BITS = global i32 3411
@GL_ALPHA_BITS = global i32 3413
@GL_STENCIL_BITS = global i32 3415
@GL_ACCUM_GREEN_BITS = global i32 3417
@GL_ACCUM_ALPHA_BITS = global i32 3419
@GL_AUTO_NORMAL = global i32 3456
@GL_MAP1_INDEX = global i32 3473
@GL_MAP1_TEXTURE_COORD_1 = global i32 3475
@GL_MAP1_TEXTURE_COORD_3 = global i32 3477
@GL_MAP1_VERTEX_3 = global i32 3479
@GL_MAP2_COLOR_4 = global i32 3504
@GL_MAP2_NORMAL = global i32 3506
@GL_MAP2_TEXTURE_COORD_2 = global i32 3508
@GL_MAP2_TEXTURE_COORD_4 = global i32 3510
@GL_MAP2_VERTEX_4 = global i32 3512
@GL_MAP1_GRID_SEGMENTS = global i32 3537
@GL_MAP2_GRID_SEGMENTS = global i32 3539
@GL_TEXTURE_2D = global i32 3553
@GL_FEEDBACK_BUFFER_SIZE = global i32 3569
@GL_SELECTION_BUFFER_POINTER = global i32 3571
@GL_TEXTURE_WIDTH = global i32 4096
@GL_TEXTURE_INTERNAL_FORMAT = global i32 4099
@GL_TEXTURE_BORDER = global i32 4101
@GL_DONT_CARE = global i32 4352
@GL_NICEST = global i32 4354
@GL_LIGHT0 = global i32 16384
@GL_LIGHT1 = global i32 16385
@GL_LIGHT2 = global i32 16386
@GL_LIGHT3 = global i32 16387
@GL_LIGHT4 = global i32 16388
@GL_LIGHT5 = global i32 16389
@GL_LIGHT6 = global i32 16390
@GL_AMBIENT = global i32 4608
@GL_SPECULAR = global i32 4610
@GL_SPOT_DIRECTION = global i32 4612
@GL_SPOT_CUTOFF = global i32 4614
@GL_LINEAR_ATTENUATION = global i32 4616
@GL_COMPILE = global i32 4864
@GL_CLEAR = global i32 5376
@GL_AND_REVERSE = global i32 5378
@GL_AND_INVERTED = global i32 5380
@GL_XOR = global i32 5382
@GL_NOR = global i32 5384
@GL_INVERT = global i32 5386
@GL_COPY_INVERTED = global i32 5388
@GL_NAND = global i32 5390
@GL_EMISSION = global i32 5632
@GL_AMBIENT_AND_DIFFUSE = global i32 5634
@GL_MODELVIEW = global i32 5888
@GL_TEXTURE = global i32 5890
@GL_COLOR = global i32 6144
@GL_STENCIL = global i32 6146
@GL_COLOR_INDEX = global i32 6400
@GL_DEPTH_COMPONENT = global i32 6402
@GL_GREEN = global i32 6404
@GL_ALPHA = global i32 6406
@GL_RGBA = global i32 6408
@GL_LUMINANCE_ALPHA = global i32 6410
@GL_BITMAP = global i32 6656
@GL_POINT = global i32 6912
@GL_FILL = global i32 6914
@GL_RENDER = global i32 7168
@GL_SELECT = global i32 7170
@GL_FLAT = global i32 7424
@GL_KEEP = global i32 7680
@GL_INCR = global i32 7682
@GL_VENDOR = global i32 7936
@GL_VERSION = global i32 7938
@GL_S = global i32 8192
@GL_R = global i32 8194
@GL_MODULATE = global i32 8448
@GL_TEXTURE_ENV_MODE = global i32 8704
@GL_TEXTURE_ENV = global i32 8960
@GL_EYE_LINEAR = global i32 9216
@GL_SPHERE_MAP = global i32 9218
@GL_TEXTURE_GEN_MODE = global i32 9472
@GL_EYE_PLANE = global i32 9474
@GL_NEAREST = global i32 9728
@GL_NEAREST_MIPMAP_NEAREST = global i32 9984
@GL_NEAREST_MIPMAP_LINEAR = global i32 9986
@GL_TEXTURE_MAG_FILTER = global i32 10240
@GL_TEXTURE_WRAP_S = global i32 10242
@GL_CLAMP = global i32 10496
@GL_CLIENT_PIXEL_STORE_BIT = global i32 1
@GL_CLIENT_ALL_ATTRIB_BITS = global i32 4294967295
@GL_POLYGON_OFFSET_FACTOR = global i32 32824
@GL_POLYGON_OFFSET_POINT = global i32 10753
@GL_POLYGON_OFFSET_FILL = global i32 32823
@GL_ALPHA4 = global i32 32827
@GL_ALPHA12 = global i32 32829
@GL_LUMINANCE4 = global i32 32831
@GL_LUMINANCE12 = global i32 32833
@GL_LUMINANCE4_ALPHA4 = global i32 32835
@GL_LUMINANCE8_ALPHA8 = global i32 32837
@GL_LUMINANCE12_ALPHA12 = global i32 32839
@GL_INTENSITY = global i32 32841
@GL_INTENSITY8 = global i32 32843
@GL_INTENSITY16 = global i32 32845
@GL_RGB4 = global i32 32847
@GL_RGB8 = global i32 32849
@GL_RGB12 = global i32 32851
@GL_RGBA2 = global i32 32853
@GL_RGB5_A1 = global i32 32855
@GL_RGB10_A2 = global i32 32857
@GL_RGBA16 = global i32 32859
@GL_TEXTURE_GREEN_SIZE = global i32 32861
@GL_TEXTURE_ALPHA_SIZE = global i32 32863
@GL_TEXTURE_INTENSITY_SIZE = global i32 32865
@GL_PROXY_TEXTURE_2D = global i32 32868
@GL_TEXTURE_PRIORITY = global i32 32870
@GL_TEXTURE_BINDING_1D = global i32 32872
@GL_TEXTURE_BINDING_3D = global i32 32874
@GL_VERTEX_ARRAY = global i32 32884
@GL_COLOR_ARRAY = global i32 32886
@GL_TEXTURE_COORD_ARRAY = global i32 32888
@GL_VERTEX_ARRAY_SIZE = global i32 32890
@GL_VERTEX_ARRAY_STRIDE = global i32 32892
@GL_NORMAL_ARRAY_STRIDE = global i32 32895
@GL_COLOR_ARRAY_TYPE = global i32 32898
@GL_INDEX_ARRAY_TYPE = global i32 32901
@GL_TEXTURE_COORD_ARRAY_SIZE = global i32 32904
@GL_TEXTURE_COORD_ARRAY_STRIDE = global i32 32906
@GL_VERTEX_ARRAY_POINTER = global i32 32910
@GL_COLOR_ARRAY_POINTER = global i32 32912
@GL_TEXTURE_COORD_ARRAY_POINTER = global i32 32914
@GL_V2F = global i32 10784
@GL_C4UB_V2F = global i32 10786
@GL_C3F_V3F = global i32 10788
@GL_C4F_N3F_V3F = global i32 10790
@GL_T4F_V4F = global i32 10792
@GL_T2F_C3F_V3F = global i32 10794
@GL_T2F_C4F_N3F_V3F = global i32 10796
@GL_BGR = global i32 32992
@GL_CONSTANT_COLOR = global i32 32769
@GL_CONSTANT_ALPHA = global i32 32771
@GL_BLEND_COLOR = global i32 32773
@GL_FUNC_ADD = global i32 32774
@GL_MAX = global i32 32776
@GL_BLEND_EQUATION_RGB = global i32 32777
@GL_FUNC_SUBTRACT = global i32 32778
@GL_COLOR_MATRIX = global i32 32945
@GL_MAX_COLOR_MATRIX_STACK_DEPTH = global i32 32947
@GL_POST_COLOR_MATRIX_GREEN_SCALE = global i32 32949
@GL_POST_COLOR_MATRIX_ALPHA_SCALE = global i32 32951
@GL_POST_COLOR_MATRIX_GREEN_BIAS = global i32 32953
@GL_POST_COLOR_MATRIX_ALPHA_BIAS = global i32 32955
@GL_COLOR_TABLE = global i32 32976
@GL_POST_COLOR_MATRIX_COLOR_TABLE = global i32 32978
@GL_PROXY_POST_CONVOLUTION_COLOR_TABLE = global i32 32980
@GL_COLOR_TABLE_SCALE = global i32 32982
@GL_COLOR_TABLE_FORMAT = global i32 32984
@GL_COLOR_TABLE_RED_SIZE = global i32 32986
@GL_COLOR_TABLE_BLUE_SIZE = global i32 32988
@GL_COLOR_TABLE_LUMINANCE_SIZE = global i32 32990
@GL_CONVOLUTION_1D = global i32 32784
@GL_SEPARABLE_2D = global i32 32786
@GL_CONVOLUTION_FILTER_SCALE = global i32 32788
@GL_REDUCE = global i32 32790
@GL_CONVOLUTION_WIDTH = global i32 32792
@GL_MAX_CONVOLUTION_WIDTH = global i32 32794
@GL_POST_CONVOLUTION_RED_SCALE = global i32 32796
@GL_POST_CONVOLUTION_BLUE_SCALE = global i32 32798
@GL_POST_CONVOLUTION_RED_BIAS = global i32 32800
@GL_POST_CONVOLUTION_BLUE_BIAS = global i32 32802
@GL_CONSTANT_BORDER = global i32 33105
@GL_CONVOLUTION_BORDER_COLOR = global i32 33108
@GL_MAX_ELEMENTS_VERTICES = global i32 33000
@GL_HISTOGRAM = global i32 32804
@GL_HISTOGRAM_WIDTH = global i32 32806
@GL_HISTOGRAM_RED_SIZE = global i32 32808
@GL_HISTOGRAM_BLUE_SIZE = global i32 32810
@GL_HISTOGRAM_LUMINANCE_SIZE = global i32 32812
@GL_MINMAX = global i32 32814
@GL_MINMAX_SINK = global i32 32816
@GL_UNSIGNED_BYTE_3_3_2 = global i32 32818
@GL_UNSIGNED_SHORT_5_5_5_1 = global i32 32820
@GL_UNSIGNED_INT_10_10_10_2 = global i32 32822
@GL_UNSIGNED_SHORT_5_6_5 = global i32 33635
@GL_UNSIGNED_SHORT_4_4_4_4_REV = global i32 33637
@GL_UNSIGNED_INT_8_8_8_8_REV = global i32 33639
@GL_RESCALE_NORMAL = global i32 32826
@GL_LIGHT_MODEL_COLOR_CONTROL = global i32 33272
@GL_SEPARATE_SPECULAR_COLOR = global i32 33274
@GL_PACK_SKIP_IMAGES = global i32 32875
@GL_UNPACK_SKIP_IMAGES = global i32 32877
@GL_TEXTURE_3D = global i32 32879
@GL_TEXTURE_DEPTH = global i32 32881
@GL_MAX_3D_TEXTURE_SIZE = global i32 32883
@GL_CLAMP_TO_EDGE = global i32 33071
@GL_TEXTURE_MIN_LOD = global i32 33082
@GL_TEXTURE_BASE_LEVEL = global i32 33084
@GL_SMOOTH_POINT_SIZE_RANGE = global i32 2834
@GL_SMOOTH_LINE_WIDTH_RANGE = global i32 2850
@GL_ALIASED_POINT_SIZE_RANGE = global i32 33901
@GL_TEXTURE0 = global i32 33984
@GL_TEXTURE1 = global i32 33985
@GL_TEXTURE2 = global i32 33986
@GL_TEXTURE3 = global i32 33987
@GL_TEXTURE4 = global i32 33988
@GL_TEXTURE5 = global i32 33989
@GL_TEXTURE6 = global i32 33990
@GL_TEXTURE7 = global i32 33991
@GL_TEXTURE8 = global i32 33992
@GL_TEXTURE9 = global i32 33993
@GL_TEXTURE10 = global i32 33994
@GL_TEXTURE11 = global i32 33995
@GL_TEXTURE12 = global i32 33996
@GL_TEXTURE13 = global i32 33997
@GL_TEXTURE14 = global i32 33998
@GL_TEXTURE15 = global i32 33999
@GL_TEXTURE16 = global i32 34000
@GL_TEXTURE17 = global i32 34001
@GL_TEXTURE18 = global i32 34002
@GL_TEXTURE19 = global i32 34003
@GL_TEXTURE20 = global i32 34004
@GL_TEXTURE21 = global i32 34005
@GL_TEXTURE22 = global i32 34006
@GL_TEXTURE23 = global i32 34007
@GL_TEXTURE24 = global i32 34008
@GL_TEXTURE25 = global i32 34009
@GL_TEXTURE26 = global i32 34010
@GL_TEXTURE27 = global i32 34011
@GL_TEXTURE28 = global i32 34012
@GL_TEXTURE29 = global i32 34013
@GL_TEXTURE30 = global i32 34014
@GL_ACTIVE_TEXTURE = global i32 34016
@GL_MAX_TEXTURE_UNITS = global i32 34018
@GL_COMBINE = global i32 34160
@GL_COMBINE_ALPHA = global i32 34162
@GL_ADD_SIGNED = global i32 34164
@GL_CONSTANT = global i32 34166
@GL_PREVIOUS = global i32 34168
@GL_SRC0_RGB = global i32 34176
@GL_SRC2_RGB = global i32 34178
@GL_SRC4_RGB = global i32 34180
@GL_SRC6_RGB = global i32 34182
@GL_SRC0_ALPHA = global i32 34184
@GL_SRC2_ALPHA = global i32 34186
@GL_SRC4_ALPHA = global i32 34188
@GL_SRC6_ALPHA = global i32 34190
@GL_SOURCE0_RGB = global i32 34176
@GL_SOURCE2_RGB = global i32 34178
@GL_SOURCE4_RGB = global i32 34180
@GL_SOURCE6_RGB = global i32 34182
@GL_SOURCE0_ALPHA = global i32 34184
@GL_SOURCE2_ALPHA = global i32 34186
@GL_SOURCE4_ALPHA = global i32 34188
@GL_SOURCE6_ALPHA = global i32 34190
@GL_OPERAND0_RGB = global i32 34192
@GL_OPERAND2_RGB = global i32 34194
@GL_OPERAND4_RGB = global i32 34196
@GL_OPERAND6_RGB = global i32 34198
@GL_OPERAND0_ALPHA = global i32 34200
@GL_OPERAND2_ALPHA = global i32 34202
@GL_OPERAND4_ALPHA = global i32 34204
@GL_OPERAND6_ALPHA = global i32 34206
@GL_DOT3_RGB = global i32 34478
@GL_TRANSPOSE_MODELVIEW_MATRIX = global i32 34019
@GL_TRANSPOSE_TEXTURE_MATRIX = global i32 34021
@GL_NORMAL_MAP = global i32 34065
@GL_TEXTURE_CUBE_MAP = global i32 34067
@GL_TEXTURE_CUBE_MAP_POSITIVE_X = global i32 34069
@GL_TEXTURE_CUBE_MAP_POSITIVE_Y = global i32 34071
@GL_TEXTURE_CUBE_MAP_POSITIVE_Z = global i32 34073
@GL_PROXY_TEXTURE_CUBE_MAP = global i32 34075
@GL_COMPRESSED_ALPHA = global i32 34025
@GL_COMPRESSED_LUMINANCE_ALPHA = global i32 34027
@GL_COMPRESSED_RGB = global i32 34029
@GL_TEXTURE_COMPRESSION_HINT = global i32 34031
@GL_TEXTURE_COMPRESSED = global i32 34465
@GL_COMPRESSED_TEXTURE_FORMATS = global i32 34467
@GL_MULTISAMPLE = global i32 32925
@GL_SAMPLE_ALPHA_TO_ONE = global i32 32927
@GL_SAMPLE_BUFFERS = global i32 32936
@GL_SAMPLE_COVERAGE_VALUE = global i32 32938
@GL_MULTISAMPLE_BIT = global i32 536870912
@GL_DEPTH_COMPONENT16 = global i32 33189
@GL_DEPTH_COMPONENT32 = global i32 33191
@GL_DEPTH_TEXTURE_MODE = global i32 34891
@GL_TEXTURE_COMPARE_MODE = global i32 34892
@GL_COMPARE_R_TO_TEXTURE = global i32 34894
@GL_QUERY_COUNTER_BITS = global i32 34916
@GL_QUERY_RESULT = global i32 34918
@GL_SAMPLES_PASSED = global i32 35092
@GL_FOG_COORD_SRC = global i32 33872
@GL_FRAGMENT_DEPTH = global i32 33874
@GL_FOG_COORD_ARRAY_TYPE = global i32 33876
@GL_FOG_COORD_ARRAY_POINTER = global i32 33878
@GL_FOG_COORDINATE_SOURCE = global i32 33872
@GL_CURRENT_FOG_COORDINATE = global i32 33875
@GL_FOG_COORDINATE_ARRAY_TYPE = global i32 33876
@GL_FOG_COORDINATE_ARRAY_STRIDE = global i32 33877
@GL_FOG_COORDINATE_ARRAY = global i32 33879
@GL_COLOR_SUM = global i32 33880
@GL_SECONDARY_COLOR_ARRAY_SIZE = global i32 33882
@GL_SECONDARY_COLOR_ARRAY_STRIDE = global i32 33884
@GL_SECONDARY_COLOR_ARRAY = global i32 33886
@GL_POINT_SIZE_MIN = global i32 33062
@GL_POINT_FADE_THRESHOLD_SIZE = global i32 33064
@GL_BLEND_DST_RGB = global i32 32968
@GL_BLEND_DST_ALPHA = global i32 32970
@GL_GENERATE_MIPMAP = global i32 33169
@GL_INCR_WRAP = global i32 34055
@GL_MIRRORED_REPEAT = global i32 33648
@GL_MAX_TEXTURE_LOD_BIAS = global i32 34045
@GL_TEXTURE_LOD_BIAS = global i32 34049
@GL_ARRAY_BUFFER = global i32 34962
@GL_ARRAY_BUFFER_BINDING = global i32 34964
@GL_VERTEX_ARRAY_BUFFER_BINDING = global i32 34966
@GL_COLOR_ARRAY_BUFFER_BINDING = global i32 34968
@GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING = global i32 34970
@GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING = global i32 34972
@GL_WEIGHT_ARRAY_BUFFER_BINDING = global i32 34974
@GL_STREAM_DRAW = global i32 35040
@GL_STREAM_COPY = global i32 35042
@GL_STATIC_DRAW = global i32 35044
@GL_STATIC_READ = global i32 35045
@GL_DYNAMIC_DRAW = global i32 35048
@GL_DYNAMIC_COPY = global i32 35050
@GL_WRITE_ONLY = global i32 35001
@GL_BUFFER_SIZE = global i32 34660
@GL_BUFFER_ACCESS = global i32 35003
@GL_BUFFER_MAP_POINTER = global i32 35005
@GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING = global i32 34973
@GL_CURRENT_PROGRAM = global i32 35725
@GL_DELETE_STATUS = global i32 35712
@GL_LINK_STATUS = global i32 35714
@GL_INFO_LOG_LENGTH = global i32 35716
@GL_ACTIVE_UNIFORMS = global i32 35718
@GL_SHADER_SOURCE_LENGTH = global i32 35720
@GL_FLOAT_VEC3 = global i32 35665
@GL_INT_VEC2 = global i32 35667
@GL_INT_VEC4 = global i32 35669
@GL_BOOL_VEC2 = global i32 35671
@GL_BOOL_VEC4 = global i32 35673
@GL_FLOAT_MAT3 = global i32 35675
@GL_SAMPLER_1D = global i32 35677
@GL_SAMPLER_3D = global i32 35679
@GL_SAMPLER_1D_SHADOW = global i32 35681
@GL_SHADING_LANGUAGE_VERSION = global i32 35724
@GL_MAX_VERTEX_UNIFORM_COMPONENTS = global i32 35658
@GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = global i32 35660
@GL_ACTIVE_ATTRIBUTES = global i32 35721
@GL_FRAGMENT_SHADER = global i32 35632
@GL_VERTEX_SHADER = global i32 35633
@GL_GEOMETRY_SHADER = global i32 36313
@GL_FRAGMENT_SHADER_DERIVATIVE_HINT = global i32 35723
@GL_VERTEX_ATTRIB_ARRAY_ENABLED = global i32 34338
@GL_VERTEX_ATTRIB_ARRAY_STRIDE = global i32 34340
@GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = global i32 34922
@GL_VERTEX_ATTRIB_ARRAY_POINTER = global i32 34373
@GL_VERTEX_PROGRAM_TWO_SIDE = global i32 34371
@GL_MAX_TEXTURE_IMAGE_UNITS = global i32 34930
@GL_DRAW_BUFFER0 = global i32 34853
@GL_DRAW_BUFFER2 = global i32 34855
@GL_DRAW_BUFFER4 = global i32 34857
@GL_DRAW_BUFFER6 = global i32 34859
@GL_DRAW_BUFFER8 = global i32 34861
@GL_DRAW_BUFFER10 = global i32 34863
@GL_DRAW_BUFFER12 = global i32 34865
@GL_DRAW_BUFFER14 = global i32 34867
@GL_POINT_SPRITE = global i32 34913
@GL_POINT_SPRITE_COORD_ORIGIN = global i32 36000
@GL_UPPER_LEFT = global i32 36002
@GL_STENCIL_BACK_VALUE_MASK = global i32 36004
@GL_STENCIL_BACK_FAIL = global i32 34817
@GL_STENCIL_BACK_PASS_DEPTH_PASS = global i32 34819
@GL_CURRENT_RASTER_SECONDARY_COLOR = global i32 33887
@GL_PIXEL_UNPACK_BUFFER = global i32 35052
@GL_PIXEL_UNPACK_BUFFER_BINDING = global i32 35055
@GL_FLOAT_MAT2x4 = global i32 35686
@GL_FLOAT_MAT3x4 = global i32 35688
@GL_FLOAT_MAT4x3 = global i32 35690
@GL_SRGB8 = global i32 35905
@GL_SRGB8_ALPHA8 = global i32 35907
@GL_SLUMINANCE8_ALPHA8 = global i32 35909
@GL_SLUMINANCE8 = global i32 35911
@GL_COMPRESSED_SRGB_ALPHA = global i32 35913
@GL_COMPRESSED_SLUMINANCE_ALPHA = global i32 35915

;; added stuff
@GL_DEPTH_TEST = global i32 2929
@GL_LIGHTING = global i32 2896
@GL_POSITION = global i32 4611
@GL_DIFFUSE = global i32 4609
@GL_PROJECTION = global i32 5889
@GL_SHININESS = global i32 5633
@GL_UNPACK_ROW_LENGTH = global i32 3314
@GL_TEXTURE_MIN_FILTER = global i32 10241
@GL_TEXTURE_WRAP_T = global i32 10243
@GL_REPEAT = global i32 10497
@GL_RGB = global i32 6407
@GL_UNSIGNED_BYTE = global i32 5121
@GL_REPLACE = global i32 7681
@GL_LINEAR = global i32 9729
@GL_TEXTURE_RECTANGLE_ARB = global i32 34037
@GL_RGB16 = global i32 32852
@GL_TEXTURE_HEIGHT = global i32 4097

@GL_FRONT_AND_BACK = global i32 1032
@GL_LINE = global i32 6913
@GL_LIGHT_MODEL_TWO_SIDE = global i32 2898
@GL_SMOOTH = global i32 7425


;; glu
;declare void @gluBeginCurve(i8*)
;declare void @gluBeginPolygon(i8*)
;declare void @gluBeginSurface(i8*)
;declare void @gluBeginTrim(i8*)
;declare i32 @gluBuild1DMipmapLevels(i32, i32, i32, i32, i32, i32, i32, i32, i8*)
;declare i32 @gluBuild1DMipmaps(i32, i32, i32, i32, i32, i8*)
;declare i32 @gluBuild2DMipmapLevels(i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*)
;declare i32 @gluBuild2DMipmaps(i32, i32, i32, i32, i32, i32, i8*)
;declare i32 @gluBuild3DMipmapLevels(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*)
;declare i32 @gluBuild3DMipmaps(i32, i32, i32, i32, i32, i32, i32, i8*)
;declare zeroext i8 @gluCheckExtension(i8*, i8*)
;declare void @gluCylinder(i8*, double, double, double, i32, i32)
;declare void @gluDeleteNurbsRenderer(i8*)
;declare void @gluDeleteQuadric(i8*)
;declare void @gluDeleteTess(i8*)
;declare void @gluDisk(i8*, double, double, i32, i32)
;declare void @gluEndCurve(i8*)
;declare void @gluEndPolygon(i8*)
;declare void @gluEndSurface(i8*)
;declare void @gluEndTrim(i8*)
;declare i8* @gluErrorString(i32)
;declare void @gluGetNurbsProperty(i8*, i32, float*)
;declare i8* @gluGetString(i32)
;declare void @gluGetTessProperty(i8*, i32, double*)
;declare void @gluLoadSamplingMatrices(i8*, float*, float*, i32*)
;declare void @gluLookAt(double, double, double, double, double, double, double, double, double)
;declare i8* @gluNewNurbsRenderer()
;declare i8* @gluNewQuadric()
;declare i8* @gluNewTess()
;declare void @gluNextContour(i8*, i32)
;declare void @gluNurbsCallback(i8*, i32, void (...)*)
;declare void @gluNurbsCallbackData(i8*, i8*)
;declare void @gluNurbsCallbackDataEXT(i8*, i8*)
;declare void @gluNurbsCurve(i8*, i32, float*, i32, float*, i32, i32)
;declare void @gluNurbsProperty(i8*, i32, float)
;declare void @gluNurbsSurface(i8*, i32, float*, i32, float*, i32, i32, float*, i32, i32, i32)
;declare void @gluOrtho2D(double, double, double, double)
;declare void @gluPartialDisk(i8*, double, double, i32, i32, double, double)
;declare void @gluPerspective(double, double, double, double)
;declare void @gluPickMatrix(double, double, double, double, i32*)
;declare i32 @gluProject(double, double, double, double*, double*, i32*, double*, double*, double*)
;declare void @gluPwlCurve(i8*, i32, float*, i32, i32)
;declare void @gluQuadricCallback(i8*, i32, void (...)*)
;declare void @gluQuadricDrawStyle(i8*, i32)
;declare void @gluQuadricNormals(i8*, i32)
;declare void @gluQuadricOrientation(i8*, i32)
;declare void @gluQuadricTexture(i8*, i8 zeroext)
;declare i32 @gluScaleImage(i32, i32, i32, i32, i8*, i32, i32, i32, i8*)
;declare void @gluSphere(i8*, double, i32, i32)
;declare void @gluTessBeginContour(i8*)
;declare void @gluTessBeginPolygon(i8*, i8*)
;declare void @gluTessCallback(i8*, i32, void (...)*)
;declare void @gluTessEndContour(i8*)
;declare void @gluTessEndPolygon(i8*)
;declare void @gluTessNormal(i8*, double, double, double)
;declare void @gluTessProperty(i8*, i32, double)
;declare void @gluTessVertex(i8*, double*, i8*)
;declare i32 @gluUnProject(double, double, double, double*, double*, i32*, double*, double*, double*)
;declare i32 @gluUnProject4(double, double, double, double, double*, double*, i32*, double, double, double*, double*, double*, double*)

;; glut
declare void @glutInit(i32*, i8**)
declare void @glutInitDisplayMode(i32)
declare void @glutInitDisplayString(i8*)
declare void @glutInitWindowPosition(i32, i32)
declare void @glutInitWindowSize(i32, i32)
declare void @glutMainLoop()
declare i32 @glutCreateWindow(i8*)
declare i32 @glutCreateSubWindow(i32, i32, i32, i32, i32)
declare void @glutDestroyWindow(i32)
declare void @glutPostRedisplay()
declare void @glutPostWindowRedisplay(i32)
declare void @glutSwapBuffers()
declare i32 @glutGetWindow()
declare void @glutSetWindow(i32)
declare void @glutSetWindowTitle(i8*)
declare void @glutSetIconTitle(i8*)
declare void @glutPositionWindow(i32, i32)
declare void @glutReshapeWindow(i32, i32)
declare void @glutPopWindow()
declare void @glutPushWindow()
declare void @glutIconifyWindow()
declare void @glutShowWindow()
declare void @glutHideWindow()
declare void @glutFullScreen()
declare void @glutSetCursor(i32)
declare void @glutWarpPointer(i32, i32)
declare void @glutSurfaceTexture(i32, i32, i32)
declare void @glutWMCloseFunc(void ()*)
declare void @glutCheckLoop()
declare void @glutEstablishOverlay()
declare void @glutRemoveOverlay()
declare void @glutUseLayer(i32)
declare void @glutPostOverlayRedisplay()
declare void @glutPostWindowOverlayRedisplay(i32)
declare void @glutShowOverlay()
declare void @glutHideOverlay()
declare i32 @glutCreateMenu(void (i32)*)
declare void @glutDestroyMenu(i32)
declare i32 @glutGetMenu()
declare void @glutSetMenu(i32)
declare void @glutAddMenuEntry(i8*, i32)
declare void @glutAddSubMenu(i8*, i32)
declare void @glutChangeToMenuEntry(i32, i8*, i32)
declare void @glutChangeToSubMenu(i32, i8*, i32)
declare void @glutRemoveMenuItem(i32)
declare void @glutAttachMenu(i32)
declare void @glutDetachMenu(i32)
declare void @glutDisplayFunc(i8*)
declare void @glutReshapeFunc(i8*)
declare void @glutKeyboardFunc(i8*)
declare void @glutMouseFunc(i8*)
declare void @glutMotionFunc(i8*)
declare void @glutPassiveMotionFunc(i8*)
declare void @glutEntryFunc(i8*)
declare void @glutVisibilityFunc(i8*)
declare void @glutIdleFunc(i8*)
declare void @glutTimerFunc(i32, i8*, i32)
declare void @glutMenuStateFunc(i8*)
declare void @glutSpecialFunc(i8*)
declare void @glutSpaceballMotionFunc(i8*)
declare void @glutSpaceballRotateFunc(i8*)
declare void @glutSpaceballButtonFunc(i8*)
declare void @glutButtonBoxFunc(i8*)
declare void @glutDialsFunc(i8*)
declare void @glutTabletMotionFunc(i8*)
declare void @glutTabletButtonFunc(i8*)
declare void @glutMenuStatusFunc(i8*)
declare void @glutOverlayDisplayFunc(i8*)
declare void @glutWindowStatusFunc(i8*)
declare void @glutKeyboardUpFunc(i8*)
declare void @glutSpecialUpFunc(i8*)
declare void @glutJoystickFunc(i8*, i32)
declare void @glutSetColor(i32, float, float, float)
declare float @glutGetColor(i32, i32)
declare void @glutCopyColormap(i32)
declare i32 @glutGet(i32)
declare i32 @glutDeviceGet(i32)
declare i32 @glutExtensionSupported(i8*)
declare i32 @glutGetModifiers()
declare i32 @glutLayerGet(i32)
declare i8* @glutGetProcAddress(i8*)
declare void @glutBitmapCharacter(i8*, i32)
declare i32 @glutBitmapWidth(i8*, i32)
declare void @glutStrokeCharacter(i8*, i32)
declare i32 @glutStrokeWidth(i8*, i32)
declare i32 @glutBitmapLength(i8*, i8*)
declare i32 @glutStrokeLength(i8*, i8*)
declare void @glutWireSphere(double, i32, i32)
declare void @glutSolidSphere(double, i32, i32)
declare void @glutWireCone(double, double, i32, i32)
declare void @glutSolidCone(double, double, i32, i32)
declare void @glutWireCube(double)
declare void @glutSolidCube(double)
declare void @glutWireTorus(double, double, i32, i32)
declare void @glutSolidTorus(double, double, i32, i32)
declare void @glutWireDodecahedron()
declare void @glutSolidDodecahedron()
declare void @glutWireTeapot(double)
declare void @glutSolidTeapot(double)
declare void @glutWireOctahedron()
declare void @glutSolidOctahedron()
declare void @glutWireTetrahedron()
declare void @glutSolidTetrahedron()
declare void @glutWireIcosahedron()
declare void @glutSolidIcosahedron()
declare i32 @glutVideoResizeGet(i32)
declare void @glutSetupVideoResizing()
declare void @glutStopVideoResizing()
declare void @glutVideoResize(i32, i32, i32, i32)
declare void @glutVideoPan(i32, i32, i32, i32)
declare void @glutReportErrors()
declare void @glutIgnoreKeyRepeat(i32)
declare void @glutSetKeyRepeat(i32)
declare void @glutForceJoystickFunc()
declare void @glutGameModeString(i8*)
declare i32 @glutEnterGameMode()
declare void @glutLeaveGameMode()
declare i32 @glutGameModeGet(i32)


;; gl extended
declare void @glActiveTextureARB(i32)
declare void @glClientActiveTextureARB(i32)
declare void @glMultiTexCoord1dARB(i32, double)
declare void @glMultiTexCoord1dvARB(i32, double*)
declare void @glMultiTexCoord1fARB(i32, float)
declare void @glMultiTexCoord1fvARB(i32, float*)
declare void @glMultiTexCoord1iARB(i32, i32)
declare void @glMultiTexCoord1ivARB(i32, i32*)
declare void @glMultiTexCoord1sARB(i32, i16 signext)
declare void @glMultiTexCoord1svARB(i32, i16*)
declare void @glMultiTexCoord2dARB(i32, double, double)
declare void @glMultiTexCoord2dvARB(i32, double*)
declare void @glMultiTexCoord2fARB(i32, float, float)
declare void @glMultiTexCoord2fvARB(i32, float*)
declare void @glMultiTexCoord2iARB(i32, i32, i32)
declare void @glMultiTexCoord2ivARB(i32, i32*)
declare void @glMultiTexCoord2sARB(i32, i16 signext, i16 signext)
declare void @glMultiTexCoord2svARB(i32, i16*)
declare void @glMultiTexCoord3dARB(i32, double, double, double)
declare void @glMultiTexCoord3dvARB(i32, double*)
declare void @glMultiTexCoord3fARB(i32, float, float, float)
declare void @glMultiTexCoord3fvARB(i32, float*)
declare void @glMultiTexCoord3iARB(i32, i32, i32, i32)
declare void @glMultiTexCoord3ivARB(i32, i32*)
declare void @glMultiTexCoord3sARB(i32, i16 signext, i16 signext, i16 signext)
declare void @glMultiTexCoord3svARB(i32, i16*)
declare void @glMultiTexCoord4dARB(i32, double, double, double, double)
declare void @glMultiTexCoord4dvARB(i32, double*)
declare void @glMultiTexCoord4fARB(i32, float, float, float, float)
declare void @glMultiTexCoord4fvARB(i32, float*)
declare void @glMultiTexCoord4iARB(i32, i32, i32, i32, i32)
declare void @glMultiTexCoord4ivARB(i32, i32*)
declare void @glMultiTexCoord4sARB(i32, i16 signext, i16 signext, i16 signext, i16 signext)
declare void @glMultiTexCoord4svARB(i32, i16*)
declare void @glLoadTransposeMatrixfARB(float*)
declare void @glLoadTransposeMatrixdARB(double*)
declare void @glMultTransposeMatrixfARB(float*)
declare void @glMultTransposeMatrixdARB(double*)
declare void @glSampleCoverageARB(float, i8 zeroext)
declare void @glSamplePassARB(i32)
declare void @glCompressedTexImage3DARB(i32, i32, i32, i32, i32, i32, i32, i32, i8*)
declare void @glCompressedTexImage2DARB(i32, i32, i32, i32, i32, i32, i32, i8*)
declare void @glCompressedTexImage1DARB(i32, i32, i32, i32, i32, i32, i8*)
declare void @glCompressedTexSubImage3DARB(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*)
declare void @glCompressedTexSubImage2DARB(i32, i32, i32, i32, i32, i32, i32, i32, i8*)
declare void @glCompressedTexSubImage1DARB(i32, i32, i32, i32, i32, i32, i8*)
declare void @glGetCompressedTexImageARB(i32, i32, i8*)
declare void @glWeightbvARB(i32, i8*)
declare void @glWeightsvARB(i32, i16*)
declare void @glWeightivARB(i32, i32*)
declare void @glWeightfvARB(i32, float*)
declare void @glWeightdvARB(i32, double*)
declare void @glWeightubvARB(i32, i8*)
declare void @glWeightusvARB(i32, i16*)
declare void @glWeightuivARB(i32, i32*)
declare void @glWeightPointerARB(i32, i32, i32, i8*)
declare void @glVertexBlendARB(i32)
declare void @glWindowPos2dARB(double, double)
declare void @glWindowPos2dvARB(double*)
declare void @glWindowPos2fARB(float, float)
declare void @glWindowPos2fvARB(float*)
declare void @glWindowPos2iARB(i32, i32)
declare void @glWindowPos2ivARB(i32*)
declare void @glWindowPos2sARB(i16 signext, i16 signext)
declare void @glWindowPos2svARB(i16*)
declare void @glWindowPos3dARB(double, double, double)
declare void @glWindowPos3dvARB(double*)
declare void @glWindowPos3fARB(float, float, float)
declare void @glWindowPos3fvARB(float*)
declare void @glWindowPos3iARB(i32, i32, i32)
declare void @glWindowPos3ivARB(i32*)
declare void @glWindowPos3sARB(i16 signext, i16 signext, i16 signext)
declare void @glWindowPos3svARB(i16*)
declare void @glGenQueriesARB(i32, i32*)
declare void @glDeleteQueriesARB(i32, i32*)
declare void @glBeginQueryARB(i32, i32)
declare void @glEndQueryARB(i32)
declare void @glGetQueryivARB(i32, i32, i32*)
declare void @glGetQueryObjectivARB(i32, i32, i32*)
declare void @glGetQueryObjectuivARB(i32, i32, i32*)
declare void @glPointParameterfARB(i32, float)
declare void @glPointParameterfvARB(i32, float*)
declare void @glBindProgramARB(i32, i32)
declare void @glDeleteProgramsARB(i32, i32*)
declare void @glGenProgramsARB(i32, i32*)
declare void @glProgramEnvParameter4dARB(i32, i32, double, double, double, double)
declare void @glProgramEnvParameter4dvARB(i32, i32, double*)
declare void @glProgramEnvParameter4fARB(i32, i32, float, float, float, float)
declare void @glProgramEnvParameter4fvARB(i32, i32, float*)
declare void @glProgramLocalParameter4dARB(i32, i32, double, double, double, double)
declare void @glProgramLocalParameter4dvARB(i32, i32, double*)
declare void @glProgramLocalParameter4fARB(i32, i32, float, float, float, float)
declare void @glProgramLocalParameter4fvARB(i32, i32, float*)
declare void @glGetProgramEnvParameterdvARB(i32, i32, double*)
declare void @glGetProgramEnvParameterfvARB(i32, i32, float*)
declare void @glProgramEnvParameters4fvEXT(i32, i32, i32, float*)
declare void @glProgramLocalParameters4fvEXT(i32, i32, i32, float*)
declare void @glGetProgramLocalParameterdvARB(i32, i32, double*)
declare void @glGetProgramLocalParameterfvARB(i32, i32, float*)
declare void @glProgramStringARB(i32, i32, i32, i8*)
declare void @glGetProgramStringARB(i32, i32, i8*)
declare void @glGetProgramivARB(i32, i32, i32*)
declare void @glVertexAttrib1dARB(i32, double)
declare void @glVertexAttrib1dvARB(i32, double*)
declare void @glVertexAttrib1fARB(i32, float)
declare void @glVertexAttrib1fvARB(i32, float*)
declare void @glVertexAttrib1sARB(i32, i16 signext)
declare void @glVertexAttrib1svARB(i32, i16*)
declare void @glVertexAttrib2dARB(i32, double, double)
declare void @glVertexAttrib2dvARB(i32, double*)
declare void @glVertexAttrib2fARB(i32, float, float)
declare void @glVertexAttrib2fvARB(i32, float*)
declare void @glVertexAttrib2sARB(i32, i16 signext, i16 signext)
declare void @glVertexAttrib2svARB(i32, i16*)
declare void @glVertexAttrib3dARB(i32, double, double, double)
declare void @glVertexAttrib3dvARB(i32, double*)
declare void @glVertexAttrib3fARB(i32, float, float, float)
declare void @glVertexAttrib3fvARB(i32, float*)
declare void @glVertexAttrib3sARB(i32, i16 signext, i16 signext, i16 signext)
declare void @glVertexAttrib3svARB(i32, i16*)
declare void @glVertexAttrib4NbvARB(i32, i8*)
declare void @glVertexAttrib4NivARB(i32, i32*)
declare void @glVertexAttrib4NsvARB(i32, i16*)
declare void @glVertexAttrib4NubARB(i32, i8 zeroext, i8 zeroext, i8 zeroext, i8 zeroext)
declare void @glVertexAttrib4NubvARB(i32, i8*)
declare void @glVertexAttrib4NuivARB(i32, i32*)
declare void @glVertexAttrib4NusvARB(i32, i16*)
declare void @glVertexAttrib4bvARB(i32, i8*)
declare void @glVertexAttrib4dARB(i32, double, double, double, double)
declare void @glVertexAttrib4dvARB(i32, double*)
declare void @glVertexAttrib4fARB(i32, float, float, float, float)
declare void @glVertexAttrib4fvARB(i32, float*)
declare void @glVertexAttrib4ivARB(i32, i32*)
declare void @glVertexAttrib4sARB(i32, i16 signext, i16 signext, i16 signext, i16 signext)
declare void @glVertexAttrib4svARB(i32, i16*)
declare void @glVertexAttrib4ubvARB(i32, i8*)
declare void @glVertexAttrib4uivARB(i32, i32*)
declare void @glVertexAttrib4usvARB(i32, i16*)
declare void @glVertexAttribPointerARB(i32, i32, i32, i8 zeroext, i32, i8*)
declare void @glDisableVertexAttribArrayARB(i32)
declare void @glEnableVertexAttribArrayARB(i32)
declare void @glGetVertexAttribPointervARB(i32, i32, i8**)
declare void @glGetVertexAttribdvARB(i32, i32, double*)
declare void @glGetVertexAttribfvARB(i32, i32, float*)
declare void @glGetVertexAttribivARB(i32, i32, i32*)
declare void @glDeleteObjectARB(i8*)
declare void @glDetachObjectARB(i8*, i8*)
declare void @glShaderSourceARB(i8*, i32, i8**, i32*)
declare void @glCompileShaderARB(i8*)
declare void @glAttachObjectARB(i8*, i8*)
declare void @glLinkProgramARB(i8*)
declare void @glUseProgramObjectARB(i8*)
declare void @glValidateProgramARB(i8*)
declare void @glUniform1fARB(i32, float)
declare void @glUniform2fARB(i32, float, float)
declare void @glUniform3fARB(i32, float, float, float)
declare void @glUniform4fARB(i32, float, float, float, float)
declare void @glUniform1iARB(i32, i32)
declare void @glUniform2iARB(i32, i32, i32)
declare void @glUniform3iARB(i32, i32, i32, i32)
declare void @glUniform4iARB(i32, i32, i32, i32, i32)
declare void @glUniform1fvARB(i32, i32, float*)
declare void @glUniform2fvARB(i32, i32, float*)
declare void @glUniform3fvARB(i32, i32, float*)
declare void @glUniform4fvARB(i32, i32, float*)
declare void @glUniform1ivARB(i32, i32, i32*)
declare void @glUniform2ivARB(i32, i32, i32*)
declare void @glUniform3ivARB(i32, i32, i32*)
declare void @glUniform4ivARB(i32, i32, i32*)
declare void @glUniformMatrix2fvARB(i32, i32, i8 zeroext, float*)
declare void @glUniformMatrix3fvARB(i32, i32, i8 zeroext, float*)
declare void @glUniformMatrix4fvARB(i32, i32, i8 zeroext, float*)
declare void @glGetObjectParameterfvARB(i8*, i32, float*)
declare void @glGetObjectParameterivARB(i8*, i32, i32*)
declare void @glGetInfoLogARB(i8*, i32, i32*, i8*)
declare void @glGetAttachedObjectsARB(i8*, i32, i32*, i8**)
declare void @glGetActiveUniformARB(i8*, i32, i32, i32*, i32*, i32*, i8*)
declare void @glGetUniformfvARB(i8*, i32, float*)
declare void @glGetUniformivARB(i8*, i32, i32*)
declare void @glGetShaderSourceARB(i8*, i32, i32*, i8*)
declare void @glBindAttribLocationARB(i8*, i32, i8*)
declare void @glGetActiveAttribARB(i8*, i32, i32, i32*, i32*, i32*, i8*)
declare void @glBindBufferARB(i32, i32)
declare void @glDeleteBuffersARB(i32, i32*)
declare void @glGenBuffersARB(i32, i32*)
declare void @glBufferDataARB(i32, i32, i8*, i32)
declare void @glBufferSubDataARB(i32, i32, i32, i8*)
declare void @glGetBufferSubDataARB(i32, i32, i32, i8*)
declare void @glGetBufferParameterivARB(i32, i32, i32*)
declare void @glGetBufferPointervARB(i32, i32, i8**)
declare void @glDrawBuffersARB(i32, i32*)

;; opengl cgl
declare i32 @CGLDescribePixelFormat(i8*, i32, i32, i32*)
declare i8* @CGLGetPixelFormat(i8*)
declare i8* @CGLRetainPixelFormat(i8*)
declare void @CGLReleasePixelFormat(i8*)
declare i32 @CGLGetPixelFormatRetainCount(i8*)
declare i32 @CGLDestroyPixelFormat(i8*)
declare i32 @CGLCreateContext(i8*, i8*, i8**)
declare i32 @CGLCopyContext(i8*, i8*, i32)
declare i8* @CGLRetainContext(i8*)
declare void @CGLReleaseContext(i8*)
declare i32 @CGLGetContextRetainCount(i8*)
declare i32 @CGLDestroyContext(i8*)
declare i8* @CGLGetCurrentContext()
declare i32 @CGLSetCurrentContext(i8*)
declare i32 @CGLEnable(i8*, i32)
declare i32 @CGLDisable(i8*, i32)
declare i32 @CGLIsEnabled(i8*, i32, i32*)
declare i32 @CGLSetParameter(i8*, i32, i32*)
declare i32 @CGLGetParameter(i8*, i32, i32*)
declare i32 @CGLLockContext(i8*)
declare i32 @CGLUnlockContext(i8*)
declare i32 @CGLSetOffScreen(i8*, i32, i32, i32, i8*)
declare i32 @CGLGetOffScreen(i8*, i32*, i32*, i32*, i8**)
declare i32 @CGLSetFullScreenOnDisplay(i8*, i32)
declare i32 @CGLClearDrawable(i8*)
declare i32 @CGLFlushDrawable(i8*)
declare i32 @CGLCreatePBuffer(i32, i32, i32, i32, i32, i8**)
declare i32 @CGLDescribePBuffer(i8*, i32*, i32*, i32*, i32*, i32*)
declare i8* @CGLRetainPBuffer(i8*)
declare void @CGLReleasePBuffer(i8*)
declare i32 @CGLGetPBufferRetainCount(i8*)
declare i32 @CGLDestroyPBuffer(i8*)
declare i32 @CGLGetPBuffer(i8*, i8**, i32*, i32*, i32*)
declare i32 @CGLSetPBuffer(i8*, i8*, i32, i32, i32)
declare i32 @CGLTexImagePBuffer(i8*, i8*, i32)
declare i8* @CGLErrorString(i32)
declare i32 @CGLSetOption(i32, i32)
declare i32 @CGLGetOption(i32, i32*)
declare i32 @CGLGetGlobalOption(i32, i32*)
declare i32 @CGLSetGlobalOption(i32, i32*)
declare void @CGLGetVersion(i32*, i32*)
declare i32 @CGLDescribeRenderer(i8*, i32, i32, i32*)
declare i32 @CGLDestroyRendererInfo(i8*)
declare i32 @CGLQueryRendererInfo(i32, i8**, i32*)
declare i32 @CGLSetVirtualScreen(i8*, i32)
declare i32 @CGLGetVirtualScreen(i8*, i32*)


;; R5RS equivs
declare i8* @llvm_substring(i8*,i32,i32)
declare i8* @llvm_string_cat(i8*,i8*)
declare i8* @llvm_string_copy(i8*)
declare i32 @llvm_string_eq(i8*,i8*)
declare void @llvm_string_set(i8*, i32, i8)
declare i8 @llvm_string_ref(i8*, i32)


declare double @imp_randd()
declare float @imp_randf()
declare i64 @imp_rand1_i64(i64)
declare i64 @imp_rand2_i64(i64,i64)
declare i32 @imp_rand1_i32(i32)
declare i32 @imp_rand2_i32(i32,i32)
declare float @imp_rand1_f(float)
declare float @imp_rand2_f(float,float)
declare double @imp_rand1_d(double)
declare double @imp_rand2_d(double,double)

declare void @llvm_destroy_zone_after_delay(%mzone*, i64)
declare void @free_after_delay(i8*, double)


define double @imp_dsp_wrapper(i8* %_impz, i8* %closure, double %sample, i64 %time, i64 %channel, double* %data) 
{
entry:
%closureVal = bitcast i8* %closure to { i8*, i8*, double (i8*,i8*,double,i64,i64,double*)*}*
; apply closure 
%fPtr = getelementptr {i8*, i8*, double (i8*, i8*, double, i64, i64, double*)*}* %closureVal, i32 0, i32 2
%ePtr = getelementptr {i8*, i8*, double (i8*, i8*, double, i64, i64, double*)*}* %closureVal, i32 0, i32 1
%f = load double (i8*, i8*, double,i64,i64,double*)** %fPtr
%e = load i8** %ePtr
%result = tail call fastcc double %f(i8* %_impz, i8* %e, double %sample, i64 %time, i64 %channel, double* %data)
ret double %result
}

define double @imp_dsp_sum_wrapper(i8* %_impz, i8* %closure, double* %sample, i64 %time, i64 %channel, double* %data) 
{
entry:
%closureVal = bitcast i8* %closure to { i8*, i8*, double (i8*,i8*,double*,i64,i64,double*)*}*
; apply closure 
%fPtr = getelementptr {i8*, i8*, double (i8*, i8*, double*, i64, i64, double*)*}* %closureVal, i32 0, i32 2
%ePtr = getelementptr {i8*, i8*, double (i8*, i8*, double*, i64, i64, double*)*}* %closureVal, i32 0, i32 1
%f = load double (i8*, i8*, double*,i64,i64,double*)** %fPtr
%e = load i8** %ePtr
%result = tail call fastcc double %f(i8* %_impz, i8* %e, double* %sample, i64 %time, i64 %channel, double* %data)
ret double %result
}

define float @imp_dspf_wrapper(i8* %_impz, i8* %closure, float %sample, i64 %time, i64 %channel, float* %data) 
{
entry:
%closureVal = bitcast i8* %closure to { i8*, i8*, float (i8*,i8*,float,i64,i64,float*)*}*
; apply closure 
%fPtr = getelementptr {i8*, i8*, float (i8*, i8*, float, i64, i64, float*)*}* %closureVal, i32 0, i32 2
%ePtr = getelementptr {i8*, i8*, float (i8*, i8*, float, i64, i64, float*)*}* %closureVal, i32 0, i32 1
%f = load float (i8*, i8*, float,i64,i64,float*)** %fPtr
%e = load i8** %ePtr
%result = tail call fastcc float %f(i8* %_impz, i8* %e, float %sample, i64 %time, i64 %channel, float* %data)
ret float %result
}

define float @imp_dspf_sum_wrapper(i8* %_impz, i8* %closure, float* %sample, i64 %time, i64 %channel, float* %data) 
{
entry:
%closureVal = bitcast i8* %closure to { i8*, i8*, float (i8*,i8*,float*,i64,i64,float*)*}*
; apply closure 
%fPtr = getelementptr {i8*, i8*, float (i8*, i8*, float*, i64, i64, float*)*}* %closureVal, i32 0, i32 2
%ePtr = getelementptr {i8*, i8*, float (i8*, i8*, float*, i64, i64, float*)*}* %closureVal, i32 0, i32 1
%f = load float (i8*, i8*, float*,i64,i64,float*)** %fPtr
%e = load i8** %ePtr
%result = tail call fastcc float %f(i8* %_impz, i8* %e, float* %sample, i64 %time, i64 %channel, float* %data)
ret float %result
}

define void @imp_dsp_wrapper_array(i8* %_impz, i8* %closure, float* %datain, float* %dataout, i64 %time, i8* %data) 
{
entry:
%closureVal = bitcast i8* %closure to { i8*, i8*, void (i8*,i8*,float*,float*,i64,i8*)*}*
; apply closure 
%fPtr = getelementptr {i8*, i8*, void (i8*, i8*, float*, float*, i64, i8*)*}* %closureVal, i32 0, i32 2
%ePtr = getelementptr {i8*, i8*, void (i8*, i8*, float*, float*, i64, i8*)*}* %closureVal, i32 0, i32 1
%f = load void (i8*, i8*, float*,float*,i64,i8*)** %fPtr
%e = load i8** %ePtr
tail call fastcc void %f(i8* %_impz, i8* %e, float* %datain, float* %dataout, i64 %time, i8* %data)
ret void
}

define void @imp_dsp_sum_wrapper_array(i8* %_impz, i8* %closure, float** %datain, float* %dataout, i64 %time, i8* %data) 
{
entry:
%closureVal = bitcast i8* %closure to { i8*, i8*, void (i8*,i8*,float**,float*,i64,i8*)*}*
; apply closure 
%fPtr = getelementptr {i8*, i8*, void (i8*, i8*, float**, float*, i64, i8*)*}* %closureVal, i32 0, i32 2
%ePtr = getelementptr {i8*, i8*, void (i8*, i8*, float**, float*, i64, i8*)*}* %closureVal, i32 0, i32 1
%f = load void (i8*, i8*, float**,float*,i64,i8*)** %fPtr
%e = load i8** %ePtr
tail call fastcc void %f(i8* %_impz, i8* %e, float** %datain, float* %dataout, i64 %time, i8* %data)
ret void
}

define i8* @impc_get_env(i8* %impz, i8* %closure)
{
entry:
%closureVal = bitcast i8* %closure to { i8*, i8*, i8* }*
%ePtr = getelementptr { i8*, i8*, i8* }* %closureVal, i32 0, i32 1
%e = load i8** %ePtr
ret i8* %e
}

declare i64 @llvm_now()
declare double @llvm_samplerate()


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SCHEME STUFF

define i8* @impc_null()
{
entry:
ret i8* null
}

define i1 @impc_true()
{
entry:
ret i1 1
}

define i1 @impc_false()
{
entry:
ret i1 0
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CASTING STUFF

define i64 @i1toi64(i1 %a)
{
entry:
%return = zext i1 %a to i64
ret i64 %return 
}

define i32 @i1toi32(i1 %a)
{
entry:
%return = zext i1 %a to i32
ret i32 %return 
}

define i16 @i1toi16(i1 %a)
{
entry:
%return = zext i1 %a to i16
ret i16 %return 
}

define i8 @i1toi8(i1 %a)
{
entry:
%return = zext i1 %a to i8
ret i8 %return 
}

define i1 @i64toi1(i64 %a)
{
entry:
%return = trunc i64 %a to i1
ret i1 %return
}

define i1 @i32toi1(i32 %a)
{
entry:
%return = trunc i32 %a to i1
ret i1 %return
}

define i1 @i16toi1(i16 %a)
{
entry:
%return = trunc i16 %a to i1
ret i1 %return
}

define i1 @i8toi1(i8 %a)
{
entry:
%return = trunc i8 %a to i1
ret i1 %return
}


;; i8 casts
define i64 @i8toi64(i8 %a)
{
entry:
%return = sext i8 %a to i64
ret i64 %return 
}

define i64 @i8toui64(i8 %a)
{
entry:
%return = zext i8 %a to i64
ret i64 %return 
}

define i32 @i8toi32(i8 %a)
{
entry:
%return = sext i8 %a to i32
ret i32 %return 
}

define i16 @i8toi16(i8 %a)
{
entry:
%return = sext i8 %a to i16
ret i16 %return 
}

define i32 @i8toui32(i8 %a)
{
entry:
%return = zext i8 %a to i32
ret i32 %return 
}

define i8 @i64toi8(i64 %a)
{
entry:
%return = trunc i64 %a to i8
ret i8 %return
}

define i8 @i32toi8(i32 %a)
{
entry:
%return = trunc i32 %a to i8
ret i8 %return
}

define i8 @i16toi8(i16 %a)
{
entry:
%return = trunc i16 %a to i8
ret i8 %return
}

;; i16 casts
define i64 @i16toi64(i16 %a)
{
entry:
%return = sext i16 %a to i64
ret i64 %return 
}

define i64 @i16toui64(i16 %a)
{
entry:
%return = zext i16 %a to i64
ret i64 %return 
}

define i32 @i16toi32(i16 %a)
{
entry:
%return = sext i16 %a to i32
ret i32 %return 
}

define i32 @i16toui32(i16 %a)
{
entry:
%return = zext i16 %a to i32
ret i32 %return 
}

define i16 @i64toi16(i64 %a)
{
entry:
%return = trunc i64 %a to i16
ret i16 %return
}

define i16 @i32toi16(i32 %a)
{
entry:
%return = trunc i32 %a to i16
ret i16 %return
}


;; i32 casts
define i64 @i32toi64(i32 %a)
{
entry:
%return = sext i32 %a to i64
ret i64 %return 
}

define i64 @i32toui64(i32 %a)
{
entry:
%return = zext i32 %a to i64
ret i64 %return 
}

define i32 @i64toi32(i64 %a)
{
entry:
%return = trunc i64 %a to i32
ret i32 %return
}


;; float casts
define double @ftod(float %a)
{
entry:
%return = fpext float %a to double
ret double %return
}

define float @dtof(double %a)
{
entry:
%return = fptrunc double %a to float
ret float %return
}

define i64 @ftoi64(float %a)
{
entry:
%return = fptosi float %a to i64
ret i64 %return
}

define i32 @ftoi32(float %a)
{
entry:
%return = fptosi float %a to i32
ret i32 %return
}

define i16 @ftoi16(float %a)
{
entry:
%return = fptosi float %a to i16
ret i16 %return
}

define i8 @ftoi8(float %a)
{
entry:
%return = fptosi float %a to i8
ret i8 %return
}

define i1 @ftoi1(float %a)
{
entry:
%return = fptosi float %a to i1
ret i1 %return
}

define i64 @ftoui64(float %a)
{
entry:
%return = fptoui float %a to i64
ret i64 %return
}

define i32 @ftoui32(float %a)
{
entry:
%return = fptoui float %a to i32
ret i32 %return
}

define i8 @ftoui8(float %a)
{
entry:
%return = fptoui float %a to i8
ret i8 %return
}

define i1 @ftoui1(float %a)
{
entry:
%return = fptoui float %a to i1
ret i1 %return
}

define float @i64tof(i64 %a)
{
entry:
%return = sitofp i64 %a to float
ret float %return
}

define float @i32tof(i32 %a)
{
entry:
%return = sitofp i32 %a to float
ret float %return
}

define float @i16tof(i16 %a)
{
entry:
%return = sitofp i16 %a to float
ret float %return
}

define float @i8tof(i8 %a)
{
entry:
%return = sitofp i8 %a to float
ret float %return
}

define float @i1tof(i1 %a)
{
entry:
%return = sitofp i1 %a to float
ret float %return
}

define float @ui64tof(i64 %a)
{
entry:
%return = uitofp i64 %a to float
ret float %return
}

define float @ui32tof(i32 %a)
{
entry:
%return = uitofp i32 %a to float
ret float %return
}

define float @ui16tof(i16 %a)
{
entry:
%return = uitofp i16 %a to float
ret float %return
}

define float @ui8tof(i8 %a)
{
entry:
%return = uitofp i8 %a to float
ret float %return
}

define float @ui1tof(i1 %a)
{
entry:
%return = uitofp i1 %a to float
ret float %return
}

;; double casts

define i64 @dtoi64(double %a)
{
entry:
%return = fptosi double %a to i64
ret i64 %return
}

define i32 @dtoi32(double %a)
{
entry:
%return = fptosi double %a to i32
ret i32 %return
}

define i16 @dtoi16(double %a)
{
entry:
%return = fptosi double %a to i16
ret i16 %return
}

define i8 @dtoi8(double %a)
{
entry:
%return = fptosi double %a to i8
ret i8 %return
}

define i1 @dtoi1(double %a)
{
entry:
%return = fptosi double %a to i1
ret i1 %return
}

define i64 @dtoui64(double %a)
{
entry:
%return = fptoui double %a to i64
ret i64 %return
}

define i32 @dtoui32(double %a)
{
entry:
%return = fptoui double %a to i32
ret i32 %return
}

define i8 @dtoui8(double %a)
{
entry:
%return = fptoui double %a to i8
ret i8 %return
}

define i1 @dtoui1(double %a)
{
entry:
%return = fptoui double %a to i1
ret i1 %return
}

define double @i64tod(i64 %a)
{
entry:
%return = sitofp i64 %a to double
ret double %return
}

define double @i32tod(i32 %a)
{
entry:
%return = sitofp i32 %a to double
ret double %return
}

define double @i16tod(i16 %a)
{
entry:
%return = sitofp i16 %a to double
ret double %return
}

define double @i8tod(i8 %a)
{
entry:
%return = sitofp i8 %a to double
ret double %return
}

define double @i1tod(i1 %a)
{
entry:
%return = sitofp i1 %a to double
ret double %return
}

define double @ui64tod(i64 %a)
{
entry:
%return = uitofp i64 %a to double
ret double %return
}

define double @ui32tod(i32 %a)
{
entry:
%return = uitofp i32 %a to double
ret double %return
}

define double @ui16tod(i16 %a)
{
entry:
%return = uitofp i16 %a to double
ret double %return
}

define double @ui8tod(i8 %a)
{
entry:
%return = uitofp i8 %a to double
ret double %return
}

define double @ui1tod(i1 %a)
{
entry:
%return = uitofp i1 %a to double
ret double %return
}

define i64 @ptrtoi64(i8* %a)
{
entry:
%return = ptrtoint i8* %a to i64
ret i64 %return
}

define i8* @i64toptr(i64 %a)
{
entry:
%return = inttoptr i64 %a to i8*
ret i8* %return
}

define i32 @ptrtoi32(i8* %a)
{
entry:
%return = ptrtoint i8* %a to i32
ret i32 %return
}

define i16 @ptrtoi16(i8* %a)
{
entry:
%return = ptrtoint i8* %a to i16
ret i16 %return
}

define i8* @i32toptr(i32 %a)
{
entry:
%return = inttoptr i32 %a to i8*
ret i8* %return
}

define i8* @i16toptr(i16 %a)
{
entry:
%return = inttoptr i16 %a to i8*
ret i8* %return
}


