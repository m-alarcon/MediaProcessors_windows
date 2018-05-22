/* ANSI-C code produced by genperf */
/* Command-line: genperf C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf x86cpu.c */
#line 26 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"

#include <util.h>

#include <ctype.h>
#include <libyasm.h>
#include <libyasm/phash.h>

#include "modules/arch/x86/x86arch.h"

#define PROC_8086	0
#define PROC_186	1
#define PROC_286	2
#define PROC_386	3
#define PROC_486	4
#define PROC_586	5
#define PROC_686	6
#define PROC_p2		7
#define PROC_p3		8
#define PROC_p4		9
#define PROC_prescott	10
#define PROC_conroe	11
#define PROC_penryn	12
#define PROC_nehalem	13
#define PROC_westmere	14
#define PROC_sandybridge	15
#define PROC_ivybridge	16
#define PROC_haswell	17
#define PROC_broadwell	18
#define PROC_skylake	19

static void
x86_cpu_intel(wordptr cpu, yasm_arch_x86 *arch_x86, unsigned int data)
{
    BitVector_Empty(cpu);

    BitVector_Bit_On(cpu, CPU_Priv);
    if (data >= PROC_286)
        BitVector_Bit_On(cpu, CPU_Prot);
    if (data >= PROC_386)
        BitVector_Bit_On(cpu, CPU_SMM);
    if (data >= PROC_skylake) {
        BitVector_Bit_On(cpu, CPU_SHA);
    }
    if (data >= PROC_broadwell) {
        BitVector_Bit_On(cpu, CPU_RDSEED);
        BitVector_Bit_On(cpu, CPU_ADX);
        BitVector_Bit_On(cpu, CPU_PRFCHW);
    }
    if (data >= PROC_haswell) {
        BitVector_Bit_On(cpu, CPU_FMA);
        BitVector_Bit_On(cpu, CPU_AVX2);
        BitVector_Bit_On(cpu, CPU_BMI1);
        BitVector_Bit_On(cpu, CPU_BMI2);
        BitVector_Bit_On(cpu, CPU_INVPCID);
        BitVector_Bit_On(cpu, CPU_LZCNT);
        BitVector_Bit_On(cpu, CPU_TSX);
        BitVector_Bit_On(cpu, CPU_SMAP);
    }
    if (data >= PROC_ivybridge) {
        BitVector_Bit_On(cpu, CPU_F16C);
        BitVector_Bit_On(cpu, CPU_FSGSBASE);
        BitVector_Bit_On(cpu, CPU_RDRAND);
    }
    if (data >= PROC_sandybridge) {
        BitVector_Bit_On(cpu, CPU_AVX);
        BitVector_Bit_On(cpu, CPU_XSAVEOPT);
        BitVector_Bit_On(cpu, CPU_EPTVPID);
        BitVector_Bit_On(cpu, CPU_SMX);
    }
    if (data >= PROC_westmere) {
        BitVector_Bit_On(cpu, CPU_AES);
        BitVector_Bit_On(cpu, CPU_CLMUL);
    }
    if (data >= PROC_nehalem) {
        BitVector_Bit_On(cpu, CPU_SSE42);
        BitVector_Bit_On(cpu, CPU_XSAVE);
    }
    if (data >= PROC_penryn)
        BitVector_Bit_On(cpu, CPU_SSE41);
    if (data >= PROC_conroe)
        BitVector_Bit_On(cpu, CPU_SSSE3);
    if (data >= PROC_prescott)
        BitVector_Bit_On(cpu, CPU_SSE3);
    if (data >= PROC_p4)
        BitVector_Bit_On(cpu, CPU_SSE2);
    if (data >= PROC_p3)
        BitVector_Bit_On(cpu, CPU_SSE);
    if (data >= PROC_p2)
        BitVector_Bit_On(cpu, CPU_MMX);
    if (data >= PROC_486)
        BitVector_Bit_On(cpu, CPU_FPU);
    if (data >= PROC_prescott)
        BitVector_Bit_On(cpu, CPU_EM64T);

    if (data >= PROC_p4)
        BitVector_Bit_On(cpu, CPU_P4);
    if (data >= PROC_p3)
        BitVector_Bit_On(cpu, CPU_P3);
    if (data >= PROC_686)
        BitVector_Bit_On(cpu, CPU_686);
    if (data >= PROC_586)
        BitVector_Bit_On(cpu, CPU_586);
    if (data >= PROC_486)
        BitVector_Bit_On(cpu, CPU_486);
    if (data >= PROC_386)
        BitVector_Bit_On(cpu, CPU_386);
    if (data >= PROC_286)
        BitVector_Bit_On(cpu, CPU_286);
    if (data >= PROC_186)
        BitVector_Bit_On(cpu, CPU_186);
    BitVector_Bit_On(cpu, CPU_086);

    /* Use Intel long NOPs if 686 or better */
    if (data >= PROC_686)
        arch_x86->nop = X86_NOP_INTEL;
    else
        arch_x86->nop = X86_NOP_BASIC;
}

