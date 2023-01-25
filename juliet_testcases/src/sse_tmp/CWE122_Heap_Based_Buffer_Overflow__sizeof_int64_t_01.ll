; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_01_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !25
  %0 = bitcast i8* %call to i64*, !dbg !26
  store i64* %0, i64** %data, align 8, !dbg !27
  %1 = load i64*, i64** %data, align 8, !dbg !28
  %cmp = icmp eq i64* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !34
  store i64 2147483643, i64* %2, align 8, !dbg !35
  %3 = load i64*, i64** %data, align 8, !dbg !36
  %4 = load i64, i64* %3, align 8, !dbg !37
  call void @printLongLongLine(i64 %4), !dbg !38
  %5 = load i64*, i64** %data, align 8, !dbg !39
  %6 = bitcast i64* %5 to i8*, !dbg !39
  call void @free(i8* %6) #5, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_01_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #5, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #5, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_01_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_01_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i64* null, i64** %data, align 8, !dbg !69
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !70
  %0 = bitcast i8* %call to i64*, !dbg !71
  store i64* %0, i64** %data, align 8, !dbg !72
  %1 = load i64*, i64** %data, align 8, !dbg !73
  %cmp = icmp eq i64* %1, null, !dbg !75
  br i1 %cmp, label %if.then, label %if.end, !dbg !76

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !77
  unreachable, !dbg !77

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !79
  store i64 2147483643, i64* %2, align 8, !dbg !80
  %3 = load i64*, i64** %data, align 8, !dbg !81
  %4 = load i64, i64* %3, align 8, !dbg !82
  call void @printLongLongLine(i64 %4), !dbg !83
  %5 = load i64*, i64** %data, align 8, !dbg !84
  %6 = bitcast i64* %5 to i8*, !dbg !84
  call void @free(i8* %6) #5, !dbg !85
  ret void, !dbg !86
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_01_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_01.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocation(line: 25, column: 10, scope: !18)
!25 = !DILocation(line: 28, column: 23, scope: !18)
!26 = !DILocation(line: 28, column: 12, scope: !18)
!27 = !DILocation(line: 28, column: 10, scope: !18)
!28 = !DILocation(line: 29, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 29, column: 9)
!30 = !DILocation(line: 29, column: 14, scope: !29)
!31 = !DILocation(line: 29, column: 9, scope: !18)
!32 = !DILocation(line: 29, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 29, column: 23)
!34 = !DILocation(line: 30, column: 6, scope: !18)
!35 = !DILocation(line: 30, column: 11, scope: !18)
!36 = !DILocation(line: 32, column: 24, scope: !18)
!37 = !DILocation(line: 32, column: 23, scope: !18)
!38 = !DILocation(line: 32, column: 5, scope: !18)
!39 = !DILocation(line: 33, column: 10, scope: !18)
!40 = !DILocation(line: 33, column: 5, scope: !18)
!41 = !DILocation(line: 34, column: 1, scope: !18)
!42 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_01_good", scope: !19, file: !19, line: 55, type: !20, scopeLine: 56, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 57, column: 5, scope: !42)
!44 = !DILocation(line: 58, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 70, type: !46, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !19, line: 70, type: !48)
!53 = !DILocation(line: 70, column: 14, scope: !45)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !19, line: 70, type: !49)
!55 = !DILocation(line: 70, column: 27, scope: !45)
!56 = !DILocation(line: 73, column: 22, scope: !45)
!57 = !DILocation(line: 73, column: 12, scope: !45)
!58 = !DILocation(line: 73, column: 5, scope: !45)
!59 = !DILocation(line: 75, column: 5, scope: !45)
!60 = !DILocation(line: 76, column: 5, scope: !45)
!61 = !DILocation(line: 77, column: 5, scope: !45)
!62 = !DILocation(line: 80, column: 5, scope: !45)
!63 = !DILocation(line: 81, column: 5, scope: !45)
!64 = !DILocation(line: 82, column: 5, scope: !45)
!65 = !DILocation(line: 84, column: 5, scope: !45)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 41, type: !20, scopeLine: 42, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !19, line: 43, type: !4)
!68 = !DILocation(line: 43, column: 15, scope: !66)
!69 = !DILocation(line: 45, column: 10, scope: !66)
!70 = !DILocation(line: 47, column: 23, scope: !66)
!71 = !DILocation(line: 47, column: 12, scope: !66)
!72 = !DILocation(line: 47, column: 10, scope: !66)
!73 = !DILocation(line: 48, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !66, file: !19, line: 48, column: 9)
!75 = !DILocation(line: 48, column: 14, scope: !74)
!76 = !DILocation(line: 48, column: 9, scope: !66)
!77 = !DILocation(line: 48, column: 24, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !19, line: 48, column: 23)
!79 = !DILocation(line: 49, column: 6, scope: !66)
!80 = !DILocation(line: 49, column: 11, scope: !66)
!81 = !DILocation(line: 51, column: 24, scope: !66)
!82 = !DILocation(line: 51, column: 23, scope: !66)
!83 = !DILocation(line: 51, column: 5, scope: !66)
!84 = !DILocation(line: 52, column: 10, scope: !66)
!85 = !DILocation(line: 52, column: 5, scope: !66)
!86 = !DILocation(line: 53, column: 1, scope: !66)
