#pragma once

// Uses scalable allocator in release builds
#ifndef _DEBUG
#define malloc				scalable_malloc
#define _aligned_malloc		scalable_aligned_malloc
#define calloc				scalable_calloc
#define realloc				scalable_realloc
#define _aligned_realloc	scalable_aligned_realloc
#define free				scalable_free
#define _aligned_free		scalable_aligned_free
#define _msize				scalable_msize
#endif