static void
x86_cpu_ia64(wordptr cpu, yasm_arch_x86 *arch_x86, unsigned int data)
{
    BitVector_Empty(cpu);
    BitVector_Bit_On(cpu, CPU_Priv);
    BitVector_Bit_On(cpu, CPU_Prot);
    BitVector_Bit_On(cpu, CPU_SMM);
    BitVector_Bit_On(cpu, CPU_SSE2);
    BitVector_Bit_On(cpu, CPU_SSE);
    BitVector_Bit_On(cpu, CPU_MMX);
    BitVector_Bit_On(cpu, CPU_FPU);
    BitVector_Bit_On(cpu, CPU_IA64);
    BitVector_Bit_On(cpu, CPU_P4);
    BitVector_Bit_On(cpu, CPU_P3);
    BitVector_Bit_On(cpu, CPU_686);
    BitVector_Bit_On(cpu, CPU_586);
    BitVector_Bit_On(cpu, CPU_486);
    BitVector_Bit_On(cpu, CPU_386);
    BitVector_Bit_On(cpu, CPU_286);
    BitVector_Bit_On(cpu, CPU_186);
    BitVector_Bit_On(cpu, CPU_086);
}

#define PROC_bulldozer	11
#define PROC_k10    10
#define PROC_venice 9
#define PROC_hammer 8
#define PROC_k7     7
#define PROC_k6     6

static void
x86_cpu_amd(wordptr cpu, yasm_arch_x86 *arch_x86, unsigned int data)
{
    BitVector_Empty(cpu);

    BitVector_Bit_On(cpu, CPU_Priv);
    BitVector_Bit_On(cpu, CPU_Prot);
    BitVector_Bit_On(cpu, CPU_SMM);
    BitVector_Bit_On(cpu, CPU_3DNow);
    if (data >= PROC_bulldozer) {
        BitVector_Bit_On(cpu, CPU_XOP);
        BitVector_Bit_On(cpu, CPU_FMA4);
    }
    if (data >= PROC_k10)
        BitVector_Bit_On(cpu, CPU_SSE4a);
    if (data >= PROC_venice)
        BitVector_Bit_On(cpu, CPU_SSE3);
    if (data >= PROC_hammer)
        BitVector_Bit_On(cpu, CPU_SSE2);
    if (data >= PROC_k7)
        BitVector_Bit_On(cpu, CPU_SSE);
    if (data >= PROC_k6)
        BitVector_Bit_On(cpu, CPU_MMX);
    BitVector_Bit_On(cpu, CPU_FPU);

    if (data >= PROC_hammer)
        BitVector_Bit_On(cpu, CPU_Hammer);
    if (data >= PROC_k7)
        BitVector_Bit_On(cpu, CPU_Athlon);
    if (data >= PROC_k6)
        BitVector_Bit_On(cpu, CPU_K6);
    BitVector_Bit_On(cpu, CPU_686);
    BitVector_Bit_On(cpu, CPU_586);
    BitVector_Bit_On(cpu, CPU_486);
    BitVector_Bit_On(cpu, CPU_386);
    BitVector_Bit_On(cpu, CPU_286);
    BitVector_Bit_On(cpu, CPU_186);
    BitVector_Bit_On(cpu, CPU_086);

    /* Use AMD long NOPs if k6 or better */
    if (data >= PROC_k6)
        arch_x86->nop = X86_NOP_AMD;
    else
        arch_x86->nop = X86_NOP_BASIC;
}

