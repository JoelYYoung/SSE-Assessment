; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !23, metadata !DIExpression()), !dbg !30
  store i64* null, i64** %data, align 8, !dbg !31
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_badGlobal, align 4, !dbg !32
  %0 = load i64*, i64** %data, align 8, !dbg !33
  %call = call i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_badSource(i64* %0), !dbg !34
  store i64* %call, i64** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !41
  %2 = load i64*, i64** %data, align 8, !dbg !42
  %3 = bitcast i64* %2 to i8*, !dbg !43
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !43
  %4 = bitcast i64* %arraydecay to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !43
  %5 = load i64*, i64** %data, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !44
  %6 = load i64, i64* %arrayidx, align 8, !dbg !44
  call void @printLongLongLine(i64 %6), !dbg !45
  %7 = load i64*, i64** %data, align 8, !dbg !46
  %8 = bitcast i64* %7 to i8*, !dbg !46
  call void @free(i8* %8) #6, !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_badSource(i64*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #6, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #6, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i64* null, i64** %data, align 8, !dbg !76
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_goodG2B1Global, align 4, !dbg !77
  %0 = load i64*, i64** %data, align 8, !dbg !78
  %call = call i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_goodG2B1Source(i64* %0), !dbg !79
  store i64* %call, i64** %data, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !81, metadata !DIExpression()), !dbg !83
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !83
  %2 = load i64*, i64** %data, align 8, !dbg !84
  %3 = bitcast i64* %2 to i8*, !dbg !85
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !85
  %4 = bitcast i64* %arraydecay to i8*, !dbg !85
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !85
  %5 = load i64*, i64** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !86
  %6 = load i64, i64* %arrayidx, align 8, !dbg !86
  call void @printLongLongLine(i64 %6), !dbg !87
  %7 = load i64*, i64** %data, align 8, !dbg !88
  %8 = bitcast i64* %7 to i8*, !dbg !88
  call void @free(i8* %8) #6, !dbg !89
  ret void, !dbg !90
}

declare dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_goodG2B1Source(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !91 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i64* null, i64** %data, align 8, !dbg !94
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_goodG2B2Global, align 4, !dbg !95
  %0 = load i64*, i64** %data, align 8, !dbg !96
  %call = call i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_goodG2B2Source(i64* %0), !dbg !97
  store i64* %call, i64** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !101
  %2 = load i64*, i64** %data, align 8, !dbg !102
  %3 = bitcast i64* %2 to i8*, !dbg !103
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !103
  %4 = bitcast i64* %arraydecay to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !103
  %5 = load i64*, i64** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !104
  %6 = load i64, i64* %arrayidx, align 8, !dbg !104
  call void @printLongLongLine(i64 %6), !dbg !105
  %7 = load i64*, i64** %data, align 8, !dbg !106
  %8 = bitcast i64* %7 to i8*, !dbg !106
  call void @free(i8* %8) #6, !dbg !107
  ret void, !dbg !108
}

