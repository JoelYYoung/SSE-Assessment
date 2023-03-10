; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  store i64* null, i64** %data, align 8, !dbg !23
  %0 = load i64*, i64** %data, align 8, !dbg !24
  %call = call i64* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61b_badSource(i64* %0), !dbg !25
  store i64* %call, i64** %data, align 8, !dbg !26
  %1 = load i64*, i64** %data, align 8, !dbg !27
  %2 = load i64, i64* %1, align 8, !dbg !28
  call void @printLongLongLine(i64 %2), !dbg !29
  %3 = load i64*, i64** %data, align 8, !dbg !30
  %4 = bitcast i64* %3 to i8*, !dbg !30
  call void @free(i8* %4) #4, !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61b_badSource(i64*) #2

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61_good() #0 !dbg !33 {
entry:
  call void @goodG2B(), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !36 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !43, metadata !DIExpression()), !dbg !44
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %call = call i64 @time(i64* null) #4, !dbg !47
  %conv = trunc i64 %call to i32, !dbg !48
  call void @srand(i32 %conv) #4, !dbg !49
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !50
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61_good(), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !53
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61_bad(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !55
  ret i32 0, !dbg !56
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !57 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !58, metadata !DIExpression()), !dbg !59
  store i64* null, i64** %data, align 8, !dbg !60
  %0 = load i64*, i64** %data, align 8, !dbg !61
  %call = call i64* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61b_goodG2BSource(i64* %0), !dbg !62
  store i64* %call, i64** %data, align 8, !dbg !63
  %1 = load i64*, i64** %data, align 8, !dbg !64
  %2 = load i64, i64* %1, align 8, !dbg !65
  call void @printLongLongLine(i64 %2), !dbg !66
  %3 = load i64*, i64** %data, align 8, !dbg !67
  %4 = bitcast i64* %3 to i8*, !dbg !67
  call void @free(i8* %4) #4, !dbg !68
  ret void, !dbg !69
}

declare dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61b_goodG2BSource(i64*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61_bad", scope: !12, file: !12, line: 24, type: !13, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 44, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 26, column: 15, scope: !11)
!23 = !DILocation(line: 28, column: 10, scope: !11)
!24 = !DILocation(line: 29, column: 76, scope: !11)
!25 = !DILocation(line: 29, column: 12, scope: !11)
!26 = !DILocation(line: 29, column: 10, scope: !11)
!27 = !DILocation(line: 31, column: 24, scope: !11)
!28 = !DILocation(line: 31, column: 23, scope: !11)
!29 = !DILocation(line: 31, column: 5, scope: !11)
!30 = !DILocation(line: 32, column: 10, scope: !11)
!31 = !DILocation(line: 32, column: 5, scope: !11)
!32 = !DILocation(line: 33, column: 1, scope: !11)
!33 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_61_good", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DILocation(line: 55, column: 5, scope: !33)
!35 = !DILocation(line: 56, column: 1, scope: !33)
!36 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 68, type: !37, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{!39, !39, !40}
!39 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!43 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !12, line: 68, type: !39)
!44 = !DILocation(line: 68, column: 14, scope: !36)
!45 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !12, line: 68, type: !40)
!46 = !DILocation(line: 68, column: 27, scope: !36)
!47 = !DILocation(line: 71, column: 22, scope: !36)
!48 = !DILocation(line: 71, column: 12, scope: !36)
!49 = !DILocation(line: 71, column: 5, scope: !36)
!50 = !DILocation(line: 73, column: 5, scope: !36)
!51 = !DILocation(line: 74, column: 5, scope: !36)
!52 = !DILocation(line: 75, column: 5, scope: !36)
!53 = !DILocation(line: 78, column: 5, scope: !36)
!54 = !DILocation(line: 79, column: 5, scope: !36)
!55 = !DILocation(line: 80, column: 5, scope: !36)
!56 = !DILocation(line: 82, column: 5, scope: !36)
!57 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 42, type: !13, scopeLine: 43, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocalVariable(name: "data", scope: !57, file: !12, line: 44, type: !16)
!59 = !DILocation(line: 44, column: 15, scope: !57)
!60 = !DILocation(line: 46, column: 10, scope: !57)
!61 = !DILocation(line: 47, column: 80, scope: !57)
!62 = !DILocation(line: 47, column: 12, scope: !57)
!63 = !DILocation(line: 47, column: 10, scope: !57)
!64 = !DILocation(line: 49, column: 24, scope: !57)
!65 = !DILocation(line: 49, column: 23, scope: !57)
!66 = !DILocation(line: 49, column: 5, scope: !57)
!67 = !DILocation(line: 50, column: 10, scope: !57)
!68 = !DILocation(line: 50, column: 5, scope: !57)
!69 = !DILocation(line: 51, column: 1, scope: !57)
