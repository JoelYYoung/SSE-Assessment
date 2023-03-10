; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_badGlobal, align 4, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_badSource(i32* %0), !dbg !29
  store i32* %call, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !36
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %3 = bitcast i32* %2 to i8*, !dbg !38
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !38
  %4 = bitcast i32* %arraydecay to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !38
  %5 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !39
  %6 = load i32, i32* %arrayidx, align 4, !dbg !39
  call void @printIntLine(i32 %6), !dbg !40
  %7 = load i32*, i32** %data, align 8, !dbg !41
  %8 = bitcast i32* %7 to i8*, !dbg !41
  call void @free(i8* %8) #6, !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_good() #0 !dbg !44 {
entry:
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #6, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #6, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !68 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !69, metadata !DIExpression()), !dbg !70
  store i32* null, i32** %data, align 8, !dbg !71
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B1Global, align 4, !dbg !72
  %0 = load i32*, i32** %data, align 8, !dbg !73
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B1Source(i32* %0), !dbg !74
  store i32* %call, i32** %data, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !76, metadata !DIExpression()), !dbg !78
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !78
  %2 = load i32*, i32** %data, align 8, !dbg !79
  %3 = bitcast i32* %2 to i8*, !dbg !80
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !80
  %4 = bitcast i32* %arraydecay to i8*, !dbg !80
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !80
  %5 = load i32*, i32** %data, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !81
  %6 = load i32, i32* %arrayidx, align 4, !dbg !81
  call void @printIntLine(i32 %6), !dbg !82
  %7 = load i32*, i32** %data, align 8, !dbg !83
  %8 = bitcast i32* %7 to i8*, !dbg !83
  call void @free(i8* %8) #6, !dbg !84
  ret void, !dbg !85
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i32* null, i32** %data, align 8, !dbg !89
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B2Global, align 4, !dbg !90
  %0 = load i32*, i32** %data, align 8, !dbg !91
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B2Source(i32* %0), !dbg !92
  store i32* %call, i32** %data, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !96
  %2 = load i32*, i32** %data, align 8, !dbg !97
  %3 = bitcast i32* %2 to i8*, !dbg !98
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !98
  %4 = bitcast i32* %arraydecay to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !98
  %5 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !99
  %6 = load i32, i32* %arrayidx, align 4, !dbg !99
  call void @printIntLine(i32 %6), !dbg !100
  %7 = load i32*, i32** %data, align 8, !dbg !101
  %8 = bitcast i32* %7 to i8*, !dbg !101
  call void @free(i8* %8) #6, !dbg !102
  ret void, !dbg !103
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B2Source(i32*) #2

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
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_badGlobal", scope: !2, file: !10, line: 22, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B1Global", scope: !2, file: !10, line: 46, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_goodG2B2Global", scope: !2, file: !10, line: 47, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_bad", scope: !10, file: !10, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 28, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!25 = !DILocation(line: 28, column: 11, scope: !20)
!26 = !DILocation(line: 29, column: 10, scope: !20)
!27 = !DILocation(line: 30, column: 73, scope: !20)
!28 = !DILocation(line: 31, column: 80, scope: !20)
!29 = !DILocation(line: 31, column: 12, scope: !20)
!30 = !DILocation(line: 31, column: 10, scope: !20)
!31 = !DILocalVariable(name: "source", scope: !32, file: !10, line: 33, type: !33)
!32 = distinct !DILexicalBlock(scope: !20, file: !10, line: 32, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 33, column: 13, scope: !32)
!37 = !DILocation(line: 35, column: 16, scope: !32)
!38 = !DILocation(line: 35, column: 9, scope: !32)
!39 = !DILocation(line: 36, column: 22, scope: !32)
!40 = !DILocation(line: 36, column: 9, scope: !32)
!41 = !DILocation(line: 37, column: 14, scope: !32)
!42 = !DILocation(line: 37, column: 9, scope: !32)
!43 = !DILocation(line: 39, column: 1, scope: !20)
!44 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_22_good", scope: !10, file: !10, line: 85, type: !21, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 87, column: 5, scope: !44)
!46 = !DILocation(line: 88, column: 5, scope: !44)
!47 = !DILocation(line: 89, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 101, type: !49, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DISubroutineType(types: !50)
!50 = !{!11, !11, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !10, line: 101, type: !11)
!55 = !DILocation(line: 101, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !10, line: 101, type: !51)
!57 = !DILocation(line: 101, column: 27, scope: !48)
!58 = !DILocation(line: 104, column: 22, scope: !48)
!59 = !DILocation(line: 104, column: 12, scope: !48)
!60 = !DILocation(line: 104, column: 5, scope: !48)
!61 = !DILocation(line: 106, column: 5, scope: !48)
!62 = !DILocation(line: 107, column: 5, scope: !48)
!63 = !DILocation(line: 108, column: 5, scope: !48)
!64 = !DILocation(line: 111, column: 5, scope: !48)
!65 = !DILocation(line: 112, column: 5, scope: !48)
!66 = !DILocation(line: 113, column: 5, scope: !48)
!67 = !DILocation(line: 115, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 52, type: !21, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocalVariable(name: "data", scope: !68, file: !10, line: 54, type: !24)
!70 = !DILocation(line: 54, column: 11, scope: !68)
!71 = !DILocation(line: 55, column: 10, scope: !68)
!72 = !DILocation(line: 56, column: 78, scope: !68)
!73 = !DILocation(line: 57, column: 85, scope: !68)
!74 = !DILocation(line: 57, column: 12, scope: !68)
!75 = !DILocation(line: 57, column: 10, scope: !68)
!76 = !DILocalVariable(name: "source", scope: !77, file: !10, line: 59, type: !33)
!77 = distinct !DILexicalBlock(scope: !68, file: !10, line: 58, column: 5)
!78 = !DILocation(line: 59, column: 13, scope: !77)
!79 = !DILocation(line: 61, column: 16, scope: !77)
!80 = !DILocation(line: 61, column: 9, scope: !77)
!81 = !DILocation(line: 62, column: 22, scope: !77)
!82 = !DILocation(line: 62, column: 9, scope: !77)
!83 = !DILocation(line: 63, column: 14, scope: !77)
!84 = !DILocation(line: 63, column: 9, scope: !77)
!85 = !DILocation(line: 65, column: 1, scope: !68)
!86 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 70, type: !21, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "data", scope: !86, file: !10, line: 72, type: !24)
!88 = !DILocation(line: 72, column: 11, scope: !86)
!89 = !DILocation(line: 73, column: 10, scope: !86)
!90 = !DILocation(line: 74, column: 78, scope: !86)
!91 = !DILocation(line: 75, column: 85, scope: !86)
!92 = !DILocation(line: 75, column: 12, scope: !86)
!93 = !DILocation(line: 75, column: 10, scope: !86)
!94 = !DILocalVariable(name: "source", scope: !95, file: !10, line: 77, type: !33)
!95 = distinct !DILexicalBlock(scope: !86, file: !10, line: 76, column: 5)
!96 = !DILocation(line: 77, column: 13, scope: !95)
!97 = !DILocation(line: 79, column: 16, scope: !95)
!98 = !DILocation(line: 79, column: 9, scope: !95)
!99 = !DILocation(line: 80, column: 22, scope: !95)
!100 = !DILocation(line: 80, column: 9, scope: !95)
!101 = !DILocation(line: 81, column: 14, scope: !95)
!102 = !DILocation(line: 81, column: 9, scope: !95)
!103 = !DILocation(line: 83, column: 1, scope: !86)
