; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_31_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
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
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !36, metadata !DIExpression()), !dbg !38
  %3 = load i64*, i64** %data, align 8, !dbg !39
  store i64* %3, i64** %dataCopy, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !40, metadata !DIExpression()), !dbg !41
  %4 = load i64*, i64** %dataCopy, align 8, !dbg !42
  store i64* %4, i64** %data1, align 8, !dbg !41
  %5 = load i64*, i64** %data1, align 8, !dbg !43
  %6 = load i64, i64* %5, align 8, !dbg !44
  call void @printLongLongLine(i64 %6), !dbg !45
  %7 = load i64*, i64** %data1, align 8, !dbg !46
  %8 = bitcast i64* %7 to i8*, !dbg !46
  call void @free(i8* %8) #5, !dbg !47
  ret void, !dbg !48
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_31_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_31_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_31_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i64*, align 8
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i64* null, i64** %data, align 8, !dbg !76
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !77
  %0 = bitcast i8* %call to i64*, !dbg !78
  store i64* %0, i64** %data, align 8, !dbg !79
  %1 = load i64*, i64** %data, align 8, !dbg !80
  %cmp = icmp eq i64* %1, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !86
  store i64 2147483643, i64* %2, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !88, metadata !DIExpression()), !dbg !90
  %3 = load i64*, i64** %data, align 8, !dbg !91
  store i64* %3, i64** %dataCopy, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !92, metadata !DIExpression()), !dbg !93
  %4 = load i64*, i64** %dataCopy, align 8, !dbg !94
  store i64* %4, i64** %data1, align 8, !dbg !93
  %5 = load i64*, i64** %data1, align 8, !dbg !95
  %6 = load i64, i64* %5, align 8, !dbg !96
  call void @printLongLongLine(i64 %6), !dbg !97
  %7 = load i64*, i64** %data1, align 8, !dbg !98
  %8 = bitcast i64* %7 to i8*, !dbg !98
  call void @free(i8* %8) #5, !dbg !99
  ret void, !dbg !100
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 43, baseType: !9)
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_31_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_31.c", directory: "/root/SSE-Assessment")
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
!36 = !DILocalVariable(name: "dataCopy", scope: !37, file: !19, line: 32, type: !4)
!37 = distinct !DILexicalBlock(scope: !18, file: !19, line: 31, column: 5)
!38 = !DILocation(line: 32, column: 19, scope: !37)
!39 = !DILocation(line: 32, column: 30, scope: !37)
!40 = !DILocalVariable(name: "data", scope: !37, file: !19, line: 33, type: !4)
!41 = !DILocation(line: 33, column: 19, scope: !37)
!42 = !DILocation(line: 33, column: 26, scope: !37)
!43 = !DILocation(line: 35, column: 28, scope: !37)
!44 = !DILocation(line: 35, column: 27, scope: !37)
!45 = !DILocation(line: 35, column: 9, scope: !37)
!46 = !DILocation(line: 36, column: 14, scope: !37)
!47 = !DILocation(line: 36, column: 9, scope: !37)
!48 = !DILocation(line: 38, column: 1, scope: !18)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_31_good", scope: !19, file: !19, line: 63, type: !20, scopeLine: 64, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 65, column: 5, scope: !49)
!51 = !DILocation(line: 66, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 77, type: !53, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !19, line: 77, type: !55)
!60 = !DILocation(line: 77, column: 14, scope: !52)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !19, line: 77, type: !56)
!62 = !DILocation(line: 77, column: 27, scope: !52)
!63 = !DILocation(line: 80, column: 22, scope: !52)
!64 = !DILocation(line: 80, column: 12, scope: !52)
!65 = !DILocation(line: 80, column: 5, scope: !52)
!66 = !DILocation(line: 82, column: 5, scope: !52)
!67 = !DILocation(line: 83, column: 5, scope: !52)
!68 = !DILocation(line: 84, column: 5, scope: !52)
!69 = !DILocation(line: 87, column: 5, scope: !52)
!70 = !DILocation(line: 88, column: 5, scope: !52)
!71 = !DILocation(line: 89, column: 5, scope: !52)
!72 = !DILocation(line: 91, column: 5, scope: !52)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 45, type: !20, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !19, line: 47, type: !4)
!75 = !DILocation(line: 47, column: 15, scope: !73)
!76 = !DILocation(line: 49, column: 10, scope: !73)
!77 = !DILocation(line: 51, column: 23, scope: !73)
!78 = !DILocation(line: 51, column: 12, scope: !73)
!79 = !DILocation(line: 51, column: 10, scope: !73)
!80 = !DILocation(line: 52, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !73, file: !19, line: 52, column: 9)
!82 = !DILocation(line: 52, column: 14, scope: !81)
!83 = !DILocation(line: 52, column: 9, scope: !73)
!84 = !DILocation(line: 52, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !19, line: 52, column: 23)
!86 = !DILocation(line: 53, column: 6, scope: !73)
!87 = !DILocation(line: 53, column: 11, scope: !73)
!88 = !DILocalVariable(name: "dataCopy", scope: !89, file: !19, line: 55, type: !4)
!89 = distinct !DILexicalBlock(scope: !73, file: !19, line: 54, column: 5)
!90 = !DILocation(line: 55, column: 19, scope: !89)
!91 = !DILocation(line: 55, column: 30, scope: !89)
!92 = !DILocalVariable(name: "data", scope: !89, file: !19, line: 56, type: !4)
!93 = !DILocation(line: 56, column: 19, scope: !89)
!94 = !DILocation(line: 56, column: 26, scope: !89)
!95 = !DILocation(line: 58, column: 28, scope: !89)
!96 = !DILocation(line: 58, column: 27, scope: !89)
!97 = !DILocation(line: 58, column: 9, scope: !89)
!98 = !DILocation(line: 59, column: 14, scope: !89)
!99 = !DILocation(line: 59, column: 9, scope: !89)
!100 = !DILocation(line: 61, column: 1, scope: !73)