static void
x86_cpu_set(wordptr cpu, yasm_arch_x86 *arch_x86, unsigned int data)
{
    BitVector_Bit_On(cpu, data);
}

static void
x86_cpu_clear(wordptr cpu, yasm_arch_x86 *arch_x86, unsigned int data)
{
    BitVector_Bit_Off(cpu, data);
}

static void
x86_cpu_set_sse4(wordptr cpu, yasm_arch_x86 *arch_x86, unsigned int data)
{
    BitVector_Bit_On(cpu, CPU_SSE41);
    BitVector_Bit_On(cpu, CPU_SSE42);
}

static void
x86_cpu_clear_sse4(wordptr cpu, yasm_arch_x86 *arch_x86, unsigned int data)
{
    BitVector_Bit_Off(cpu, CPU_SSE41);
    BitVector_Bit_Off(cpu, CPU_SSE42);
}

static void
x86_nop(wordptr cpu, yasm_arch_x86 *arch_x86, unsigned int data)
{
    arch_x86->nop = data;
}

#line 262 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
struct cpu_parse_data {
    const char *name;
    void (*handler) (wordptr cpu, yasm_arch_x86 *arch_x86, unsigned int data);
    unsigned int data;
};
static const struct cpu_parse_data *
cpu_find(const char *key, size_t len)
{
  static const struct cpu_parse_data pd[179] = {
#line 423 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noeptvpid",	x86_cpu_clear,	CPU_EPTVPID},
#line 356 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"amd",		x86_cpu_set,	CPU_AMD},
#line 386 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"sse41",		x86_cpu_set,	CPU_SSE41},
#line 283 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"pentium",	x86_cpu_intel,	PROC_586},
#line 452 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"intelnop",	x86_nop,	X86_NOP_INTEL},
#line 406 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"pclmulqdq",	x86_cpu_set,	CPU_CLMUL},
#line 390 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"sse42",		x86_cpu_set,	CPU_SSE42},
#line 433 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nobmi2",		x86_cpu_clear,	CPU_BMI2},
#line 296 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"pentium3",	x86_cpu_intel,	PROC_p3},
#line 334 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"broadwell",	x86_cpu_intel,	PROC_broadwell},
#line 402 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"aes",		x86_cpu_set,	CPU_AES},
#line 422 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"eptvpid",	x86_cpu_set,	CPU_EPTVPID},
#line 414 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"f16c",		x86_cpu_set,	CPU_F16C},
#line 453 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"amdnop",		x86_nop,	X86_NOP_AMD},
#line 292 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"pentium-2",	x86_cpu_intel,	PROC_p2},
#line 341 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nofpu",		x86_cpu_clear,	CPU_FPU},
#line 432 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"bmi2",		x86_cpu_set,	CPU_BMI2},
#line 300 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"katmai",		x86_cpu_intel,	PROC_p3},
#line 298 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"pentiumiii",	x86_cpu_intel,	PROC_p3},
#line 340 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"fpu",		x86_cpu_set,	CPU_FPU},
#line 365 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noundoc",	x86_cpu_clear,	CPU_Undoc},
#line 353 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"no3dnow",	x86_cpu_clear,	CPU_3DNow},
#line 280 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"i486",		x86_cpu_intel,	PROC_486},
#line 367 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noundocumented",	x86_cpu_clear,	CPU_Undoc},
#line 344 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"sse",		x86_cpu_set,	CPU_SSE},
#line 383 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nossse3",	x86_cpu_clear,	CPU_SSSE3},
#line 405 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noclmul",	x86_cpu_clear,	CPU_CLMUL},
#line 428 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"tsx",		x86_cpu_set,	CPU_TSX},
#line 355 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nocyrix",	x86_cpu_clear,	CPU_Cyrix},
#line 345 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nosse",		x86_cpu_clear,	CPU_SSE},
#line 401 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nofma",		x86_cpu_clear,	CPU_FMA},
#line 321 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"phenom",		x86_cpu_amd,	PROC_k10},
#line 333 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"haswell",	x86_cpu_intel,	PROC_haswell},
#line 361 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noprot",		x86_cpu_clear,	CPU_Prot},
#line 378 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"padlock",	x86_cpu_set,	CPU_PadLock},
#line 407 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nopclmulqdq",	x86_cpu_clear,	CPU_CLMUL},
#line 413 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nofma4",		x86_cpu_clear,	CPU_FMA4},
#line 417 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nofsgsbase",	x86_cpu_clear,	CPU_FSGSBASE},
#line 360 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"prot",		x86_cpu_set,	CPU_Prot},
#line 316 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"opteron",	x86_cpu_amd,	PROC_hammer},
#line 415 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nof16c",		x86_cpu_clear,	CPU_F16C},
#line 277 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"i386",		x86_cpu_intel,	PROC_386},
#line 382 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"ssse3",		x86_cpu_set,	CPU_SSSE3},
#line 362 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"protected",	x86_cpu_set,	CPU_Prot},
#line 323 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"bulldozer",	x86_cpu_amd,	PROC_bulldozer},
#line 436 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"lzcnt",		x86_cpu_set,	CPU_LZCNT},
#line 368 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"obs",		x86_cpu_set,	CPU_Obs},
#line 363 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noprotected",	x86_cpu_clear,	CPU_Prot},
#line 318 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"athlon-64",	x86_cpu_amd,	PROC_hammer},
#line 366 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"undocumented",	x86_cpu_set,	CPU_Undoc},
#line 286 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"i686",		x86_cpu_intel,	PROC_686},
#line 313 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"k8",		x86_cpu_amd,	PROC_hammer},
#line 320 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"k10",		x86_cpu_amd,	PROC_k10},
#line 427 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noavx2",		x86_cpu_clear,	CPU_AVX2},
#line 331 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"sandybridge",	x86_cpu_intel,	PROC_sandybridge},
#line 343 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nommx",		x86_cpu_clear,	CPU_MMX},
#line 372 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"priv",		x86_cpu_set,	CPU_Priv},
#line 384 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"sse4.1",		x86_cpu_set,	CPU_SSE41},
#line 268 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"8086",		x86_cpu_intel,	PROC_8086},
#line 375 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noprivileged",	x86_cpu_clear,	CPU_Priv},
#line 282 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"i586",		x86_cpu_intel,	PROC_586},
#line 308 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"ia-64",		x86_cpu_ia64,	0},
#line 347 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nosse2",		x86_cpu_clear,	CPU_SSE2},
#line 370 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"obsolete",	x86_cpu_set,	CPU_Obs},
#line 269 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"186",		x86_cpu_intel,	PROC_186},
#line 392 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"sse4a",		x86_cpu_set,	CPU_SSE4a},
#line 307 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"ia64",		x86_cpu_ia64,	0},
#line 326 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"core2",		x86_cpu_intel,	PROC_conroe},
#line 421 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noxsaveopt",	x86_cpu_clear,	CPU_XSAVEOPT},
#line 388 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"sse4.2",		x86_cpu_set,	CPU_SSE42},
#line 324 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"prescott",	x86_cpu_intel,	PROC_prescott},
#line 426 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"avx2",		x86_cpu_set,	CPU_AVX2},
#line 270 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"80186",		x86_cpu_intel,	PROC_186},
#line 373 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nopriv",		x86_cpu_clear,	CPU_Priv},
#line 385 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nosse4.1",	x86_cpu_clear,	CPU_SSE41},
#line 445 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nordseed",	x86_cpu_clear,	CPU_RDSEED},
#line 291 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"pentium2",	x86_cpu_intel,	PROC_p2},
#line 325 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"conroe",		x86_cpu_intel,	PROC_conroe},
#line 391 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nosse42",	x86_cpu_clear,	CPU_SSE42},
#line 294 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"pentium-ii",	x86_cpu_intel,	PROC_p2},
#line 376 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"svm",		x86_cpu_set,	CPU_SVM},
#line 275 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"386",		x86_cpu_intel,	PROC_386},
#line 380 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"em64t",		x86_cpu_set,	CPU_EM64T},
#line 290 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"p2",		x86_cpu_intel,	PROC_p2},
#line 317 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"athlon64",	x86_cpu_amd,	PROC_hammer},
#line 352 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"3dnow",		x86_cpu_set,	CPU_3DNow},
#line 395 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nosse4",		x86_cpu_clear_sse4,	0},
#line 425 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nosmx",		x86_cpu_clear,	CPU_SMX},
#line 306 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"williamette",	x86_cpu_intel,	PROC_p4},
#line 322 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"family10h",	x86_cpu_amd,	PROC_k10},
#line 312 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"athlon",		x86_cpu_amd,	PROC_k7},
#line 281 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"586",		x86_cpu_intel,	PROC_586},
#line 285 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"686",		x86_cpu_intel,	PROC_686},
#line 358 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"smm",		x86_cpu_set,	CPU_SMM},
#line 396 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"xsave",		x86_cpu_set,	CPU_XSAVE},
#line 374 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"privileged",	x86_cpu_set,	CPU_Priv},
#line 287 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"p6",		x86_cpu_intel,	PROC_686},
#line 442 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"smap",		x86_cpu_set,	CPU_SMAP},
#line 398 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"avx",		x86_cpu_set,	CPU_AVX},
#line 303 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"pentium-4",	x86_cpu_intel,	PROC_p4},
#line 293 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"pentiumii",	x86_cpu_intel,	PROC_p2},
#line 440 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"sha",		x86_cpu_set,	CPU_SHA},
#line 412 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"fma4",		x86_cpu_set,	CPU_FMA4},
#line 299 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"pentium-iii",	x86_cpu_intel,	PROC_p3},
#line 335 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"skylake",	x86_cpu_intel,	PROC_skylake},
#line 389 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nosse4.2",	x86_cpu_clear,	CPU_SSE42},
#line 302 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"pentium4",	x86_cpu_intel,	PROC_p4},
#line 403 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noaes",		x86_cpu_clear,	CPU_AES},
#line 271 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"i186",		x86_cpu_intel,	PROC_186},
#line 418 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"rdrand",		x86_cpu_set,	CPU_RDRAND},
#line 273 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"80286",		x86_cpu_intel,	PROC_286},
#line 304 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"pentiumiv",	x86_cpu_intel,	PROC_p4},
#line 410 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"xop",		x86_cpu_set,	CPU_XOP},
#line 342 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"mmx",		x86_cpu_set,	CPU_MMX},
#line 278 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"486",		x86_cpu_intel,	PROC_486},
#line 315 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"clawhammer",	x86_cpu_amd,	PROC_hammer},
#line 444 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"rdseed",		x86_cpu_set,	CPU_RDSEED},
#line 274 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"i286",		x86_cpu_intel,	PROC_286},
#line 448 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"prfchw",		x86_cpu_set,	CPU_PRFCHW},
#line 349 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nosse3",		x86_cpu_clear,	CPU_SSE3},
#line 394 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"sse4",		x86_cpu_set_sse4,	0},
#line 305 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"pentium-iv",	x86_cpu_intel,	PROC_p4},
#line 301 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"p4",		x86_cpu_intel,	PROC_p4},
#line 419 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nordrand",	x86_cpu_clear,	CPU_RDRAND},
#line 288 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"ppro",		x86_cpu_intel,	PROC_686},
#line 284 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"p5",		x86_cpu_intel,	PROC_586},
#line 439 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"notbm",	x86_cpu_clear,	CPU_TBM},
#line 354 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"cyrix",		x86_cpu_set,	CPU_Cyrix},
#line 276 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"80386",		x86_cpu_intel,	PROC_386},
#line 310 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"k6",		x86_cpu_amd,	PROC_k6},
#line 451 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"basicnop",	x86_nop,	X86_NOP_BASIC},
#line 409 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nomovbe",	x86_cpu_clear,	CPU_MOVBE},
#line 447 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noadx",		x86_cpu_clear,	CPU_ADX},
#line 443 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nosmap",		x86_cpu_clear,	CPU_SMAP},
#line 359 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nosmm",		x86_cpu_clear,	CPU_SMM},
#line 420 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"xsaveopt",	x86_cpu_set,	CPU_XSAVEOPT},
#line 297 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"pentium-3",	x86_cpu_intel,	PROC_p3},
#line 377 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nosvm",		x86_cpu_clear,	CPU_SVM},
#line 441 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nosha",		x86_cpu_clear,	CPU_SHA},
#line 434 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"invpcid",	x86_cpu_set,	CPU_INVPCID},
#line 431 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nobmi1",		x86_cpu_clear,	CPU_BMI1},
#line 332 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"ivybridge",	x86_cpu_intel,	PROC_ivybridge},
#line 295 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"p3",		x86_cpu_intel,	PROC_p3},
#line 289 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"pentiumpro",	x86_cpu_intel,	PROC_686},
#line 327 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"penryn",		x86_cpu_intel,	PROC_penryn},
#line 279 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"80486",		x86_cpu_intel,	PROC_486},
#line 411 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noxop",		x86_cpu_clear,	CPU_XOP},
#line 364 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"undoc",		x86_cpu_set,	CPU_Undoc},
#line 371 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noobsolete",	x86_cpu_clear,	CPU_Obs},
#line 399 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noavx",		x86_cpu_clear,	CPU_AVX},
#line 437 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nolzcnt",	x86_cpu_clear,	CPU_LZCNT},
#line 449 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noprfchw",	x86_cpu_clear,	CPU_PRFCHW},
#line 429 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"notsx",		x86_cpu_clear,	CPU_TSX},
#line 430 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"bmi1",		x86_cpu_set,	CPU_BMI1},
#line 309 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"itanium",	x86_cpu_ia64,	0},
#line 319 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"venice",		x86_cpu_amd,	PROC_venice},
#line 397 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noxsave",	x86_cpu_clear,	CPU_XSAVE},
#line 357 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noamd",		x86_cpu_clear,	CPU_AMD},
#line 369 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noobs",		x86_cpu_clear,	CPU_Obs},
#line 381 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noem64t",	x86_cpu_clear,	CPU_EM64T},
#line 314 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"hammer",		x86_cpu_amd,	PROC_hammer},
#line 328 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nehalem",	x86_cpu_intel,	PROC_nehalem},
#line 348 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"sse3",		x86_cpu_set,	CPU_SSE3},
#line 346 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"sse2",		x86_cpu_set,	CPU_SSE2},
#line 404 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"clmul",		x86_cpu_set,	CPU_CLMUL},
#line 424 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"smx",		x86_cpu_set,	CPU_SMX},
#line 393 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nosse4a",	x86_cpu_clear,	CPU_SSE4a},
#line 438 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"tbm",		x86_cpu_set,	CPU_TBM},
#line 400 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"fma",		x86_cpu_set,	CPU_FMA},
#line 379 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nopadlock",	x86_cpu_clear,	CPU_PadLock},
#line 387 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"nosse41",	x86_cpu_clear,	CPU_SSE41},
#line 446 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"adx",		x86_cpu_set,	CPU_ADX},
#line 330 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"westmere",	x86_cpu_intel,	PROC_westmere},
#line 311 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"k7",		x86_cpu_amd,	PROC_k7},
#line 435 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"noinvpcid",	x86_cpu_clear,	CPU_INVPCID},
#line 416 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"fsgsbase",	x86_cpu_set,	CPU_FSGSBASE},
#line 329 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"corei7",		x86_cpu_intel,	PROC_nehalem},
#line 408 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"movbe",		x86_cpu_set,	CPU_MOVBE},
#line 272 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"
    {"286",		x86_cpu_intel,	PROC_286}
  };
  static const unsigned char tab[] = {
    183,125,113,40,125,0,0,0,183,146,116,85,0,113,113,183,
    113,131,0,82,88,0,131,125,85,0,113,0,0,7,0,40,
    22,7,0,0,125,220,87,183,184,7,0,0,0,113,11,0,
    84,0,0,0,0,131,0,113,0,120,0,113,0,0,51,11,
    55,190,0,0,183,61,120,131,85,135,0,0,0,0,0,82,
    74,183,0,87,220,0,235,0,220,229,0,0,220,243,124,145,
    0,220,131,0,221,0,0,0,237,0,135,125,124,168,0,69,
    0,124,22,0,131,131,163,113,184,214,155,133,55,0,0,0,
  };

  const struct cpu_parse_data *ret;
  unsigned long rsl, val = phash_lookup(key, len, 0xdaa66d2bUL);
  rsl = ((val>>25)^tab[val&0x7f]);
  if (rsl >= 179) return NULL;
  ret = &pd[rsl];
  if (strcmp(key, ret->name) != 0) return NULL;
  return ret;
}