declare dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_goodG2B2Source(i64*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_badGlobal", scope: !2, file: !10, line: 22, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_goodG2B1Global", scope: !2, file: !10, line: 46, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_goodG2B2Global", scope: !2, file: !10, line: 47, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_bad", scope: !10, file: !10, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 28, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !26, line: 27, baseType: !27)
!26 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !28, line: 44, baseType: !29)
!28 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!29 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!30 = !DILocation(line: 28, column: 15, scope: !20)
!31 = !DILocation(line: 29, column: 10, scope: !20)
!32 = !DILocation(line: 30, column: 77, scope: !20)
!33 = !DILocation(line: 31, column: 84, scope: !20)
!34 = !DILocation(line: 31, column: 12, scope: !20)
!35 = !DILocation(line: 31, column: 10, scope: !20)
!36 = !DILocalVariable(name: "source", scope: !37, file: !10, line: 33, type: !38)
!37 = distinct !DILexicalBlock(scope: !20, file: !10, line: 32, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 6400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 33, column: 17, scope: !37)
!42 = !DILocation(line: 35, column: 16, scope: !37)
!43 = !DILocation(line: 35, column: 9, scope: !37)
!44 = !DILocation(line: 36, column: 27, scope: !37)
!45 = !DILocation(line: 36, column: 9, scope: !37)
!46 = !DILocation(line: 37, column: 14, scope: !37)
!47 = !DILocation(line: 37, column: 9, scope: !37)
!48 = !DILocation(line: 39, column: 1, scope: !20)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_22_good", scope: !10, file: !10, line: 85, type: !21, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DILocation(line: 87, column: 5, scope: !49)
!51 = !DILocation(line: 88, column: 5, scope: !49)
!52 = !DILocation(line: 89, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 101, type: !54, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!11, !11, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !10, line: 101, type: !11)
!60 = !DILocation(line: 101, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !10, line: 101, type: !56)
!62 = !DILocation(line: 101, column: 27, scope: !53)
!63 = !DILocation(line: 104, column: 22, scope: !53)
!64 = !DILocation(line: 104, column: 12, scope: !53)
!65 = !DILocation(line: 104, column: 5, scope: !53)
!66 = !DILocation(line: 106, column: 5, scope: !53)
!67 = !DILocation(line: 107, column: 5, scope: !53)
!68 = !DILocation(line: 108, column: 5, scope: !53)
!69 = !DILocation(line: 111, column: 5, scope: !53)
!70 = !DILocation(line: 112, column: 5, scope: !53)
!71 = !DILocation(line: 113, column: 5, scope: !53)
!72 = !DILocation(line: 115, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 52, type: !21, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocalVariable(name: "data", scope: !73, file: !10, line: 54, type: !24)
!75 = !DILocation(line: 54, column: 15, scope: !73)
!76 = !DILocation(line: 55, column: 10, scope: !73)
!77 = !DILocation(line: 56, column: 82, scope: !73)
!78 = !DILocation(line: 57, column: 89, scope: !73)
!79 = !DILocation(line: 57, column: 12, scope: !73)
!80 = !DILocation(line: 57, column: 10, scope: !73)
!81 = !DILocalVariable(name: "source", scope: !82, file: !10, line: 59, type: !38)
!82 = distinct !DILexicalBlock(scope: !73, file: !10, line: 58, column: 5)
!83 = !DILocation(line: 59, column: 17, scope: !82)
!84 = !DILocation(line: 61, column: 16, scope: !82)
!85 = !DILocation(line: 61, column: 9, scope: !82)
!86 = !DILocation(line: 62, column: 27, scope: !82)
!87 = !DILocation(line: 62, column: 9, scope: !82)
!88 = !DILocation(line: 63, column: 14, scope: !82)
!89 = !DILocation(line: 63, column: 9, scope: !82)
!90 = !DILocation(line: 65, column: 1, scope: !73)
!91 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 70, type: !21, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DILocalVariable(name: "data", scope: !91, file: !10, line: 72, type: !24)
!93 = !DILocation(line: 72, column: 15, scope: !91)
!94 = !DILocation(line: 73, column: 10, scope: !91)
!95 = !DILocation(line: 74, column: 82, scope: !91)
!96 = !DILocation(line: 75, column: 89, scope: !91)
!97 = !DILocation(line: 75, column: 12, scope: !91)
!98 = !DILocation(line: 75, column: 10, scope: !91)
!99 = !DILocalVariable(name: "source", scope: !100, file: !10, line: 77, type: !38)
!100 = distinct !DILexicalBlock(scope: !91, file: !10, line: 76, column: 5)
!101 = !DILocation(line: 77, column: 17, scope: !100)
!102 = !DILocation(line: 79, column: 16, scope: !100)
!103 = !DILocation(line: 79, column: 9, scope: !100)
!104 = !DILocation(line: 80, column: 27, scope: !100)
!105 = !DILocation(line: 80, column: 9, scope: !100)
!106 = !DILocation(line: 81, column: 14, scope: !100)
!107 = !DILocation(line: 81, column: 9, scope: !100)
!108 = !DILocation(line: 83, column: 1, scope: !91)