#line 454 "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/yasm/../../3rdplibs/yasm/modules/arch/x86/x86cpu.gperf"


void
yasm_x86__parse_cpu(yasm_arch_x86 *arch_x86, const char *cpuid,
                    size_t cpuid_len)
{
    /*@null@*/ const struct cpu_parse_data *pdata;
    wordptr new_cpu;
    size_t i;
    static char lcaseid[16];

    if (cpuid_len > 15)
        return;
    for (i=0; i<cpuid_len; i++)
        lcaseid[i] = tolower(cpuid[i]);
    lcaseid[cpuid_len] = '\0';

    pdata = cpu_find(lcaseid, cpuid_len);
    if (!pdata) {
        yasm_warn_set(YASM_WARN_GENERAL,
                      N_("unrecognized CPU identifier `%s'"), cpuid);
        return;
    }

    new_cpu = BitVector_Clone(arch_x86->cpu_enables[arch_x86->active_cpu]);
    pdata->handler(new_cpu, arch_x86, pdata->data);

    /* try to find an existing match in the CPU table first */
    for (i=0; i<arch_x86->cpu_enables_size; i++) {
        if (BitVector_equal(arch_x86->cpu_enables[i], new_cpu)) {
            arch_x86->active_cpu = i;
            BitVector_Destroy(new_cpu);
            return;
        }
    }

    /* not found, need to add a new entry */
    arch_x86->active_cpu = arch_x86->cpu_enables_size++;
    arch_x86->cpu_enables =
        yasm_xrealloc(arch_x86->cpu_enables,
                      arch_x86->cpu_enables_size*sizeof(wordptr));
    arch_x86->cpu_enables[arch_x86->active_cpu] = new_cpu;
}
